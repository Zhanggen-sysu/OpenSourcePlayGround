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

@end

NS_ASSUME_NONNULL_END
