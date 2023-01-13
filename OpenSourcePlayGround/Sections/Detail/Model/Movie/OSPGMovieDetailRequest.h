//
//  OSPGMovieDetailRequest.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/11.
//

#import "OSPGBaseRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSPGMovieDetailRequest : OSPGBaseRequest

@property (nonatomic, assign) NSInteger movieId;
@property (nonatomic, copy) NSString *language;

@end

NS_ASSUME_NONNULL_END
