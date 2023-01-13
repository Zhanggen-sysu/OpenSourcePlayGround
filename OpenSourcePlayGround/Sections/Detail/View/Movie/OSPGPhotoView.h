//
//  OSPGPhotoView.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/13.
//

#import "OSPGBaseView.h"

@class OSPGImageResponse;
NS_ASSUME_NONNULL_BEGIN

@interface OSPGPhotoView : OSPGBaseView

- (void)updateWithModel:(OSPGImageResponse *)model;

@end

NS_ASSUME_NONNULL_END
