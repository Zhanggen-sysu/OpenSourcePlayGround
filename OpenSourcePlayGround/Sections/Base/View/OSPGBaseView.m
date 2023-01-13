//
//  OSPGBaseView.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/12.
//

#import "OSPGBaseView.h"

@implementation OSPGBaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
        [self defineLayout];
    }
    return self;
}

- (void)setupSubviews
{
    NSAssert(NO, @"Must override");
}

- (void)defineLayout
{
    NSAssert(NO, @"Must override");
}

@end
