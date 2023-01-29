//
//  OSPGDiscoverView.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/17.
//

#import "OSPGBaseView.h"

@class OSPGMovieDiscoverResponse;
@class OSPGTVDiscoverResponse;
NS_ASSUME_NONNULL_BEGIN

@interface OSPGDiscoverView : OSPGBaseView

@property (nonatomic, copy) void (^didTapItemBlock)(NSInteger Id);
@property (nonatomic, copy) void (^didTapShowMoreBlock)(void);
@property (nonatomic, copy) NSString *title;

- (void)updateWithModel:(OSPGMovieDiscoverResponse *)model;
- (void)updateWithTVModel:(OSPGTVDiscoverResponse *)model;
@end

NS_ASSUME_NONNULL_END
