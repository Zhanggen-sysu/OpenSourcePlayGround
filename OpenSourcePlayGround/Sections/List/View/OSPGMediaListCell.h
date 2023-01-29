//
//  OSPGMediaListCell.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/18.
//

#import <UIKit/UIKit.h>
@class OSPGMovieResult;
@class OSPGTVResult;
NS_ASSUME_NONNULL_BEGIN

@interface OSPGMediaListCell : UITableViewCell

- (void)updateWithModel:(OSPGMovieResult *)result;
- (void)updateWithTVModel:(OSPGTVResult *)result;

@end

NS_ASSUME_NONNULL_END
