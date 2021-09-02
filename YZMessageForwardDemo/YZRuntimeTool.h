//
//  YZRuntimeTool.h
//  YZMessageForwardDemo
//
//  Created by Lester 's Mac on 2021/9/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZRuntimeTool : NSObject

+ (Class)getMetaClassWithChildClass:(Class)cls;

+ (void)addMethodWithClass:(Class)cls methodSel:(SEL)methodSel impMethodSel:(SEL)impMethodSel;

@end

NS_ASSUME_NONNULL_END
