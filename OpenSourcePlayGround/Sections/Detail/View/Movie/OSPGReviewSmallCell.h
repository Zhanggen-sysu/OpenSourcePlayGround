//
//  OSPGReviewSmallCell.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/13.
//

#import <UIKit/UIKit.h>

@class OSPGReviewResult;
NS_ASSUME_NONNULL_BEGIN

@interface OSPGReviewSmallCell : UICollectionViewCell

- (void)updateWithModel:(OSPGReviewResult *)model;

@end

NS_ASSUME_NONNULL_END
