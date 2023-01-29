//
//  OSPGTVResult.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/29.
//

#import "OSPGTVResult.h"

@implementation OSPGTVResult

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"poster_path": @"posterPath",
        @"popularity": @"popularity",
        @"id": @"identifier",
        @"backdrop_path": @"backdropPath",
        @"vote_average": @"voteAverage",
        @"overview": @"overview",
        @"first_air_date": @"firstAirDate",
        @"origin_country": @"originCountry",
        @"genre_ids": @"genreIDS",
        @"original_language": @"originalLanguage",
        @"vote_count": @"voteCount",
        @"name": @"name",
        @"original_name": @"originalName",
    };
}

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass
{
    return @{
        @"origin_country":[NSString class],
        @"genre_ids":[NSNumber class],
    };
}

@end
