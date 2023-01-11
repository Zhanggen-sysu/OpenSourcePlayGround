//
//  OSPGDiscoverRequest.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/6.
//

#import "OSPGDiscoverRequest.h"

@implementation OSPGDiscoverRequest

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
//        @"api_key": @"apiKey",
        @"language": @"language",
        @"region": @"region",
        @"sort_by": @"sortBy",
        @"certification_country": @"certificationCountry",
        @"certification": @"certification",
        @"certification.lte": @"certificationLTE",
        @"certification.gte": @"certificationGte",
        @"include_adult": @"includeAdult",
        @"include_video": @"includeVideo",
        @"page": @"page",
        @"primary_release_year": @"primaryReleaseYear",
        @"primary_release_date.gte": @"primaryReleaseDateGte",
        @"primary_release_date.lte": @"primaryReleaseDateLTE",
        @"release_date.gte": @"releaseDateGte",
        @"release_date.lte": @"releaseDateLTE",
        @"with_release_type": @"withReleaseType",
        @"year": @"year",
        @"vote_count.gte": @"voteCountGte",
        @"vote_count.lte": @"voteCountLTE",
        @"vote_average.gte": @"voteAverageGte",
        @"vote_average.lte": @"voteAverageLTE",
        @"with_cast": @"withCast",
        @"with_crew": @"withCrew",
        @"with_people": @"withPeople",
        @"with_companies": @"withCompanies",
        @"with_genres": @"withGenres",
        @"without_genres": @"withoutGenres",
        @"with_keywords": @"withKeywords",
        @"without_keywords": @"withoutKeywords",
        @"with_runtime.gte": @"withRuntimeGte",
        @"with_runtime.lte": @"withRuntimeLTE",
        @"with_original_language": @"withOriginalLanguage",
        @"with_watch_providers": @"withWatchProviders",
        @"watch_region": @"watchRegion",
        @"with_watch_monetization_types": @"withWatchMonetizationTypes",
        @"without_companies": @"withoutCompanies",
    };
}

- (NSString *)requestUrl
{
    return @"discover/movie";
}

@end
