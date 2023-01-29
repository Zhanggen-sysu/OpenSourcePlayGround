//
//  OSPGLastEpisodeToAir.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/29.
//

#import "OSPGBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSPGLastEpisodeToAir : OSPGBaseModel

@property (nonatomic, copy)           NSString *airDate;
@property (nonatomic, assign)         NSInteger episodeNumber;
@property (nonatomic, assign)         NSInteger identifier;
@property (nonatomic, copy)           NSString *name;
@property (nonatomic, copy)           NSString *overview;
@property (nonatomic, copy)           NSString *productionCode;
@property (nonatomic, assign)         NSInteger runtime;
@property (nonatomic, assign)         NSInteger seasonNumber;
@property (nonatomic, assign)         NSInteger showID;
@property (nonatomic, nullable, copy) id stillPath;
@property (nonatomic, assign)         NSInteger voteAverage;
@property (nonatomic, assign)         NSInteger voteCount;

@end

NS_ASSUME_NONNULL_END
