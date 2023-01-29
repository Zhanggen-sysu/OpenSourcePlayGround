//
//  OSPGDiscoverManager.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/9.
//
#import <Foundation/Foundation.h>
#import "OSPGDiscoverRequest.h"
#import "OSPGMovieDiscoverRequest.h"
#import "OSPGTVDiscoverRequest.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, OSPGDiscoverSortBy) {
    OSPGDiscoverSortBy_Reserve = 0,
    OSPGDiscoverSortBy_PopularityAsc,
    OSPGDiscoverSortBy_PopularityDesc,
    OSPGDiscoverSortBy_ReleaseDateAsc,
    OSPGDiscoverSortBy_ReleaseDateDesc,
    OSPGDiscoverSortBy_RevenueAsc,
    OSPGDiscoverSortBy_RevenueDesc,
    OSPGDiscoverSortBy_PrimaryReleaseDateAsc,
    OSPGDiscoverSortBy_PrimaryReleaseDateDesc,
    OSPGDiscoverSortBy_OriginalTitleAsc,
    OSPGDiscoverSortBy_OriginalTitleDesc,
    OSPGDiscoverSortBy_VoteAverageAsc,
    OSPGDiscoverSortBy_VoteAverageDesc,
    OSPGDiscoverSortBy_VoteCountAsc,
    OSPGDiscoverSortBy_VoteCountDesc,
};

@interface OSPGDiscoverManager : NSObject

+ (instancetype)sharedManager;
- (void)getDiscoverDefault:(OSPGCommonResponseBlock)block loadMore:(BOOL)loadMore;
- (void)getDiscoverMovieType:(OSPGMovieDiscoverType)type loadMore:(BOOL)loadMore block:(OSPGCommonResponseBlock)block;
- (void)getDiscoverTVType:(OSPGTVDiscoverType)type loadMore:(BOOL)loadMore block:(OSPGCommonResponseBlock)block;

@end

NS_ASSUME_NONNULL_END
