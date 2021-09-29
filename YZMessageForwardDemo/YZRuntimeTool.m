//
//  YZRuntimeTool.m
//  YZMessageForwardDemo
//
//  Created by Lester 's Mac on 2021/9/2.
//

#import "YZRuntimeTool.h"
#import <objc/runtime.h>
#import "PersonThid.h"

@implementation YZRuntimeTool

/// 获取类的元类
/// @param cls 目标类
/// @return 返回目标类的元类
+ (Class)getMetaClassWithChildClass:(Class)cls {
    const char *classChar = [NSStringFromClass(cls) UTF8String];
    //根据char获取元类
    return  objc_getMetaClass(classChar);
}


/// 对一个类添加对象方法
/// @param cls 目标类
/// @param methodSel 目标类待实现方法
/// @param impMethodSel 目标类已实现的动态方法
+ (void)addMethodWithClass:(Class)cls methodSel:(SEL)methodSel impMethodSel:(SEL)impMethodSel {
    //获取实现的方法内容
    Method funtionRealMethod = class_getInstanceMethod(cls, impMethodSel);
    //实现方法的IMP
    IMP methodIMP = method_getImplementation(funtionRealMethod);
    //实现方法的类别 返回类型 携带参数 等
    const char *types = method_getTypeEncoding(funtionRealMethod);
    //对目标添加方法
    class_addMethod(cls, methodSel, methodIMP, types);
}

//runtime如何通过selector找到对应的IMP地址?
- (void)test {
    //方法一：
    //获取方法实现IMP地址
    IMP clsIMP = class_getMethodImplementation(objc_getMetaClass([NSStringFromClass([self class]) UTF8String]), @selector(testFunc));
    IMP instIMP = class_getMethodImplementation(objc_getClass("Test"), @selector(testFunc));
    
    //方法二：
    Method method1 = class_getClassMethod([self class], @selector(testFunc));
    Method method2 = class_getInstanceMethod([self class], @selector(testFunc));
    IMP imp = method_getImplementation(method1);
}


- (void)testFunc {
    
}

//获取一个类的所有父类
- (void)enumerateClasses {
     class_getSuperclass([PersonThid class]);
}

@end
