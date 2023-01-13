//
//  OSPGReviewAuthorDetails.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/13.
//

#import "OSPGBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSPGReviewAuthorDetails : OSPGBaseModel

@property (nonatomic, copy)             NSString *name;
@property (nonatomic, copy)             NSString *username;
@property (nonatomic, nullable, copy)   NSString *avatarPath;
@property (nonatomic, nullable, strong) NSNumber *rating;

@end

NS_ASSUME_NONNULL_END
