//
//  OSPGMedia.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/29.
//

#import "OSPGBaseModel.h"
@class OSPGSeason;

NS_ASSUME_NONNULL_BEGIN

@interface OSPGMedia : OSPGBaseModel

@property (nonatomic, assign) BOOL isAdult;
@property (nonatomic, copy)   NSString *backdropPath;
@property (nonatomic, assign) NSInteger identifier;
@property (nonatomic, copy)   NSString *name;
@property (nonatomic, copy)   NSString *originalLanguage;
@property (nonatomic, copy)   NSString *originalName;
@property (nonatomic, copy)   NSString *overview;
@property (nonatomic, copy)   NSString *posterPath;
@property (nonatomic, copy)   NSString *mediaType;
@property (nonatomic, copy)   NSArray<NSNumber *> *genreIDS;
@property (nonatomic, assign) double popularity;
@property (nonatomic, copy)   NSString *firstAirDate;
@property (nonatomic, assign) double voteAverage;
@property (nonatomic, assign) NSInteger voteCount;
@property (nonatomic, copy)   NSArray<NSString *> *originCountry;
@property (nonatomic, copy)   NSString *character;
@property (nonatomic, copy)   NSArray *episodes;
@property (nonatomic, copy)   NSArray<OSPGSeason *> *seasons;

@end

NS_ASSUME_NONNULL_END
