//
//  OSPGTVLatestResponse.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/29.
//

#import "OSPGTVLatestResponse.h"
#import "OSPGCreatedBy.h"
#import "OSPGGenre.h"
#import "OSPGNetwork.h"
#import "OSPGProductionCompany.h"
#import "OSPGProductionCountry.h"
#import "OSPGSeason.h"
#import "OSPGSpokenLanguage.h"

@implementation OSPGTVLatestResponse

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"adult": @"isAdult",
        @"backdrop_path": @"backdropPath",
        @"created_by": @"createdBy",
        @"episode_run_time": @"episodeRunTime",
        @"first_air_date": @"firstAirDate",
        @"genres": @"genres",
        @"homepage": @"homepage",
        @"id": @"identifier",
        @"in_production": @"isInProduction",
        @"languages": @"languages",
        @"last_air_date": @"lastAirDate",
        @"last_episode_to_air": @"lastEpisodeToAir",
        @"name": @"name",
        @"next_episode_to_air": @"nextEpisodeToAir",
        @"networks": @"networks",
        @"number_of_episodes": @"numberOfEpisodes",
        @"number_of_seasons": @"numberOfSeasons",
        @"origin_country": @"originCountry",
        @"original_language": @"originalLanguage",
        @"original_name": @"originalName",
        @"overview": @"overview",
        @"popularity": @"popularity",
        @"poster_path": @"posterPath",
        @"production_companies": @"productionCompanies",
        @"production_countries": @"productionCountries",
        @"seasons": @"seasons",
        @"spoken_languages": @"spokenLanguages",
        @"status": @"status",
        @"tagline": @"tagline",
        @"type": @"type",
        @"vote_average": @"voteAverage",
        @"vote_count": @"voteCount",
    };
}

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass
{
    return @{
        @"created_by":[OSPGCreatedBy class],
        @"episode_run_time":[NSNumber class],
        @"genres":[OSPGGenre class],
        @"languages":[NSString class],
        @"networks":[OSPGNetwork class],
        @"origin_country":[NSString class],
        @"production_companies":[OSPGProductionCompany class],
        @"production_countries":[OSPGProductionCountry class],
        @"seasons":[OSPGSeason class],
        @"spoken_languages":[OSPGSpokenLanguage class],
    };
}

@end
