//
//  OSPGMovieListCell.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/18.
//

#import <UIKit/UIKit.h>
@class OSPGMovieResult;
NS_ASSUME_NONNULL_BEGIN

@interface OSPGMovieListCell : UITableViewCell

- (void)updateWithModel:(OSPGMovieResult *)result;

@end

NS_ASSUME_NONNULL_END
