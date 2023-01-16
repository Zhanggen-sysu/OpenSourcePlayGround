//
//  OSPGReviewSmallCell.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/13.
//

#import "OSPGReviewSmallCell.h"
#import "Masonry.h"
#import "Macros.h"
#import "OSPGReviewResult.h"
#import "OSPGReviewAuthorDetails.h"

@interface OSPGReviewSmallCell ()

@property (nonatomic, strong) OSPGReviewResult *model;

@property (nonatomic, strong) UILabel *ratingLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *reviewLabel;
@property (nonatomic, strong) UIButton *seeAllBtn;
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
        make.top.left.equalTo(self.backView).offset(10.f);
        make.right.equalTo(self.backView).offset(-10.f);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.ratingLabel);
        make.top.equalTo(self.ratingLabel.mas_bottom).offset(5.f);
    }];
    
    [self.reviewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.ratingLabel);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(5.f);
        make.bottom.lessThanOrEqualTo(self.backView).offset(-10.f);
    }];
}

- (UILabel *)ratingLabel
{
    if (!_ratingLabel) {
        _ratingLabel = [[UILabel alloc] init];
    }
    return _ratingLabel;
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
        _nameLabel.font = kFont(10.f);
        _nameLabel.numberOfLines = 2;
    }
    return _nameLabel;
}

- (UILabel *)reviewLabel
{
    if (!_reviewLabel) {
        _reviewLabel = [[UILabel alloc] init];
        _reviewLabel.font = kFont(10.f);
        _reviewLabel.textColor = RGBColor(128.f, 128.f, 128.f);
        _reviewLabel.numberOfLines = 0;
    }
    return _reviewLabel;
}

#pragma mark - data
- (void)updateWithModel:(OSPGReviewResult *)model
{
    if (model.identifier == self.model.identifier) {
        return;
    }
    self.model = model;
    NSMutableAttributedString *ratingStr = [[NSMutableAttributedString alloc] init];
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.image = kGetImage(@"starFullIcon");
    attach.bounds = CGRectMake(0, -3, 14.f, 14.f);
    NSDictionary *attri = @{
        NSFontAttributeName: kFont(10.f),
    };
    [ratingStr appendAttributedString:[NSAttributedString attributedStringWithAttachment:attach]];
    [ratingStr appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@" %@/10", model.authorDetails.rating ?: @""] attributes:attri]];
    
    self.ratingLabel.attributedText = ratingStr;
    if (model.authorDetails.name.length <= 0) {
        [self.nameLabel removeFromSuperview];
        [self.reviewLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.ratingLabel.mas_bottom).offset(5.f);
        }];
        
    } else if (!self.nameLabel.superview){
        [self.backView addSubview:self.nameLabel];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.ratingLabel);
            make.top.equalTo(self.ratingLabel.mas_bottom).offset(5.f);
        }];
        [self.reviewLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.ratingLabel);
            make.top.equalTo(self.nameLabel.mas_bottom).offset(5.f);
            make.bottom.lessThanOrEqualTo(self.backView).offset(-10.f);
        }];
        self.nameLabel.text = model.authorDetails.name;
    } else {
        self.nameLabel.text = model.authorDetails.name;
    }
    self.reviewLabel.text = model.content;
}

@end
