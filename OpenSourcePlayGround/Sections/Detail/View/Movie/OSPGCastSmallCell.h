//
//  OSPGCastSmallCell.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/12.
//

#import <UIKit/UIKit.h>

@class OSPGCast;

NS_ASSUME_NONNULL_BEGIN

@interface OSPGCastSmallCell : UICollectionViewCell

- (void)updateWithModel:(OSPGCast *)cast;

@end

NS_ASSUME_NONNULL_END
