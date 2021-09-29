//
//  WeakModel.h
//  YZMessageForwardDemo
//
//  Created by Lester 's Mac on 2021/9/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WeakModelDelegate <NSObject>

- (void)test;

@end

@interface WeakModel : NSObject

@property (nonatomic, weak) id<WeakModelDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
