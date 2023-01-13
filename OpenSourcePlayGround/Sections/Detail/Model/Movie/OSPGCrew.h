//
//  OSPGCrew.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/12.
//

#import "OSPGBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSPGCrew : OSPGBaseModel

@property (nonatomic, assign)         BOOL isAdult;
@property (nonatomic, assign)         NSInteger gender;
@property (nonatomic, assign)         NSInteger identifier;
@property (nonatomic, copy)           NSString *knownForDepartment;
@property (nonatomic, copy)           NSString *name;
@property (nonatomic, copy)           NSString *originalName;
@property (nonatomic, assign)         double popularity;
@property (nonatomic, nullable, copy) NSString *profilePath;
@property (nonatomic, copy)           NSString *creditID;
@property (nonatomic, copy)           NSString *department;
@property (nonatomic, copy)           NSString *job;

@end

NS_ASSUME_NONNULL_END
