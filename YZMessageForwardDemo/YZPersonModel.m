//
//  YZPersonModel.m
//  YZMessageForwardDemo
//
//  Created by Lester 's Mac on 2021/9/2.
//

#import "YZPersonModel.h"
#import <objc/runtime.h>

@implementation YZPersonModel

//实现NSCoding的自动归档和自动解档
//用runtime提供的函数遍历Model自身所有属性，并对属性进行encode和decode操作

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        unsigned int outCount;
        Ivar *ivars = class_copyIvarList([self class], &outCount);
        for (int i = 0; i < outCount; i++) {
            Ivar ivar = ivars[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            [self setValue:[coder decodeObjectForKey:key] forKey:key];
        }
    }
    return self;
}


- (void)encodeWithCoder:(NSCoder *)coder {
    unsigned int outCount;
    Ivar *ivars = class_copyIvarList([self class], &outCount);
    for (int i = 0; i < outCount; i++) {
        Ivar ivar = ivars[i];
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        [coder encodeObject:[self valueForKey:key] forKey:key];
    }
}

@end
