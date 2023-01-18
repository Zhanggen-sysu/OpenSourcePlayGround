//
//  OSPGSimilarMovieCell.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/17.
//

#import <UIKit/UIKit.h>

@class OSPGMovieResult;
NS_ASSUME_NONNULL_BEGIN

@interface OSPGSimilarMovieCell : UICollectionViewCell

- (void)updateWithModel:(OSPGMovieResult *)model;

@end

NS_ASSUME_NONNULL_END
