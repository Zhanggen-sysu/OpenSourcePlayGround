//
//  OSPGReviewSmallCell.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/13.
//

#import "OSPGReviewSmallCell.h"
#import "Masonry.h"
#import "Macros.h"

@interface OSPGReviewSmallCell ()

@property (nonatomic, strong) UILabel *ratingLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *reviewLabel;
@property (nonatomic, strong) UIView *backView;

@end

@implementation OSPGReviewSmallCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setupSubviews];
        [self defineLayout];
    }
    return self;
}

#pragma mark - UI
- (void)setupSubviews
{
    [self.contentView addSubview:self.backView];
    [self.backView addSubview:self.ratingLabel];
    [self.backView addSubview:self.nameLabel];
    [self.backView addSubview:self.reviewLabel];
}

- (void)defineLayout
{
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
    [self.ratingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    
    [self.reviewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
}

- (UIView *)backView
{
    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = RGBColor(220, 220, 220);
        ViewBorderRadius(_backView, 15.f, 0, [UIColor whiteColor]);
    }
    return _backView;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = kFont(14.f);
    }
    return _nameLabel;
}

- (UILabel *)reviewLabel
{
    if (!_reviewLabel) {
        _reviewLabel = [[UILabel alloc] init];
        _reviewLabel.font = kFont(12.f);
        _reviewLabel.textColor = RGBColor(128.f, 128.f, 128.f);
        _reviewLabel.numberOfLines = 0;
    }
    return _reviewLabel;
}

#pragma mark - data
- (void)updateWithModel:(OSPGReviewResult *)model
{
    
}

@end
