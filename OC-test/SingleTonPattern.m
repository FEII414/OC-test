//
//  SingleTonPattern.m
//  OC-test
//
//  Created by feii on 17/3/23.
//  Copyright © 2017年 feii. All rights reserved.
//

#import "SingleTonPattern.h"

@interface SingleTonPattern(){
    
    
}

@end

@implementation SingleTonPattern

//全局变量
static id signleTon = nil;

- (id)init;
{
    @synchronized(self) {
        if (self = [super init]){
            return self;
        }
        return nil;
    }
}

+ (instancetype)shareSingleTon{
    
    signleTon = nil;
    
    //(1).通过加线程锁进行实现:
    @synchronized (self) {
        if (signleTon == nil) {
            signleTon = [[SingleTonPattern alloc]init];
        }
    }
    
    // (2).通过GCD实现单例方法:
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (signleTon == nil) {
            signleTon = [[SingleTonPattern alloc]init];
        }
    });
    
    return signleTon;
}

// 重写allocWithZone方法，用来保证其他人直接使用alloc和init试图获得一个新实力的时候不产生一个新实例，
+(id)allocWithZone:(struct _NSZone *)zone{
    
    @synchronized (self) {
        if (!signleTon) {
            signleTon = [super allocWithZone:zone];
            return signleTon;
        }
        return nil;
    }
    
}

//覆盖该方法主要确保当用户通过copy方法产生对象时对象的唯一性
-(id)copy
 {
   return self;
}

//覆盖该方法主要确保当用户通过mutableCopy方法产生对象时对象的唯一性
- (id)mutableCopy
{
    return self;
}

@end
