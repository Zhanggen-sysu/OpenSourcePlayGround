//
//  OSPGSeason.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/29.
//

#import "OSPGSeason.h"

@implementation OSPGSeason

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"air_date": @"airDate",
        @"episode_count": @"episodeCount",
        @"id": @"identifier",
        @"name": @"name",
        @"overview": @"overview",
        @"poster_path": @"posterPath",
        @"season_number": @"seasonNumber",
        @"show_id": @"showID",
    };
}

@end
