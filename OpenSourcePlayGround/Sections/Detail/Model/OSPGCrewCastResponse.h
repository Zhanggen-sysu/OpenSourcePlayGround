//
//  OSPGCrewCastResponse.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/12.
//

#import "OSPGBaseModel.h"

@class OSPGCast;
@class OSPGCrew;

NS_ASSUME_NONNULL_BEGIN

@interface OSPGCrewCastResponse : OSPGBaseModel

@property (nonatomic, assign) NSInteger identifier;
@property (nonatomic, copy)   NSArray<OSPGCast *> *cast;
@property (nonatomic, copy)   NSArray<OSPGCrew *> *crew;

@end

NS_ASSUME_NONNULL_END
