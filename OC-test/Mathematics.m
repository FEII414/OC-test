//
//  Mathematics.m
//  OC-test
//
//  Created by feii on 17/3/2.
//  Copyright © 2017年 feii. All rights reserved.
//

#import "Mathematics.h"

@implementation Mathematics


+(double)getWanSiSheWuRu:(double)number{
    
    number = (double)number/1000;
//    number =  (floorf(number*10 + 0.5))/10;
    number = round(number)/10;
    
    return number;
}

+(CalculateMath*)calculateAdd{
    
    return [[CalculateAdd alloc]init];
    
}

@end
