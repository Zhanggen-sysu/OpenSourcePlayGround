//
//  OSPGDiscoverCell.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/9.
//

#import <UIKit/UIKit.h>

@class OSPGMovieResult;
@class OSPGTVResult;
NS_ASSUME_NONNULL_BEGIN

@interface OSPGDiscoverCell : UICollectionViewCell

- (void)updateWithModel:(OSPGMovieResult *)result;
- (void)updateWithTVModel:(OSPGTVResult *)result;

@end

NS_ASSUME_NONNULL_END
