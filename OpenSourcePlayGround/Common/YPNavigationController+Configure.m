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
    return [UIColor clearColor];
}

@end
