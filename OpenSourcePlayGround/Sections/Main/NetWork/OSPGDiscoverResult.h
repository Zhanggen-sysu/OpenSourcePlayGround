//
//  OSPGDiscoverResult.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/9.
//

#import "OSPGBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSPGDiscoverResult : OSPGBaseModel

@property (nonatomic, nullable, copy) NSString *posterPath;
@property (nonatomic, assign)         BOOL isAdult;
@property (nonatomic, copy)           NSString *overview;
@property (nonatomic, copy)           NSString *releaseDate;
@property (nonatomic, copy)           NSArray<NSNumber *> *genreIDS;
@property (nonatomic, assign)         NSInteger identifier;
@property (nonatomic, copy)           NSString *originalTitle;
@property (nonatomic, copy)           NSString *originalLanguage;
@property (nonatomic, copy)           NSString *title;
@property (nonatomic, nullable, copy) NSString *backdropPath;
@property (nonatomic, assign)         double popularity;
@property (nonatomic, assign)         NSInteger voteCount;
@property (nonatomic, assign)         BOOL isVideo;
@property (nonatomic, assign)         double voteAverage;

@end

NS_ASSUME_NONNULL_END
