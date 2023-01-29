//
//  OSPGLatestView.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/18.
//

#import "OSPGBaseView.h"

@class OSPGMovieLatestResponse;
@class OSPGTVLatestResponse;
NS_ASSUME_NONNULL_BEGIN

@interface OSPGLatestView : OSPGBaseView

@property (nonatomic, copy) void (^tapBlock)(NSInteger movieId);
- (void)updateWithModel:(OSPGMovieLatestResponse *)model;
- (void)updateWithTVModel:(OSPGTVLatestResponse *)model;
@end

NS_ASSUME_NONNULL_END
