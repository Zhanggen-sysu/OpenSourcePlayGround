//
//  OSPGSimilarMovieView.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/16.
//

#import "OSPGSimilarMovieView.h"
#import "OSPGSimilarMovieCell.h"
#import "OSPGMovieResult.h"
#import "OSPGMovieDiscoverResponse.h"

static NSInteger kItemCount = 3;
@interface OSPGSimilarMovieView () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIImageView *rightIcon;

@property (nonatomic, strong) OSPGMovieDiscoverResponse *model;

@end

@implementation OSPGSimilarMovieView

#pragma mark - UI
- (void)setupSubviews
{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.titleLabel];
    [self addSubview:self.subTitleLabel];
    [self addSubview:self.collectionView];
    [self addSubview:self.rightIcon];
}

- (void)defineLayout
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10.f);
        make.leading.equalTo(self).offset(15.f);
        make.trailing.equalTo(self).offset(-15.f);
    }];
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10.f);
        make.leading.trailing.equalTo(self.titleLabel);
    }];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.subTitleLabel.mas_bottom).offset(10.f);
        make.leading.trailing.equalTo(self.titleLabel);
        make.bottom.equalTo(self).offset(-10.f);
        make.height.mas_equalTo([self itemSize].height);
    }];
    [self.rightIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self).offset(-15.f);
        make.centerY.equalTo(self.titleLabel);
        make.size.mas_equalTo(CGSizeMake(14.f, 14.f));
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
        _subTitleLabel.font = kFont(14.f);
        _subTitleLabel.text = @"YOU MIGHT ALSO LIKE";
    }
    return _subTitleLabel;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = [self itemSize];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 15.f);
        [_collectionView registerClass:[OSPGSimilarMovieCell class] forCellWithReuseIdentifier:NSStringFromClass([OSPGSimilarMovieCell class])];
    }
    return _collectionView;
}

- (UIImageView *)rightIcon
{
    if (!_rightIcon) {
        _rightIcon = [[UIImageView alloc] init];
        _rightIcon.image = kGetImage(@"rightArrowIcon");
    }
    return _rightIcon;
}

#pragma mark - UICollectionViewDelegate
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    OSPGSimilarMovieCell *cell = (OSPGSimilarMovieCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([OSPGSimilarMovieCell class]) forIndexPath:indexPath];
    OSPGMovieResult *result = self.model.results[indexPath.row];
    [cell updateWithModel:result];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.model.results.count > 10 ? 10 : self.model.results.count;
}

#pragma mark - Data
- (void)updateWithModel:(OSPGMovieDiscoverResponse *)model
{
    self.model = model;
    [self.collectionView reloadData];
}

- (CGSize)itemSize
{
    CGFloat width = (SCREEN_WIDTH - ((kItemCount) - 1) * 10) / kItemCount;
    CGFloat height = width * 1.5f + 61.f;
    return CGSizeMake(width, height);
}

@end
