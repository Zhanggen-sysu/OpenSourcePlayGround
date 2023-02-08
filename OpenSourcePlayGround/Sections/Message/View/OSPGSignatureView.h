//
//  OSPGSignatureView.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/2/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OSPGSignatureView : UIView

/**
 * 获取签名图片
 */
- (UIImage *)getSignatureImage;
/**
 * 重置签名
 */
- (void)clear;
- (void)revoke;

@end

NS_ASSUME_NONNULL_END
