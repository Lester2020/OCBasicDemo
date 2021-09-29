//
//  NSURL+url.m
//  YZMessageForwardDemo
//
//  Created by Lester 's Mac on 2021/9/2.
//

#import "NSURL+url.h"
#import <objc/runtime.h>

@implementation NSURL (url)

+ (void)load {
    Method m1 = class_getClassMethod([NSURL class], @selector(URLWithString:));
    Method m2 = class_getClassMethod([NSURL class], @selector(yz_URLWithString:));
    method_exchangeImplementations(m1, m2);
}

+ (instancetype)yz_URLWithString:(NSString *)URLString {
    NSURL *url = [NSURL yz_URLWithString:URLString];
    if (!url) {
        NSLog(@"url为空");
    }
    return url;
}

+ (BOOL)resolveClassMethod:(SEL)sel {
    return [super resolveClassMethod:sel];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    return [super resolveInstanceMethod:sel];
}

static const char *key = "urlKey";

- (NSString *)urlStr {
    return objc_getAssociatedObject(self, key);
}

- (void)setUrlStr:(NSString *)urlStr {
    objc_setAssociatedObject(self, key, urlStr, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//在分类中写weak属性实现方式
static const char *key1 = "weakKey";

- (void)setModel:(WeakModel *)model {
    objc_setAssociatedObject(self, key1, model, OBJC_ASSOCIATION_RETAIN);
}

- (WeakModel *)model {
    return objc_getAssociatedObject(self, key1);
}

@end
