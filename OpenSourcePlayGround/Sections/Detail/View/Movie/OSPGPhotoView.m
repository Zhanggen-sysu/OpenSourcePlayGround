//
//  OSPGPhotoView.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/13.
//

#import "OSPGPhotoView.h"
#import "OSPGPhotoCell.h"
#import "OSPGImageResponse.h"
#import "OSPGBackdrop.h"
#import "OSPGCommonHelper.h"

@interface OSPGPhotoView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) OSPGImageResponse *model;
@property (nonatomic, strong) UICollectionView *photoCollection;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *rightArrowIcon;

@end

@implementation OSPGPhotoView

#pragma mark - UI
- (void)setupSubviews
{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.titleLabel];
    [self addSubview:self.photoCollection];
    [self addSubview:self.rightArrowIcon];
}

- (void)defineLayout
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10.f);
        make.leading.equalTo(self).offset(15.f);
        make.trailing.equalTo(self).offset(-15.f);
    }];
    [self.photoCollection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10.f);
        make.leading.equalTo(self).offset(15.f);
        make.trailing.equalTo(self);
        make.height.mas_equalTo(110.f);
        make.bottom.equalTo(self).offset(-10.f);
    }];
    [self.rightArrowIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self).offset(-15.f);
        make.centerY.equalTo(self.titleLabel);
        make.size.mas_equalTo(CGSizeMake(14.f, 14.f));
    }];
}

#pragma mark - UICollectionViewDelegate
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    OSPGPhotoCell *cell = (OSPGPhotoCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([OSPGPhotoCell class]) forIndexPath:indexPath];
    OSPGBackdrop *backdrop = self.model.backdrops[indexPath.row];
    [cell updateWithUrl:[OSPGCommonHelper getBackdropUrl:backdrop.filePath size:OSPGBackdropSize_w300]];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.model.backdrops.count > 10 ? 10 : self.model.backdrops.count;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = kBoldFont(16.f);
        _titleLabel.text = @"Photos";
    }
    return _titleLabel;
}

- (UICollectionView *)photoCollection
{
    if (!_photoCollection) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(225, 128);
        
        _photoCollection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _photoCollection.showsHorizontalScrollIndicator = NO;
        _photoCollection.delegate = self;
        _photoCollection.dataSource = self;
        _photoCollection.contentInset = UIEdgeInsetsMake(0, 0, 0, 15.f);
        [_photoCollection registerClass:[OSPGPhotoCell class] forCellWithReuseIdentifier:NSStringFromClass([OSPGPhotoCell class])];
    }
    return _photoCollection;
}

- (UIImageView *)rightArrowIcon
{
    if (!_rightArrowIcon) {
        _rightArrowIcon = [[UIImageView alloc] init];
        _rightArrowIcon.image = [UIImage imageNamed:@"rightArrowIcon"];
    }
    return _rightArrowIcon;
}

- (void)updateWithModel:(OSPGImageResponse *)model
{
    if (model.identifier == self.model.identifier) {
        return;
    }
    self.model = model;
    [self.photoCollection reloadData];
}


@end
