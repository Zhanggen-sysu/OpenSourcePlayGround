//
//  OSPGSimilarMovieView.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/16.
//

#import "OSPGSimilarMovieView.h"

@interface OSPGSimilarMovieView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation OSPGSimilarMovieView

#pragma mark - UI
- (void)setupSubviews
{
    [self addSubview:self.titleLabel];
    [self addSubview:self.collectionView];
}

- (void)defineLayout
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10.f);
        make.leading.equalTo(self).offset(15.f);
        make.trailing.equalTo(self).offset(-15.f);
    }];
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = kBoldFont(16.f);
        _titleLabel.text = @"More Like This";
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel
{
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        _subTitleLabel.font = kBoldFont(14.f);
        _subTitleLabel.text = @"YOU MIGHT ALSO LIKE";
    }
    return _subTitleLabel;
}

@end
