//
//  OSPGTVDetailManager.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/29.
//

#import <Foundation/Foundation.h>
#import "OSPGBaseRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSPGTVDetailManager : NSObject

+ (instancetype)sharedManager;

- (void)getTVDetailWithId:(NSInteger)tvId completionBlock:(OSPGCommonResponseBlock)block;
- (void)getCastCrewWithId:(NSInteger)tvId completionBlock:(OSPGCommonResponseBlock)block;
- (void)getImagesWithId:(NSInteger)tvId completionBlock:(OSPGCommonResponseBlock)block;
- (void)getReviewsWithId:(NSInteger)tvId loadMore:(BOOL)loadMore completionBlock:(OSPGCommonResponseBlock)block;
- (void)getSimilarWithId:(NSInteger)tvId loadMore:(BOOL)loadMore completionBlock:(OSPGCommonResponseBlock)block;

@end

NS_ASSUME_NONNULL_END
