//
//  OSPGDiscoverView.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/17.
//

#import "OSPGBaseView.h"

@class OSPGMovieDiscoverResponse;
NS_ASSUME_NONNULL_BEGIN

@interface OSPGDiscoverView : OSPGBaseView

@property (nonatomic, copy) void (^didTapMovieBlock)(NSInteger movieId);
@property (nonatomic, copy) void (^didTapShowMoreBlock)(void);
@property (nonatomic, copy) NSString *title;

- (void)updateWithModel:(OSPGMovieDiscoverResponse *)model;

@end

NS_ASSUME_NONNULL_END
