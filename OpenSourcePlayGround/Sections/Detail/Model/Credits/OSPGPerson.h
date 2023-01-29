//
//  OSPGPerson.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/29.
//

#import "OSPGBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSPGPerson : OSPGBaseModel

@property (nonatomic, assign) BOOL isAdult;
@property (nonatomic, assign) NSInteger identifier;
@property (nonatomic, copy)   NSString *name;
@property (nonatomic, copy)   NSString *originalName;
@property (nonatomic, copy)   NSString *mediaType;
@property (nonatomic, assign) double popularity;
@property (nonatomic, assign) NSInteger gender;
@property (nonatomic, copy)   NSString *knownForDepartment;
@property (nonatomic, copy)   NSString *profilePath;

@end

NS_ASSUME_NONNULL_END
