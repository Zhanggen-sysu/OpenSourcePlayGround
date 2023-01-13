//
//  OSPGReviewResponse.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/13.
//

#import "OSPGBaseModel.h"

@class OSPGReviewResult;
NS_ASSUME_NONNULL_BEGIN

@interface OSPGReviewResponse : OSPGBaseModel

@property (nonatomic, assign) NSInteger identifier;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, copy)   NSArray<OSPGReviewResult *> *results;
@property (nonatomic, assign) NSInteger totalPages;
@property (nonatomic, assign) NSInteger totalResults;

@end

NS_ASSUME_NONNULL_END
