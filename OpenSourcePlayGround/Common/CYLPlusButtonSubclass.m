//
//  CYLPlusButtonSubclass.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2022/12/15.
//
#import "Macros.h"
#import "CYLPlusButtonSubclass.h"
#import "OSPGTCMViewController.h"
#import "UIImage+YPConfigure.h"

@implementation CYLPlusButtonSubclass

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

#pragma mark - CYLPlusButtonSubclassing
+ (id)plusButton {
    CYLPlusButtonSubclass *btn = [CYLPlusButtonSubclass buttonWithType:UIButtonTypeCustom];
    [btn setImage:kGetImage(@"TCMIcon") forState:UIControlStateNormal];
    [btn setImage:kGetImage(@"TCMHighlightIcon") forState:UIControlStateHighlighted];
    [btn setImage:kGetImage(@"TCMHighlightIcon") forState:UIControlStateSelected];
    [btn sizeToFit];
    btn.frame = CGRectMake(0, 0, 64, 64);
    [btn setBackgroundImage:[UIImage yp_imageWithColor:RGBColor(220, 220, 220)] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage yp_imageWithColor:RGBColor(0, 191, 255)] forState:UIControlStateSelected];
    [btn setBackgroundImage:[UIImage yp_imageWithColor:RGBColor(0, 191, 255)] forState:UIControlStateHighlighted];
    ViewBorderRadius(btn, 32.0f, 5, RGBColor(245, 245, 245));
    return btn;
}

// 实现该方法后，能让 PlusButton 的点击效果与跟点击其他 TabBar 按钮效果一样，跳转到该方法指定的 UIViewController
+ (UIViewController *)plusChildViewController {
    OSPGTCMViewController *v = [[OSPGTCMViewController alloc] init];
    return v;
}

// 用来自定义加号按钮的位置，如果不实现默认居中。
+ (NSUInteger)indexOfPlusButtonInTabBar {
    return 2;
}

+ (CGFloat)multiplierOfTabBarHeight:(CGFloat)tabBarHeight {
    return 0.25;
}



@end
