//
//  OSPGImageResponse.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/13.
//

#import "OSPGBaseModel.h"

@class OSPGBackdrop;
@class OSPGPoster;

NS_ASSUME_NONNULL_BEGIN

@interface OSPGImageResponse : OSPGBaseModel

@property (nonatomic, assign) NSInteger identifier;
@property (nonatomic, copy)   NSArray<OSPGBackdrop *> *backdrops;
@property (nonatomic, copy)   NSArray<OSPGPoster *> *posters;

@end

NS_ASSUME_NONNULL_END
