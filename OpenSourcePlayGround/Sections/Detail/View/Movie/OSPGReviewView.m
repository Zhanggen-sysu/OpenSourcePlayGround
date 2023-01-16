//
//  OSPGReviewView.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/13.
//

#import "OSPGReviewView.h"
#import "OSPGReviewSmallCell.h"
#import "OSPGReviewResponse.h"

@interface OSPGReviewView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UICollectionView *reviewColletion;
@property (nonatomic, strong) UIImageView *rightIcon;

@property (nonatomic, strong) OSPGReviewResponse *model;

@end

@implementation OSPGReviewView

#pragma mark - UI
- (void)setupSubviews
{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.titleLabel];
    [self addSubview:self.reviewColletion];
    [self addSubview:self.rightIcon];
}

- (void)defineLayout
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10.f);
        make.leading.equalTo(self).offset(15.f);
        make.trailing.equalTo(self).offset(-15.f);
    }];
    
    [self.reviewColletion mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10.f);
        make.leading.equalTo(self).offset(15.f);
        make.trailing.equalTo(self);
        make.height.mas_equalTo(150.f);
        make.bottom.equalTo(self).offset(-10.f);
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
        _titleLabel.text = @"Reviews";
    }
    return _titleLabel;
}

- (UICollectionView *)reviewColletion
{
    if (!_reviewColletion) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(100, 150);
        
        _reviewColletion = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _reviewColletion.showsHorizontalScrollIndicator = NO;
        _reviewColletion.delegate = self;
        _reviewColletion.dataSource = self;
        _reviewColletion.contentInset = UIEdgeInsetsMake(0, 0, 0, 15.f);
        [_reviewColletion registerClass:[OSPGReviewSmallCell class] forCellWithReuseIdentifier:NSStringFromClass([OSPGReviewSmallCell class])];
    }
    return _reviewColletion;
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
    OSPGReviewSmallCell *cell = (OSPGReviewSmallCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([OSPGReviewSmallCell class]) forIndexPath:indexPath];
    OSPGReviewResult *result = self.model.results[indexPath.row];
    [cell updateWithModel:result];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.model.results.count > 10 ? 10 : self.model.results.count;
}

#pragma mark - Data
- (void)updateWithModel:(OSPGReviewResponse *)model
{
    if (model.identifier == self.model.identifier)
    {
        return;
    }
    self.model = model;
    [self.reviewColletion reloadData];
}

@end
