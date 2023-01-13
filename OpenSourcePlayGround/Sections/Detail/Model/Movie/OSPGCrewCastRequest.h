//
//  OSPGCrewCastRequest.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/12.
//

#import "OSPGBaseRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSPGCrewCastRequest : OSPGBaseRequest

@property (nonatomic, assign) NSInteger movieId;
@property (nonatomic, copy) NSString *language;

@end

NS_ASSUME_NONNULL_END
