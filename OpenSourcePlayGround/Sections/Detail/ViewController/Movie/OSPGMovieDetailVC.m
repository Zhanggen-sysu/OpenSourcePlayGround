//
//  OSPGMovieDetailVC.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/11.
//

#import "OSPGMovieDetailVC.h"
#import "OSPGMovieDetailManager.h"
#import "OSPGMovieDetailView.h"
#import "OSPGCrewCastView.h"
#import "OSPGPhotoView.h"
#import "OSPGReviewView.h"
#import "OSPGCopyRightView.h"
#import "OSPGMovieDetailResponse.h"
#import "OSPGCrewCastResponse.h"
#import "OSPGImageResponse.h"
#import "OSPGReviewResponse.h"
#import <YPNavigationBarTransition/YPNavigationBarTransition.h>
#import "YPNavigationController+Configure.h"

static NSInteger kPosterHeight = 192.f;

@interface OSPGMovieDetailVC ()<YPNavigationBarConfigureStyle, UIScrollViewDelegate>

@property (nonatomic, assign) CGFloat gradientProgress;

@property (nonatomic, strong) UIScrollView *scrollView;
// Tips: 利用这个view使得UIScrollView的contentSize自适应
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) OSPGMovieDetailView *detailView;
@property (nonatomic, strong) OSPGCrewCastView *crewcastView;
@property (nonatomic, strong) OSPGPhotoView *photoView;
@property (nonatomic, strong) OSPGReviewView *reviewView;
@property (nonatomic, strong) OSPGCopyRightView *bottomBlock;

@property (nonatomic, strong) OSPGMovieDetailResponse *detailModel;
@property (nonatomic, strong) OSPGCrewCastResponse *crewcastModel;
@property (nonatomic, strong) OSPGImageResponse *imagesModel;
@property (nonatomic, strong) OSPGReviewResponse *reviewModel;

@end

@implementation OSPGMovieDetailVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(didTapAddBtn)];
    [self setupSubviews];
    [self defineLayout];
    [self loadData];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return self.gradientProgress < 0.5 ? UIStatusBarStyleLightContent : UIStatusBarStyleDarkContent;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation
{
    return UIStatusBarAnimationFade;
}

#pragma mark - UI
- (void)setupSubviews
{
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.contentView];
    [self.contentView addSubview:self.detailView];
    [self.contentView addSubview:self.crewcastView];
    [self.contentView addSubview:self.photoView];
    [self.contentView addSubview:self.reviewView];
    [self.contentView addSubview:self.bottomBlock];
}

- (void)defineLayout
{
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
    [self.detailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self.contentView);
    }];
    [self.crewcastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.detailView.mas_bottom).offset(15.f);
        make.leading.trailing.equalTo(self.contentView);
    }];
    [self.photoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.crewcastView.mas_bottom).offset(15.f);
        make.leading.trailing.equalTo(self.contentView);
    }];
    [self.reviewView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.photoView.mas_bottom).offset(15.f);
        make.leading.trailing.equalTo(self.contentView);
    }];
    [self.bottomBlock mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(50.f);
        make.bottom.equalTo(self.contentView);
        make.leading.trailing.equalTo(self.contentView);
        make.top.equalTo(self.reviewView.mas_bottom);
    }];
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.backgroundColor = RGBColor(240, 240, 240);
        _scrollView.delegate = self;
        // Tips: 去除scrollView顶部空白区域
        if (@available(iOS 11, *)) {
            _scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            _scrollView.automaticallyAdjustsScrollIndicatorInsets = NO;
        }
    }
    return _scrollView;
}

- (UIView *)contentView
{
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = RGBColor(240, 240, 240);
    }
    return _contentView;
}

- (OSPGMovieDetailView *)detailView
{
    if (!_detailView) {
        _detailView = [[OSPGMovieDetailView alloc] init];
    }
    return _detailView;
}

- (OSPGCrewCastView *)crewcastView
{
    if (!_crewcastView) {
        _crewcastView = [[OSPGCrewCastView alloc] init];
    }
    return _crewcastView;
}

- (OSPGPhotoView *)photoView
{
    if (!_photoView) {
        _photoView = [[OSPGPhotoView alloc] init];
    }
    return _photoView;
}

- (OSPGReviewView *)reviewView
{
    if (!_reviewView) {
        _reviewView = [[OSPGReviewView alloc] init];
    }
    return _reviewView;
}

- (OSPGCopyRightView *)bottomBlock
{
    if (!_bottomBlock) {
        _bottomBlock = [[OSPGCopyRightView alloc] init];
    }
    return _bottomBlock;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat gradientProgress = scrollView.contentOffset.y / kPosterHeight;
    if (gradientProgress != self.gradientProgress) {
        if ((gradientProgress >= 0.5 && self.gradientProgress < 0.5) || (self.gradientProgress >= 0.5 && gradientProgress < 0.5)) {
            self.gradientProgress = gradientProgress;
            [self setNeedsStatusBarAppearanceUpdate];
            [self yp_refreshNavigationBarStyle];
        } else {
            self.gradientProgress = gradientProgress;
            [self yp_refreshNavigationBarStyle];
        }
    }
}

- (YPNavigationBarConfigurations)yp_navigtionBarConfiguration {
    YPNavigationBarConfigurations configurations = YPNavigationBarShow;
    if (@available(iOS 13.0, *)) {
        if (self.gradientProgress <= 0) {
            configurations |= YPNavigationBarBackgroundStyleTransparent;
        } else {
            configurations |= YPNavigationBarBackgroundStyleOpaque;
            configurations |= YPNavigationBarBackgroundStyleColor;
        }
    } else {
        if (self.gradientProgress < 0.5) {
            configurations |= YPNavigationBarStyleBlack;
        }
        
        if (self.gradientProgress == 1) {
            configurations |= YPNavigationBarBackgroundStyleOpaque;
        }

        configurations |= YPNavigationBarBackgroundStyleColor;
    }
    return configurations;
}

- (UIColor *)yp_navigationBarTintColor {
    return [UIColor colorWithWhite:1 - self.gradientProgress alpha:1];
}

- (UIColor *)yp_navigationBackgroundColor {
    return [UIColor colorWithWhite:1 alpha:self.gradientProgress];
}

#pragma mark - Data
- (void)loadData
{
    [OSPGCommonHelper showLoadingInView:self.view animated:YES];
    [[OSPGMovieDetailManager sharedManager] getMovieDetailWithId:self.movieId
                                                 completionBlock:^(BOOL isSuccess, id  _Nullable rsp, NSString * _Nullable errorMessage) {
        [OSPGCommonHelper hideLoadingInView:self.view animated:YES];
        if (isSuccess) {
            self.detailModel = (OSPGMovieDetailResponse *)rsp;
            [self.detailView updateWithModel:self.detailModel];
        } else {
            [OSPGCommonHelper showMessage:errorMessage inView:self.view duration:1];
        }
    }];
    
    [[OSPGMovieDetailManager sharedManager] getCastCrewWithId:self.movieId completionBlock:^(BOOL isSuccess, id  _Nullable rsp, NSString * _Nullable errorMessage) {
        [OSPGCommonHelper hideLoadingInView:self.view animated:YES];
        if (isSuccess) {
            self.crewcastModel = (OSPGCrewCastResponse *)rsp;
            [self.crewcastView updateWithModel:self.crewcastModel];
        } else {
            [OSPGCommonHelper showMessage:errorMessage inView:self.view duration:1];
        }
    }];
    
    [[OSPGMovieDetailManager sharedManager] getImagesWithId:self.movieId completionBlock:^(BOOL isSuccess, id  _Nullable rsp, NSString * _Nullable errorMessage) {
        if (isSuccess) {
            self.imagesModel = (OSPGImageResponse *)rsp;
            [self.photoView updateWithModel:self.imagesModel];
        } else {
            [OSPGCommonHelper showMessage:errorMessage inView:self.view duration:1];
        }
    }];
    
    [[OSPGMovieDetailManager sharedManager] getReviewsWithId:self.movieId loadMore:NO completionBlock:^(BOOL isSuccess, id  _Nullable rsp, NSString * _Nullable errorMessage) {
        if (isSuccess) {
            self.reviewModel = (OSPGReviewResponse *)rsp;
            if (self.reviewModel.results.count <= 0) {
                [self.reviewView removeFromSuperview];
                [self.bottomBlock mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.photoView.mas_bottom);
                }];
            } else if (!self.reviewView.superview) {
                [self.contentView addSubview:self.reviewView];
                [self.reviewView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.photoView.mas_bottom).offset(15.f);
                    make.leading.trailing.equalTo(self.contentView);
                }];
                [self.bottomBlock mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.height.mas_equalTo(50.f);
                    make.bottom.equalTo(self.contentView);
                    make.leading.trailing.equalTo(self.contentView);
                    make.top.equalTo(self.reviewView.mas_bottom);
                }];
                [self.reviewView updateWithModel:self.reviewModel];
            } else {
                [self.reviewView updateWithModel:self.reviewModel];
            }
        } else {
            [OSPGCommonHelper showMessage:errorMessage inView:self.view duration:1];
        }
    }];
}

#pragma mark - action
- (void)didTapAddBtn
{
    
}


@end
