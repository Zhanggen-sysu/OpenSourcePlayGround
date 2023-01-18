//
//  OSPGMovieListVC.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/18.
//

#import "OSPGBaseVC.h"
#import "OSPGMovieDiscoverRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSPGMovieListVC : OSPGBaseVC

- (instancetype)initWithTitle:(NSString *)title type:(OSPGMovieDiscoverType)type;

@end

NS_ASSUME_NONNULL_END
