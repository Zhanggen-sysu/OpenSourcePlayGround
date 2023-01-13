//
//  OSPGMovieDetailManager.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/11.
//

#import <Foundation/Foundation.h>
#import "OSPGBaseRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSPGMovieDetailManager : NSObject

+ (instancetype)sharedManager;

- (void)getMovieDetailWithId:(NSInteger)movieId completionBlock:(OSPGCommonResponseBlock)block;
- (void)getCastCrewWithId:(NSInteger)movieId completionBlock:(OSPGCommonResponseBlock)block;
- (void)getImagesWithId:(NSInteger)movieId completionBlock:(OSPGCommonResponseBlock)block;

@end

NS_ASSUME_NONNULL_END
