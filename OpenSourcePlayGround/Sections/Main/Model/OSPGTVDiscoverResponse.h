//
//  OSPGTVDiscoverResponse.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/29.
//

#import "OSPGBaseModel.h"
@class OSPGTVResult;

NS_ASSUME_NONNULL_BEGIN

@interface OSPGTVDiscoverResponse : OSPGBaseModel

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, copy)   NSArray<OSPGTVResult *> *results;
@property (nonatomic, assign) NSInteger totalResults;
@property (nonatomic, assign) NSInteger totalPages;

@end

NS_ASSUME_NONNULL_END
