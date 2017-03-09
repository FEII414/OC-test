//
//  DateTool.m
//  OC-test
//
//  Created by feii on 17/2/25.
//  Copyright © 2017年 feii. All rights reserved.
//

#import "DateTool.h"

@implementation DateTool

//将时间字符串转换成NSDate格式
+(NSDate *)dateWithDateString:(NSString *)dateString andFormatString:(NSString *)formatString{
    NSDate *tmpDate;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatString];
    tmpDate = [dateFormatter dateFromString:dateString];
    return tmpDate;
}

+ (NSInteger)compareDate:(NSDate*)fromDate to:(NSDate*)toDate{
    
    // 当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 需要对比的时间数据
    NSCalendarUnit unit = NSCalendarUnitDay;
    // 对比时间差
    NSDateComponents *dateCom;
    
    dateCom = [calendar components:unit fromDate:fromDate toDate:toDate options:0];
    return dateCom.day;
    
}
//格式化NSDate
+(NSString *)dateStringWithDate:(NSDate *)date andFormatString:(NSString *)formatString{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatString];
    NSString *dateString = [dateFormatter stringFromDate:date];
    //    NSLog(@"dateString:%@",dateString);
    return dateString;
}

//获取当前时间并进行格式化
+(NSString *)getCurrentDateWithFormatString:(NSString *)formatString{
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSString *currentDateString = [self dateStringWithDate:currentDate andFormatString:formatString];
    return currentDateString;
}

//获取上个月、下个月、年份
+ (NSString*)getYearOrMonth:(NSDate *)date nextOrLast:(NSString*)status yearOrMonth:(NSString*)returnStr{
    
    NSCalendar *calender = [NSCalendar currentCalendar];//获取NSCalender单例
    NSDateComponents *cmp = [calender components:(NSCalendarUnitMonth | NSCalendarUnitYear) fromDate:date];// 设置属性，因为我只需要年和月，这个属性还可以支持时，分，秒。
    if ([status isEqualToString:@"last"]) {
        [cmp setMonth:[cmp month] - 1];//设置上个月，即在现有的基础上减去一个月。这个地方可以灵活的支持跨年了，免去了繁琐的计算年份的工作。
    }
    if ([status isEqualToString:@"next"]) {
        [cmp setMonth:[cmp month] + 1];//设置下个月
    }
    
    NSDate *lastMonDate = [calender dateFromComponents:cmp];//拿到上个月的NSDate，再用NSDateFormatter就可以拿到单独的年和月了。
    
    if ([returnStr isEqualToString:@"year"]) {
        NSString *year = [self dateStringWithDate:lastMonDate andFormatString:@"yyyy"];
        NSLog(@"%@--year---%@",status,year);
        return year;
    }
    if ([returnStr isEqualToString:@"month"]) {
        NSString *month = [self dateStringWithDate:lastMonDate andFormatString:@"M"];
        NSLog(@"%@--month---%@",status,month);
        return month;
    }
    
    return @"输入数据错误";
}

@end
