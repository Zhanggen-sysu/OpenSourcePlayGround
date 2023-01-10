//
//  OSPGDiscoverCell.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/9.
//

#import <UIKit/UIKit.h>

@class OSPGDiscoverResult;
NS_ASSUME_NONNULL_BEGIN

@interface OSPGDiscoverCell : UICollectionViewCell

- (void)updateWithModel:(OSPGDiscoverResult *)result;

@end

NS_ASSUME_NONNULL_END
