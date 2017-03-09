//
//  DateTool.h
//  OC-test
//
//  Created by feii on 17/2/25.
//  Copyright © 2017年 feii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateTool : NSObject

+(NSDate *)dateWithDateString:(NSString *)dateString andFormatString:(NSString *)formatString;
+ (NSInteger)compareDate:(NSDate*)fromDate to:(NSDate*)toDate;
+ (NSString*)getYearOrMonth:(NSDate *)date nextOrLast:(NSString*)status yearOrMonth:(NSString*)returnStr;

@end
