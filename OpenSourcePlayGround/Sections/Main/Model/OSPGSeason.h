//
//  OSPGSeason.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/29.
//

#import "OSPGBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSPGSeason : OSPGBaseModel

@property (nonatomic, copy)   NSString *airDate;
@property (nonatomic, assign) NSInteger episodeCount;
@property (nonatomic, assign) NSInteger identifier;
@property (nonatomic, copy)   NSString *name;
@property (nonatomic, copy)   NSString *overview;
@property (nonatomic, copy)   NSString *posterPath;
@property (nonatomic, assign) NSInteger seasonNumber;
@property (nonatomic, assign) NSInteger showID;

@end

NS_ASSUME_NONNULL_END
