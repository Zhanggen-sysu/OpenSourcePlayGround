//
//  OSPGMovieDetailView.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/12.
//

#import "OSPGBaseView.h"

@class OSPGMovieDetailResponse;

NS_ASSUME_NONNULL_BEGIN

@interface OSPGMovieDetailView : OSPGBaseView

- (void)updateWithModel:(OSPGMovieDetailResponse *)response;

@end

NS_ASSUME_NONNULL_END
