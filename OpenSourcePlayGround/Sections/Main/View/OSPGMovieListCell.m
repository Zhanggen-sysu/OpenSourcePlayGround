//
//  OSPGMovieListCell.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/18.
//

#import "OSPGMovieListCell.h"
#import "Masonry.h"
#import "Macros.h"

@interface OSPGMovieListCell ()

@property (nonatomic, strong) UIImageView *posterImg;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subLabel;
@property (nonatomic, strong) UILabel *overviewLabel;
@property (nonatomic, strong) UIView *backView;

@end

@implementation OSPGMovieListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubviews];
        [self defineLayout];
    }
    return self;
}

- (void)setupSubviews
{
    [self.contentView addSubview:self.backView];
    [self.backView addSubview:self.posterImg];
    [self.backView addSubview:self.titleLabel];
    [self.backView addSubview:self.subLabel];
    [self.backView addSubview:self.overviewLabel];
}

- (void)defineLayout
{
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    [self.posterImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.backView).offset(15.f);
        make.top.equalTo(self.backView).offset(10.f);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH / 3, SCREEN_WIDTH / 2));
        make.bottom.equalTo(self.backView).offset(-10.f);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.posterImg.mas_right).offset(15.f);
        make.top.equalTo(self.backView).offset(10.f);
        make.trailing.equalTo(self.backView).offset(-15.f);
    }];
    [self.subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10.f);
        make.leading.trailing.equalTo(self.titleLabel);
    }];
    [self.overviewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.subLabel.mas_bottom).offset(10.f);
        make.leading.trailing.equalTo(self.titleLabel);
        make.bottom.equalTo(self.posterImg);
    }];
}

@end
