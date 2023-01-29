//
//  OSPGCreatedBy.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/29.
//

#import "OSPGBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSPGCreatedBy : OSPGBaseModel

@property (nonatomic, assign) NSInteger identifier;
@property (nonatomic, copy)   NSString *creditID;
@property (nonatomic, copy)   NSString *name;
@property (nonatomic, assign) NSInteger gender;
@property (nonatomic, copy)   NSString *profilePath;

@end

NS_ASSUME_NONNULL_END
