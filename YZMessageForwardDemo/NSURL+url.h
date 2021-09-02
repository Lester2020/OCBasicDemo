//
//  NSURL+url.h
//  YZMessageForwardDemo
//
//  Created by Lester 's Mac on 2021/9/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURL (url)

@property (nonatomic, copy) NSString *urlStr;

+ (instancetype)yz_URLWithString:(NSString *)URLString;

@end

NS_ASSUME_NONNULL_END
