//
//  OSPGMovieDiscoverResponse.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/9.
//
#import "OSPGBaseModel.h"

@class OSPGMovieResult;
@class OSPGDates;

NS_ASSUME_NONNULL_BEGIN

@interface OSPGMovieDiscoverResponse : OSPGBaseModel

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, copy)   NSArray<OSPGMovieResult *> *results;
@property (nonatomic, strong) OSPGDates *dates;
@property (nonatomic, assign) NSInteger totalResults;
@property (nonatomic, assign) NSInteger totalPages;

@end

NS_ASSUME_NONNULL_END
