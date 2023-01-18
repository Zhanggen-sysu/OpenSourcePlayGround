//
//  OSPGSimilarMovieView.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/16.
//

#import "OSPGBaseView.h"

@class OSPGMovieDiscoverResponse;
NS_ASSUME_NONNULL_BEGIN

@interface OSPGSimilarMovieView : OSPGBaseView

- (void)updateWithModel:(OSPGMovieDiscoverResponse *)model;

@end

NS_ASSUME_NONNULL_END
