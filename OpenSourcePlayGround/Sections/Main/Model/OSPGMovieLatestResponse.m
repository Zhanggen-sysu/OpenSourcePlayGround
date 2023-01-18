//
//  OSPGMovieLatestResponse.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/18.
//

#import "OSPGMovieLatestResponse.h"
#import "OSPGGenre.h"
#import "OSPGProductionCompany.h"
#import "OSPGProductionCountry.h"
#import "OSPGSpokenLanguage.h"

@implementation OSPGMovieLatestResponse

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"adult": @"isAdult",
        @"backdrop_path": @"backdropPath",
        @"belongs_to_collection": @"belongsToCollection",
        @"budget": @"budget",
        @"genres": @"genres",
        @"homepage": @"homepage",
        @"id": @"identifier",
        @"imdb_id": @"imdbID",
        @"original_language": @"originalLanguage",
        @"original_title": @"originalTitle",
        @"overview": @"overview",
        @"popularity": @"popularity",
        @"poster_path": @"posterPath",
        @"production_companies": @"productionCompanies",
        @"production_countries": @"productionCountries",
        @"release_date": @"releaseDate",
        @"revenue": @"revenue",
        @"runtime": @"runtime",
        @"spoken_languages": @"spokenLanguages",
        @"status": @"status",
        @"tagline": @"tagline",
        @"title": @"title",
        @"video": @"isVideo",
        @"vote_average": @"voteAverage",
        @"vote_count": @"voteCount",
    };
}

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass
{
    return @{
        @"genres":[OSPGGenre class],
        @"production_companies":[OSPGProductionCompany class],
        @"production_countries":[OSPGProductionCountry class],
        @"spoken_languages":[OSPGSpokenLanguage class],
    };
}

@end
