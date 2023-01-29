//
//  OSPGTVResult.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/29.
//

#import "OSPGBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSPGTVResult : OSPGBaseModel

@property (nonatomic, copy)           NSString *posterPath;
@property (nonatomic, assign)         double popularity;
@property (nonatomic, assign)         NSInteger identifier;
@property (nonatomic, nullable, copy) NSString *backdropPath;
@property (nonatomic, assign)         double voteAverage;
@property (nonatomic, copy)           NSString *overview;
@property (nonatomic, copy)           NSString *firstAirDate;
@property (nonatomic, copy)           NSArray<NSString *> *originCountry;
@property (nonatomic, copy)           NSArray<NSNumber *> *genreIDS;
@property (nonatomic, copy)           NSString *originalLanguage;
@property (nonatomic, assign)         NSInteger voteCount;
@property (nonatomic, copy)           NSString *name;
@property (nonatomic, copy)           NSString *originalName;

@end

NS_ASSUME_NONNULL_END
