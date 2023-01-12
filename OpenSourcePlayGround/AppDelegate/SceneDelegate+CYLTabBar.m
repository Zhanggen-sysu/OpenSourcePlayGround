//
//  SceneDelegate+CYLTabBar.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2022/12/15.
//
#import "Macros.h"
#import "SceneDelegate+CYLTabBar.h"
#import "OSPGMainVC.h"
#import "OSPGLearnViewController.h"
#import "OSPGMessageViewController.h"
#import "OSPGAccountViewController.h"
#import "CYLPlusButtonSubclass.h"
#import <YPNavigationBarTransition/YPNavigationBarTransition.h>

@implementation SceneDelegate (CYLTabBar)

- (void)configureForTabBarViewController {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    UITabBar *tabAppearance = [UITabBar appearance];
    tabAppearance.backgroundColor = RGBColor(245, 245, 245);
    [CYLPlusButtonSubclass registerPlusButton];
    CYLTabBarController *vc = [CYLTabBarController tabBarControllerWithViewControllers:[self viewControllers]
                                                                 tabBarItemsAttributes:[self tabBarItemsAttributes]];
    YPNavigationController *nav = [[YPNavigationController alloc] initWithRootViewController:vc];
    [self.window setRootViewController:nav];
    [self.window makeKeyAndVisible];
}

- (NSArray *)viewControllers {
    // 首页
    OSPGMainVC *homeVC = [[OSPGMainVC alloc] init];
    YPNavigationController *homeNC = [[YPNavigationController alloc] initWithRootViewController:homeVC];
    [homeNC cyl_setHideNavigationBarSeparator:YES];
    
    // 药学习
    OSPGLearnViewController *learnVC = [[OSPGLearnViewController alloc] init];
    YPNavigationController *learnNC = [[YPNavigationController alloc] initWithRootViewController:learnVC];
    [learnNC cyl_setHideNavigationBarSeparator:YES];
    
    // 消息
    OSPGMessageViewController *messageVC = [[OSPGMessageViewController alloc] init];
    YPNavigationController *messageNC = [[YPNavigationController alloc] initWithRootViewController:messageVC];
    [messageNC cyl_setHideNavigationBarSeparator:YES];
    
    // 我的
    OSPGAccountViewController *accountVC = [[OSPGAccountViewController alloc] init];
    YPNavigationController *accountNC = [[YPNavigationController alloc] initWithRootViewController:accountVC];
    [accountNC cyl_setHideNavigationBarSeparator:YES];
    
    NSArray *viewControllersArray = @[homeNC, learnNC, messageNC, accountNC];
    return viewControllersArray;
}

- (NSArray *)tabBarItemsAttributes {
    NSDictionary *homeTabBarItemsAttributes = @{
        CYLTabBarItemTitle: @"Home",
        CYLTabBarItemImage: @"HomeIcon",
        CYLTabBarItemSelectedImage: @"HomeHighlightIcon",
    };
    NSDictionary *learnTabBarItemsAttributes = @{
        CYLTabBarItemTitle: @"学习",
        CYLTabBarItemImage: @"LearnIcon",
        CYLTabBarItemSelectedImage: @"LearnHighlightIcon",
    };
    NSDictionary *messageTabBarItemsAttributes = @{
        CYLTabBarItemTitle: @"消息",
        CYLTabBarItemImage: @"MessageIcon",
        CYLTabBarItemSelectedImage: @"MessageHighlightIcon",
    };
    NSDictionary *accountTabBarItemsAttributes = @{
        CYLTabBarItemTitle: @"我的",
        CYLTabBarItemImage: @"AccountIcon",
        CYLTabBarItemSelectedImage: @"AccountHighlightIcon",
    };

    NSArray *tabBarItemsAttributes = @[
        homeTabBarItemsAttributes,
        learnTabBarItemsAttributes,
        messageTabBarItemsAttributes,
        accountTabBarItemsAttributes
    ];
    return tabBarItemsAttributes;
}

@end
