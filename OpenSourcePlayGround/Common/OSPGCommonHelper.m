//
//  OSPGCommonHelper.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/10.
//

#import "OSPGCommonHelper.h"
#import "MBProgressHUD.h"

@interface OSPGCommonHelper ()

@property (nonatomic, strong) NSDateFormatter *yyyyMMddFormatter;
@property (nonatomic, strong) NSDateFormatter *MMMdyyyyFormatter;

@end

@implementation OSPGCommonHelper

static OSPGCommonHelper *_manager = nil;

+ (instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_manager) {
            _manager = [[super allocWithZone:NULL] init];
        }
    });
    return _manager;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
   
   return [OSPGCommonHelper sharedManager];
}

- (id)copyWithZone:(NSZone *)zone {
   
   return [OSPGCommonHelper sharedManager];
}

- (id)mutableCopyWithZone:(NSZone *)zone {
   
   return [OSPGCommonHelper sharedManager];
}

- (NSDate *)dateFromString:(NSString *)dateString formate:(OSPGDateFormate)formate
{
    NSDateFormatter *formatter = [self getDateFormatter:formate];
    if (!formatter) {
        NSAssert(NO, @"Undefine Formatter!");
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateStyle = NSDateFormatterMediumStyle;
    }
    return [formatter dateFromString:dateString];
}

- (NSString *)dateToString:(NSDate *)date formate:(OSPGDateFormate)formate
{
    NSDateFormatter *formatter = [self getDateFormatter:formate];
    if (!formatter) {
        NSAssert(NO, @"Undefine Formatter!");
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateStyle = NSDateFormatterMediumStyle;
    }
    return [formatter stringFromDate:date];
}

- (NSString *)dateFormateConvertString:(NSString *)dateString
                           fromFormate:(OSPGDateFormate)original
                             toFormate:(OSPGDateFormate)target
{
    return [self dateToString:[self dateFromString:dateString formate:original] formate:target];
}

- (NSDateFormatter *)getDateFormatter:(OSPGDateFormate)formate
{
    switch (formate) {
        case OSPGDateFormate_MMMdyyyy:
            return self.MMMdyyyyFormatter;
        case OSPGDateFormate_yyyyMMdd:
            return self.yyyyMMddFormatter;
        default:
            return nil;
    }
}

- (NSDateFormatter *)yyyyMMddFormatter
{
    if (!_yyyyMMddFormatter) {
        _yyyyMMddFormatter = [[NSDateFormatter alloc] init];
        _yyyyMMddFormatter.dateFormat = @"yyyy-MM-dd";
    }
    return _yyyyMMddFormatter;
}

- (NSDateFormatter *)MMMdyyyyFormatter
{
    if (!_MMMdyyyyFormatter) {
        _MMMdyyyyFormatter = [[NSDateFormatter alloc] init];
        _MMMdyyyyFormatter.dateFormat = @"MMM d, yyyy";
    }
    return _MMMdyyyyFormatter;
}

+ (UIWindow *)getKeyWindow
{
    UIWindow *window = nil;
    if (@available(iOS 13.0, *)) {
        for (UIWindowScene *windowScene in [UIApplication sharedApplication].connectedScenes) {
            if (windowScene.activationState == UISceneActivationStateForegroundActive) {
                window = windowScene.windows.firstObject;
                break;
            }
        }
    } else {
        window = [[UIApplication sharedApplication] keyWindow];
    }
    return window;
}

+ (void)showMessage:(NSString *)message inView:(UIView *)view duration:(NSInteger)duration
{
    if (message.length <= 0) {
        return;
    }
    
    UIView *showView = view;
    if (!showView) {
        showView = [OSPGCommonHelper getKeyWindow];
    }
    [MBProgressHUD hideHUDForView:showView animated:NO];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:showView animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.margin = 10.f;
    hud.label.text = message;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:duration];
}

@end
