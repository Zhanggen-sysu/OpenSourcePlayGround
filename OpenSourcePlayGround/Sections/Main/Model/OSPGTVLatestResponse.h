//
//  OSPGTVLatestResponse.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/29.
//

#import "OSPGBaseModel.h"

@class OSPGCreatedBy;
@class OSPGGenre;
@class OSPGLastEpisodeToAir;
@class OSPGNetwork;
@class OSPGProductionCompany;
@class OSPGProductionCountry;
@class OSPGSeason;
@class OSPGSpokenLanguage;
NS_ASSUME_NONNULL_BEGIN

@interface OSPGTVLatestResponse : OSPGBaseModel

@property (nonatomic, assign)         BOOL isAdult;
@property (nonatomic, copy)           NSString *backdropPath;
@property (nonatomic, copy)           NSArray<OSPGCreatedBy *> *createdBy;
@property (nonatomic, copy)           NSArray<NSNumber *> *episodeRunTime;
@property (nonatomic, copy)           NSString *firstAirDate;
@property (nonatomic, copy)           NSArray<OSPGGenre *> *genres;
@property (nonatomic, copy)           NSString *homepage;
@property (nonatomic, assign)         NSInteger identifier;
@property (nonatomic, assign)         BOOL isInProduction;
@property (nonatomic, copy)           NSArray<NSString *> *languages;
@property (nonatomic, copy)           NSString *lastAirDate;
@property (nonatomic, strong)         OSPGLastEpisodeToAir *lastEpisodeToAir;
@property (nonatomic, copy)           NSString *name;
@property (nonatomic, nullable, copy) id nextEpisodeToAir;
@property (nonatomic, copy)           NSArray<OSPGNetwork *> *networks;
@property (nonatomic, assign)         NSInteger numberOfEpisodes;
@property (nonatomic, assign)         NSInteger numberOfSeasons;
@property (nonatomic, copy)           NSArray<NSString *> *originCountry;
@property (nonatomic, copy)           NSString *originalLanguage;
@property (nonatomic, copy)           NSString *originalName;
@property (nonatomic, copy)           NSString *overview;
@property (nonatomic, assign)         double popularity;
@property (nonatomic, copy)           NSString *posterPath;
@property (nonatomic, copy)           NSArray<OSPGProductionCompany *> *productionCompanies;
@property (nonatomic, copy)           NSArray<OSPGProductionCountry *> *productionCountries;
@property (nonatomic, copy)           NSArray<OSPGSeason *> *seasons;
@property (nonatomic, copy)           NSArray<OSPGSpokenLanguage *> *spokenLanguages;
@property (nonatomic, copy)           NSString *status;
@property (nonatomic, copy)           NSString *tagline;
@property (nonatomic, copy)           NSString *type;
@property (nonatomic, assign)         double voteAverage;
@property (nonatomic, assign)         NSInteger voteCount;

@end

NS_ASSUME_NONNULL_END
