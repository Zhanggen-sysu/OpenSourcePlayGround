//
//  OSPGLastEpisodeToAir.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/29.
//

#import "OSPGLastEpisodeToAir.h"

@implementation OSPGLastEpisodeToAir

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"air_date": @"airDate",
        @"episode_number": @"episodeNumber",
        @"id": @"identifier",
        @"name": @"name",
        @"overview": @"overview",
        @"production_code": @"productionCode",
        @"runtime": @"runtime",
        @"season_number": @"seasonNumber",
        @"show_id": @"showID",
        @"still_path": @"stillPath",
        @"vote_average": @"voteAverage",
        @"vote_count": @"voteCount",
    };
}

@end
