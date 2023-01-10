//
//  OSPGDiscoverRequest.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/6.
//

#import "OSPGBaseRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSPGDiscoverRequest : OSPGBaseRequest

//@property (nonatomic, copy) NSString *apiKey;
@property (nonatomic, copy) NSString *language;
@property (nonatomic, copy) NSString *region;
@property (nonatomic, copy) NSString *sortBy;
@property (nonatomic, copy) NSString *certificationCountry;
@property (nonatomic, copy) NSString *certification;
@property (nonatomic, copy) NSString *certificationLTE;
@property (nonatomic, copy) NSString *certificationGte;
@property (nonatomic, copy) NSString *includeAdult;
@property (nonatomic, copy) NSString *includeVideo;
@property (nonatomic, copy) NSString *page;
@property (nonatomic, copy) NSString *primaryReleaseYear;
@property (nonatomic, copy) NSString *primaryReleaseDateGte;
@property (nonatomic, copy) NSString *primaryReleaseDateLTE;
@property (nonatomic, copy) NSString *releaseDateGte;
@property (nonatomic, copy) NSString *releaseDateLTE;
@property (nonatomic, copy) NSString *withReleaseType;
@property (nonatomic, copy) NSString *year;
@property (nonatomic, copy) NSString *voteCountGte;
@property (nonatomic, copy) NSString *voteCountLTE;
@property (nonatomic, copy) NSString *voteAverageGte;
@property (nonatomic, copy) NSString *voteAverageLTE;
@property (nonatomic, copy) NSString *withCast;
@property (nonatomic, copy) NSString *withCrew;
@property (nonatomic, copy) NSString *withPeople;
@property (nonatomic, copy) NSString *withCompanies;
@property (nonatomic, copy) NSString *withGenres;
@property (nonatomic, copy) NSString *withoutGenres;
@property (nonatomic, copy) NSString *withKeywords;
@property (nonatomic, copy) NSString *withoutKeywords;
@property (nonatomic, copy) NSString *withRuntimeGte;
@property (nonatomic, copy) NSString *withRuntimeLTE;
@property (nonatomic, copy) NSString *withOriginalLanguage;
@property (nonatomic, copy) NSString *withWatchProviders;
@property (nonatomic, copy) NSString *watchRegion;
@property (nonatomic, copy) NSString *withWatchMonetizationTypes;
@property (nonatomic, copy) NSString *withoutCompanies;

@end

NS_ASSUME_NONNULL_END
