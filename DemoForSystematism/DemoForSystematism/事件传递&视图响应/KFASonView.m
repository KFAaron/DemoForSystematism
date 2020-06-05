//
//  KFASonView.m
//  DemoForSystematism
//
//  Created by KFAaron on 2020/6/5.
//  Copyright © 2020 KFAaron. All rights reserved.
//

#import "KFASonView.h"

@implementation KFASonView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)tap:(UITapGestureRecognizer *)gestureRecognizer {
    NSLog(@"%@:我被点击了,我的名字是%@",self,self.name);
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    return self;
//}
//
//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
//    return YES;
//}

@end
