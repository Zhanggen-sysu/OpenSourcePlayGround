//
//  OSPGMedia.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/29.
//

#import "OSPGMedia.h"
#import "OSPGSeason.h"

@implementation OSPGMedia

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"adult": @"isAdult",
        @"backdrop_path": @"backdropPath",
        @"id": @"identifier",
        @"name": @"name",
        @"original_language": @"originalLanguage",
        @"original_name": @"originalName",
        @"overview": @"overview",
        @"poster_path": @"posterPath",
        @"media_type": @"mediaType",
        @"genre_ids": @"genreIDS",
        @"popularity": @"popularity",
        @"first_air_date": @"firstAirDate",
        @"vote_average": @"voteAverage",
        @"vote_count": @"voteCount",
        @"origin_country": @"originCountry",
        @"character": @"character",
        @"episodes": @"episodes",
        @"seasons": @"seasons",
    };
}

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass
{
    // TODO: episodes
    return @{
        @"genre_ids": [NSNumber class],
        @"origin_country": [NSString class],
        @"":@"",
        @"seasons": [OSPGSeason class],
    };
}

@end
