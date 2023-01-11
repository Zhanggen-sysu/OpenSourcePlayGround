//
//  OSPGCommonHelper.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/10.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, OSPGDateFormate) {
    OSPGDateFormate_Default,
    OSPGDateFormate_yyyyMMdd,
    OSPGDateFormate_MMMdyyyy,
    // ... more
};

typedef NS_ENUM(NSUInteger, OSPGPosterSize) {
    OSPGPosterSize_Default,
    OSPGPosterSize_w92,
    OSPGPosterSize_w154,
    OSPGPosterSize_w185,
    OSPGPosterSize_w342,
    OSPGPosterSize_w500,
    OSPGPosterSize_w780,
    OSPGPosterSize_original,
};

typedef NS_ENUM(NSUInteger, OSPGBackdropSize) {
    OSPGBackdropSize_Default,
    OSPGBackdropSize_w300,
    OSPGBackdropSize_w780,
    OSPGBackdropSize_w1280,
    OSPGBackdropSize_original,
};

NS_ASSUME_NONNULL_BEGIN

@interface OSPGCommonHelper : NSObject

/// 转换日期字符串格式
/// @param original 原格式
/// @param target 目标格式
- (NSString *)dateFormateConvertString:(NSString *)dateString
                           fromFormate:(OSPGDateFormate)original
                             toFormate:(OSPGDateFormate)target;

- (NSString *)dateToString:(NSDate *)date formate:(OSPGDateFormate)formate;
- (NSDate *)dateFromString:(NSString *)dateString formate:(OSPGDateFormate)formate;
+ (instancetype)sharedManager;
+ (void)showMessage:(NSString *)message inView:(UIView *)view duration:(NSInteger)duration;
+ (UIWindow *)getKeyWindow;
+ (NSURL *)getPosterUrl:(NSString *)string size:(OSPGPosterSize)size;
+ (NSURL *)getBackdropUrl:(NSString *)string size:(OSPGBackdropSize)size;

@end

NS_ASSUME_NONNULL_END
