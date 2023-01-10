//
//  OSPGBaseVC.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2022/12/15.
//

#import "OSPGBaseVC.h"

@interface OSPGBaseVC ()

@end

@implementation OSPGBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self yp_refreshNavigationBarStyle];
}


#pragma mark - YPNavigationBarConfigureStyle
- (YPNavigationBarConfigurations)yp_navigtionBarConfiguration {
    return YPNavigationBarShow | YPNavigationBarBackgroundStyleOpaque | YPNavigationBarBackgroundStyleColor;
}

- (UIColor *)yp_navigationBarTintColor {
    return [UIColor whiteColor];
}

- (UIColor *)yp_navigationBackgroundColor {
    return kMainColor;
}

@end
