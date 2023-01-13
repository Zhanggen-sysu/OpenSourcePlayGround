//
//  OSPGReviewResult.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/13.
//

#import "OSPGBaseModel.h"

@class OSPGReviewAuthorDetails;
NS_ASSUME_NONNULL_BEGIN

@interface OSPGReviewResult : OSPGBaseModel

@property (nonatomic, copy)   NSString *author;
@property (nonatomic, strong) OSPGReviewAuthorDetails *authorDetails;
@property (nonatomic, copy)   NSString *content;
@property (nonatomic, copy)   NSString *createdAt;
@property (nonatomic, copy)   NSString *identifier;
@property (nonatomic, copy)   NSString *updatedAt;
@property (nonatomic, copy)   NSString *url;

@end

NS_ASSUME_NONNULL_END
