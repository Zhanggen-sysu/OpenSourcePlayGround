//
//  OSPGDiscoverView.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/17.
//

#import "OSPGDiscoverView.h"
#import "OSPGDiscoverCell.h"
#import "OSPGMovieResult.h"
#import "OSPGTVResult.h"
#import "OSPGMovieDiscoverResponse.h"
#import "OSPGTVDiscoverResponse.h"

static NSInteger kItemCount = 3;
@interface OSPGDiscoverView () <UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate>

@property (nonatomic, strong) OSPGMovieDiscoverResponse *model;
@property (nonatomic, strong) OSPGTVDiscoverResponse *tvModel;
@property (nonatomic, assign) BOOL isMovie;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIImageView *rightIcon;

@end

@implementation OSPGDiscoverView

- (void)setupSubviews
{
    self.backgroundColor = [UIColor whiteColor];
    UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapShowMore)];
    ges.delegate = self;
    [self addGestureRecognizer:ges];
    [self addSubview:self.titleLabel];
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
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10.f);
        make.leading.equalTo(self).offset(15.f);
        make.trailing.equalTo(self);
        make.bottom.equalTo(self).offset(-10.f);
        make.height.mas_equalTo([self itemSize].height);
    }];
    [self.rightIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.titleLabel);
        make.centerY.equalTo(self.titleLabel);
        make.size.mas_equalTo(CGSizeMake(14.f, 14.f));
    }];
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.isMovie) {
        OSPGMovieResult *result = self.model.results[indexPath.row];
        !self.didTapItemBlock ?: self.didTapItemBlock(result.identifier);
    } else {
        OSPGTVResult *result = self.tvModel.results[indexPath.row];
        !self.didTapItemBlock ?: self.didTapItemBlock(result.identifier);
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    OSPGDiscoverCell *cell = (OSPGDiscoverCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([OSPGDiscoverCell class]) forIndexPath:indexPath];
    if (self.isMovie) {
        OSPGMovieResult *result = self.model.results[indexPath.row];
        [cell updateWithModel:result];
    } else {
        OSPGTVResult *result = self.tvModel.results[indexPath.row];
        [cell updateWithTVModel:result];
    }
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger cnt = self.isMovie ? self.model.results.count : self.tvModel.results.count;
    return cnt > 10 ? 10 : cnt;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = kBoldFont(16.f);
    }
    return _titleLabel;
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
        [_collectionView registerClass:[OSPGDiscoverCell class] forCellWithReuseIdentifier:NSStringFromClass([OSPGDiscoverCell class])];
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

#pragma mark - data
- (void)updateWithModel:(OSPGMovieDiscoverResponse *)model
{
    self.model = model;
    self.isMovie = YES;
    [self.collectionView reloadData];
}

- (void)updateWithTVModel:(OSPGTVDiscoverResponse *)model
{
    self.tvModel = model;
    self.isMovie = NO;
    [self.collectionView reloadData];
}

- (CGSize)itemSize
{
    CGFloat width = (SCREEN_WIDTH - (kItemCount - 1) * 10) / 3;
    CGFloat height =  width * 1.5f;
    return CGSizeMake(width, height);
}

- (void)setTitle:(NSString *)title
{
    self.titleLabel.text = title;
}

#pragma mark - action
- (void)didTapShowMore
{
    !self.didTapShowMoreBlock ?: self.didTapShowMoreBlock();
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    CGPoint point = [touch locationInView:self];
    if (CGRectContainsPoint(self.collectionView.frame, point)) {
        return NO;
    }
    return YES;
}

@end
