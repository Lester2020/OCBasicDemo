//
//  YZPersonModel.h
//  YZMessageForwardDemo
//
//  Created by Lester 's Mac on 2021/9/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZPersonModel : NSObject<NSCoding>

@property (nonatomic, strong) NSArray *lists;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int age;
@property (nonatomic, copy) NSString *addess;

@end

NS_ASSUME_NONNULL_END
