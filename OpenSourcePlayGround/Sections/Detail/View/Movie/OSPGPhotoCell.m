//
//  OSPGPhotoCell.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/13.
//

#import "OSPGPhotoCell.h"
#import "Masonry.h"
#import "Macros.h"
#import "UIImageView+WebCache.h"

@interface OSPGPhotoCell ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation OSPGPhotoCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setupSubviews];
        [self defineLayout];
    }
    return self;
}

 - (void)setupSubviews
{
    [self.contentView addSubview:self.imageView];
}

- (void)defineLayout
{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

- (void)updateWithUrl:(NSURL *)url
{
    [self.imageView sd_setImageWithURL:url placeholderImage:kGetImage(@"backdropDefault")];
}

@end
