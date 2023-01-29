//
//  OSPGMediaListVC.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/18.
//

#import "OSPGBaseVC.h"
#import "OSPGMovieDiscoverRequest.h"
#import "OSPGTVDiscoverRequest.h"
NS_ASSUME_NONNULL_BEGIN

@interface OSPGMediaListVC : OSPGBaseVC

- (instancetype)initWithTitle:(NSString *)title type:(OSPGMovieDiscoverType)type;
- (instancetype)initWithTitle:(NSString *)title tvType:(OSPGTVDiscoverType)type;

@end

NS_ASSUME_NONNULL_END
