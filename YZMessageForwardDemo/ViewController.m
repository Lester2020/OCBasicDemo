//
//  ViewController.m
//  YZMessageForwardDemo
//
//  Created by Lester 's Mac on 2021/9/2.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *person = [[Person alloc] init];
    [[Person class] performSelector:@selector(eatFood)];
    [person performSelector:@selector(eatFood)];
    
    //unrecognized selector sent to instance
    //nrecognized selector sent to class
//    UIView *view = [[UIView alloc] init];
//    view.layer.modelLayer;
}


@end
