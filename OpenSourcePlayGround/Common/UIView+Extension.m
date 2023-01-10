//
//  UIView+Extension.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2022/12/26.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (NSArray *)superViews {
    NSMutableArray *array = [NSMutableArray array];
    UIView *view = self.superview;
    while (view) {
        [array addObject:view];
        view = view.superview;
    }
    return array;
}

- (BOOL)isAncestorOfView:(UIView *)view {
    return [[view superViews] containsObject:self];
}

- (UIView *)nearestCommonAncestorToView:(UIView *)aView {
    if ([self isEqual:aView]) {
        return self;
    }
    if ([self isAncestorOfView:aView]) {
        return self;
    }
    if ([aView isAncestorOfView:self]) {
        return aView;
    }
    NSArray *ancestors = self.superViews;
    for (UIView *view in aView.superViews) {
        if ([ancestors containsObject:view]) {
            return view;
        }
    }
    return nil;
}

@end
