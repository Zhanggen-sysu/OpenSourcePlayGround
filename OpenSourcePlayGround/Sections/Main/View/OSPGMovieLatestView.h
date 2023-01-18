//
//  OSPGMovieLatestView.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/18.
//

#import "OSPGBaseView.h"

@class OSPGMovieLatestResponse;
NS_ASSUME_NONNULL_BEGIN

@interface OSPGMovieLatestView : OSPGBaseView

@property (nonatomic, copy) void (^tapBlock)(NSInteger movieId);
- (void)updateWithModel:(OSPGMovieLatestResponse *)model;

@end

NS_ASSUME_NONNULL_END
