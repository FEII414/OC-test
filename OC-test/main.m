//
//  main.m
//  OC-test
//
//  Created by feii on 17/2/22.
//  Copyright © 2017年 feii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DateTool.h"
#import "Mathematics.h"

NSMutableArray* toArray(NSMutableArray *array , NSString *string,NSString *index);
NSMutableArray* separateArray(NSMutableArray *originalArray);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSMutableArray *array = [[NSMutableArray alloc]init];
        [array addObject:@"5"];
        [array addObject:@"3"];
        [array addObject:@"3"];
        [array addObject:@"1"];
        [array addObject:@"5"];
        [array addObject:@"1"];
        [array addObject:@"1"];[array addObject:@"8"];[array addObject:@"9"];
//        array = toArray(array, @"10", @"suffix");
        array = separateArray(array);
        NSLog(@"testarray--%@----array.cout-%u",array,array.count);
        
        NSDate *fromDate = [NSDate date];
        NSDate *toDate = [DateTool dateWithDateString:@"2017-1-24" andFormatString:@"yyyy-MM-dd"];
        NSLog(@"返回天%ld--",[DateTool compareDate:fromDate to:toDate]);
        
        double testF =[Mathematics getWanSiSheWuRu:(float)1234653.23];

        NSLog(@"testfMYFEII--%f",testF);
        
        //工厂方法 凡是出现了大量的产品需要创建，并且具有共同的接口时，可以通过工厂方法模式进行创建
        CalculateMath *calculate = [Mathematics calculateAdd];
        float addF = [calculate equalsMath:12 with:13];
        NSLog(@"testCalculate--%f",addF);
        
        NSMutableArray *arrayHEE = [[NSMutableArray alloc]init];
        [arrayHEE addObject:@"hee"];
        
        NSMutableArray *arrayCopy = [arrayHEE mutableCopy];
        [arrayCopy addObject:@"helolo"];
        
        NSArray *arrayHH = @[@"arr"];
        NSArray *arrayHHCopy = [arrayHH copy];
        arrayHH = nil;
        
    }
    return 0;
}

NSMutableArray* separateArray(NSMutableArray *originalArray){
    
    NSMutableArray *arraySeparated = [[NSMutableArray alloc]init];
    
    while (originalArray.count != 0) {
        NSMutableArray *arraytemp = [[NSMutableArray alloc]init];
         int count = 0;
//        [originalArray enumerateObjectsUsingBlock:^(NSString* obj, NSUInteger idx, BOOL * _Nonnull stop)
        for (int i = 0; i < originalArray.count; i++) {
            
            if(arraytemp.count == 0){
                
                [arraytemp addObject:originalArray[i]];
                count++;
                [arraytemp addObject:[NSString stringWithFormat:@"%u",count]];
                [originalArray removeObjectAtIndex:i];
                i--;
                
            }else{
                
                if ([arraytemp[0] isEqualToString:originalArray[i]]) {
                    count++;
                    arraytemp[1] = [NSString stringWithFormat:@"%u",count];
                    [originalArray removeObjectAtIndex:i];
                    i--;
                    
                }
                
            }
            
        };
        [arraySeparated addObject:arraytemp];
    }
    
    return arraySeparated;
    
}

NSMutableArray* toArray(NSMutableArray *array , NSString *string,NSString *index){
    
    for (int i = 0; i < array.count; i ++) {
        
        NSString* stringT = array[i];
        NSLog(@"数字--%u",i);
        if([stringT isEqualToString:string]){
            
            if ([index isEqualToString:@"prefix"]) {
                for (int j = i; j > 0; j--) {
                    
                    array[j] = array[j-1];
                    
                }
                array[0] = string;
            }
            if ([index isEqualToString:@"suffix"]) {
                for (int j = i; j < array.count-1; j++) {
                    
                    array[j] = array[j+1];
                    
                }
                array[array.count-1] = string;
            }
            
            return array;
        }
        
    }
    
    return array;

    
}
