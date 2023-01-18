//
//  OSPGMovieLatestResponse.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/18.
//

#import "OSPGBaseModel.h"
@class OSPGGenre;
@class OSPGProductionCompany;
@class OSPGProductionCountry;
@class OSPGSpokenLanguage;
NS_ASSUME_NONNULL_BEGIN

@interface OSPGMovieLatestResponse : OSPGBaseModel

@property (nonatomic, assign)         BOOL isAdult;
@property (nonatomic, nullable, copy) NSString *backdropPath;
@property (nonatomic, nullable, copy) NSString *belongsToCollection;
@property (nonatomic, assign)         NSInteger budget;
@property (nonatomic, copy)           NSArray<OSPGGenre *> *genres;
@property (nonatomic, copy)           NSString *homepage;
@property (nonatomic, assign)         NSInteger identifier;
@property (nonatomic, copy)           NSString *imdbID;
@property (nonatomic, copy)           NSString *originalLanguage;
@property (nonatomic, copy)           NSString *originalTitle;
@property (nonatomic, copy)           NSString *overview;
@property (nonatomic, assign)         NSInteger popularity;
@property (nonatomic, copy)           NSString *posterPath;
@property (nonatomic, copy)           NSArray<OSPGProductionCompany *> *productionCompanies;
@property (nonatomic, copy)           NSArray<OSPGProductionCountry *> *productionCountries;
@property (nonatomic, copy)           NSString *releaseDate;
@property (nonatomic, assign)         NSInteger revenue;
@property (nonatomic, assign)         NSInteger runtime;
@property (nonatomic, copy)           NSArray<OSPGSpokenLanguage *> *spokenLanguages;
@property (nonatomic, copy)           NSString *status;
@property (nonatomic, copy)           NSString *tagline;
@property (nonatomic, copy)           NSString *title;
@property (nonatomic, assign)         BOOL isVideo;
@property (nonatomic, assign)         NSInteger voteAverage;
@property (nonatomic, assign)         NSInteger voteCount;

@end

NS_ASSUME_NONNULL_END
