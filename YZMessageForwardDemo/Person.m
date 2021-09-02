//
//  Person.m
//  YZMessageForwardDemo
//
//  Created by Lester 's Mac on 2021/9/2.
//

#import "Person.h"
#import "YZRuntimeTool.h"
#import "YZPersonSpare.h"

@implementation Person

#pragma mark - 消息机制第一步：Method resolution 方法解析处理阶段

/**
 类：如果是类方法的调用，首先会触发该类方法
 
 @param sel 传递进入的方法
 @return 如果YES则能接受消息 NO不能接受消息 进入第二步
 */
+ (BOOL)resolveClassMethod:(SEL)sel {
    if ([NSStringFromSelector(sel) isEqualToString:@"eatFood"]) {
        //对类进行添加类方法 需要将方法添加进入元类里
        [YZRuntimeTool addMethodWithClass:[YZRuntimeTool getMetaClassWithChildClass:[self class]] methodSel:sel impMethodSel:@selector(addClassDynamicMethod)];
    }
    return [super resolveClassMethod:sel];
}

/**
 对象：在接受到无法解读的消息的时候 首先会调用所属类的类方法

 @param sel 传递进入的方法
 @return 如果YES则能接受消息 NO不能接受消息 进入第二步
 */
+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    if ([NSStringFromSelector(sel) isEqualToString:@"eatFood"]) {
//        [YZRuntimeTool addMethodWithClass:[self class] methodSel:sel impMethodSel:@selector(addDynamicMethod)];
//        return YES;
//    }
    return [super resolveInstanceMethod:sel];
}


-(void)addDynamicMethod{
    NSLog(@"动态添加方法");
}

+(void)addClassDynamicMethod{
    NSLog(@"动态添加类方法");
}

#pragma mark - 消息机制第二步:Fast forwarding 快速转发阶段

/**
 转发SEL去对象内部的其他可以响应的对象

 @param aSelector 需要被响应的方法SEL
 @return 返回一个可以被响应的该SEL的对象 如果返回self或者nil,则说明没有可以响应的目标 则进入第三步
 */
- (id)forwardingTargetForSelector:(SEL)aSelector {
//    if ([NSStringFromSelector(aSelector) isEqualToString:@"eatFood"]) {
//        return [YZPersonSpare new];
//    }
    return [super forwardingTargetForSelector:aSelector];
}

#pragma mark - 消息机制第三步：Normal forwarding 常规转发阶段

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    //如果返回为nil则进行手动创建签名
    if ([super methodSignatureForSelector:aSelector] == nil) {
        NSMethodSignature *signature = [NSMethodSignature signatureWithObjCTypes:"v@:"];
        return signature;
    }
    return [super methodSignatureForSelector:aSelector];
}

//上方方法如果调用返回有签名 则进入消息转发最后一步
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    //创建备用对象
    YZPersonSpare *spare = [YZPersonSpare new];
    SEL sel = anInvocation.selector;
    //判断备用对象是否可以响应传递进来等待响应的SEL
    if ([spare respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:spare];
    } else {
     //如果备用对象不能响应 则抛出异常
        [self doesNotRecognizeSelector:sel];
    }
}

@end
