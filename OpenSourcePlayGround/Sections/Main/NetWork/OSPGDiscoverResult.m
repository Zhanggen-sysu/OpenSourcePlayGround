//
//  OSPGDiscoverResult.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/9.
//

#import "OSPGDiscoverResult.h"

@implementation OSPGDiscoverResult

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"poster_path": @"posterPath",
        @"adult": @"isAdult",
        @"overview": @"overview",
        @"release_date": @"releaseDate",
        @"genre_ids": @"genreIDS",
        @"id": @"identifier",
        @"original_title": @"originalTitle",
        @"original_language": @"originalLanguage",
        @"title": @"title",
        @"backdrop_path": @"backdropPath",
        @"popularity": @"popularity",
        @"vote_count": @"voteCount",
        @"video": @"isVideo",
        @"vote_average": @"voteAverage",
    };
}

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass
{
    return @{
        @"genre_ids": [NSNumber class],
    };
}

@end
