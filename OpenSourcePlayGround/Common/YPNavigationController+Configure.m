//
//  YPNavigationController+Configure.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2022/12/14.
//

#import "YPNavigationController+Configure.h"
#import "Macros.h"

@implementation YPNavigationController (Configure)

- (YPNavigationBarConfigurations)yp_navigtionBarConfiguration {
    return YPNavigationBarHidden;
}

- (UIColor *) yp_navigationBarTintColor {
    return [UIColor whiteColor];
}

- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.visibleViewController;
}

- (UIViewController *)childViewControllerForStatusBarHidden {
    return self.visibleViewController;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return [self.visibleViewController preferredStatusBarStyle];
}

- (BOOL)prefersStatusBarHidden {
    return [self.visibleViewController prefersStatusBarHidden];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    } else {
        viewController.hidesBottomBarWhenPushed = NO;
    }
    [super pushViewController:viewController animated:animated];
}

@end
