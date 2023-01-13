//
//  OSPGPoster.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/13.
//

#import "OSPGBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSPGPoster : OSPGBaseModel

@property (nonatomic, assign) double aspectRatio;
@property (nonatomic, copy)   NSString *filePath;
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, copy)   NSString *iso639_1;
@property (nonatomic, assign) NSInteger voteAverage;
@property (nonatomic, assign) NSInteger voteCount;
@property (nonatomic, assign) NSInteger width;

@end

NS_ASSUME_NONNULL_END
