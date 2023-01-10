//
//  OSPGDiscoverResponse.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/9.
//
#import "OSPGBaseModel.h"

@class OSPGDiscoverResult;

NS_ASSUME_NONNULL_BEGIN

@interface OSPGDiscoverResponse : OSPGBaseModel

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, copy)   NSArray<OSPGDiscoverResult *> *results;
@property (nonatomic, assign) NSInteger totalResults;
@property (nonatomic, assign) NSInteger totalPages;

@end

NS_ASSUME_NONNULL_END
