//
//  OSPGMessageViewController.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2022/12/15.
//

#import "OSPGMessageViewController.h"
#import "OSPGSignatureView.h"
#import "Masonry.h"

@interface OSPGMessageViewController ()

@property (nonatomic, strong) OSPGSignatureView *signatureView;
@property (nonatomic, strong) UIButton *clearBtn;
@property (nonatomic, strong) UIButton *revokeBtn;

@end

@implementation OSPGMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupSubviews];
    [self defineLayout];
}

- (void)setupSubviews
{
    [self.view addSubview:self.signatureView];
    [self.view addSubview:self.clearBtn];
    [self.view addSubview:self.revokeBtn];
}

- (void)defineLayout
{
    [self.signatureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.view);
        make.top.equalTo(self.view).offset(150.f);
        make.height.mas_equalTo(300);
    }];
    [self.clearBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.signatureView.mas_top).offset(-10.f);
        make.right.equalTo(self.view).offset(-20.f);
        make.size.mas_equalTo(CGSizeMake(60.f, 30.f));
    }];
    [self.revokeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.signatureView.mas_top).offset(-10.f);
        make.right.equalTo(self.clearBtn.mas_left).offset(-20.f);
        make.size.mas_equalTo(CGSizeMake(60.f, 30.f));
    }];
}

- (UIButton *)clearBtn
{
    if (!_clearBtn) {
        _clearBtn = [[UIButton alloc] init];
        [_clearBtn setTitle:@"清除" forState:UIControlStateNormal];
        [_clearBtn setTitleColor:kMainColor forState:UIControlStateNormal];
        _clearBtn.backgroundColor = [UIColor whiteColor];
        _clearBtn.layer.cornerRadius = 15.f;
        _clearBtn.layer.masksToBounds = YES;
        _clearBtn.layer.borderWidth = 1.f;
        _clearBtn.layer.borderColor = kMainColor.CGColor;
        [_clearBtn addTarget:self action:@selector(didTapClear) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clearBtn;
}

- (UIButton *)revokeBtn
{
    if (!_revokeBtn) {
        _revokeBtn = [[UIButton alloc] init];
        [_revokeBtn setTitle:@"回退" forState:UIControlStateNormal];
        [_revokeBtn setTitleColor:kMainColor forState:UIControlStateNormal];
        _revokeBtn.backgroundColor = [UIColor whiteColor];
        _revokeBtn.layer.cornerRadius = 15.f;
        _revokeBtn.layer.masksToBounds = YES;
        _revokeBtn.layer.borderWidth = 1.f;
        _revokeBtn.layer.borderColor = kMainColor.CGColor;
        [_revokeBtn addTarget:self action:@selector(didTapRevoke) forControlEvents:UIControlEventTouchUpInside];
    }
    return _revokeBtn;
}

- (OSPGSignatureView *)signatureView
{
    if (!_signatureView) {
        _signatureView = [[OSPGSignatureView alloc] init];
    }
    return _signatureView;
}

- (void)didTapClear
{
    [self.signatureView clear];
}

- (void)didTapRevoke
{
    [self.signatureView revoke];
}

@end
