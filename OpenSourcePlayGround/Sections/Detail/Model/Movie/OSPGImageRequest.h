//
//  OSPGImageRequest.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/13.
//

#import "OSPGBaseRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSPGImageRequest : OSPGBaseRequest

@property (nonatomic, assign) NSInteger movieId;
@property (nonatomic, copy) NSString *language;
@property (nonatomic, copy) NSString *includeImageLanguage;

@end

NS_ASSUME_NONNULL_END
