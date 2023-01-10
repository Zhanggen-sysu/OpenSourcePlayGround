//
//  OSPGMainVC.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2022/12/15.
//

#import "OSPGMainVC.h"
#import "Masonry.h"
#import "JXCategoryView.h"
#import "OSPGDiscoverManager.h"
#import "OSPGDiscoverResponse.h"
#import "OSPGDiscoverCell.h"
#import "OSPGCommonHelper.h"
#import "MJRefresh.h"

static NSString *kDiscoverCellID = @"kDiscoverCellID";
// 每行cell数
static NSInteger kDiscoverRowCount = 2;

@interface OSPGMainVC () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UIView *navigationBar;
@property (nonatomic, strong) UIButton *searchBtn;
@property (nonatomic, strong) JXCategoryTitleView *segmentView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray<OSPGDiscoverResult *> *data;

@end

@implementation OSPGMainVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = RGBColor(240, 240, 240);
    self.navigationController.navigationBar.hidden = YES;
    [self setupSubviews];
    [self defineLayout];
    [self loadDefaultData:NO];
}

#pragma mark - Data
- (void)loadDefaultData:(BOOL)loadMore
{
    [[OSPGDiscoverManager sharedManager] getDiscoverDefault:^(BOOL isSuccess, id  _Nullable rsp, NSString * _Nullable errorMessage) {
        if (isSuccess) {
            OSPGDiscoverResponse *response = (OSPGDiscoverResponse *)rsp;
            if (loadMore) {
                [self.data addObjectsFromArray:response.results];
            } else {
                self.data = [response.results mutableCopy];
            }
            [self.collectionView reloadData];
        } else {
            [OSPGCommonHelper showMessage:errorMessage inView:self.view duration:1];
        }
        if (loadMore) {
            [self.collectionView.mj_footer endRefreshing];
        } else {
            [self.collectionView.mj_header endRefreshing];
        }
    } loadMore:loadMore];
}

#pragma mark - UI
- (void)setupSubviews
{
    [self.view addSubview:self.navigationBar];
    [self.navigationBar addSubview:self.searchBtn];
    
    [self.view addSubview:self.collectionView];
}

- (void)defineLayout
{
    [self.navigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
    }];
    [self.searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(10.f);
        } else {
            make.top.mas_equalTo(10.f);
        }
        make.bottom.equalTo(self.navigationBar).offset(-10.f);
        make.left.equalTo(self.navigationBar).offset(15.f);
        make.right.equalTo(self.navigationBar).offset(-15.f);
        make.height.mas_equalTo(40.f);
    }];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navigationBar.mas_bottom);
        make.bottom.equalTo(self.view);
        make.left.equalTo(self.view).offset(10.f);
        make.right.equalTo(self.view).offset(-10.f);
    }];
}

#pragma mark - UITableViewDelegate
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    OSPGDiscoverCell *cell = (OSPGDiscoverCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kDiscoverCellID forIndexPath:indexPath];
    OSPGDiscoverResult *result = self.data[indexPath.row];
    [cell updateWithModel:result];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UIButton *)searchBtn
{
    if (!_searchBtn) {
        _searchBtn = [[UIButton alloc] init];
        [_searchBtn setImage:kGetImage(@"SearchIcon") forState:UIControlStateNormal];
        [_searchBtn setTitle:@"Search Movies, TV Shows and Actors" forState:UIControlStateNormal];
        [_searchBtn setTitleColor:RGBColor(128, 128, 128) forState:UIControlStateNormal];
        _searchBtn.titleLabel.font = kFont(14.f);
        _searchBtn.backgroundColor = RGBColor(220, 220, 220);
        _searchBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeading;
        _searchBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        _searchBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
        [_searchBtn addTarget:self action:@selector(didTapSearchBtn) forControlEvents:UIControlEventTouchUpInside];
        ViewBorderRadius(_searchBtn, 5.0f, 0, RGBColor(0, 0, 0));
    }
    return _searchBtn;
}

- (UIView *)navigationBar
{
    if (!_navigationBar) {
        _navigationBar = [[UIView alloc] init];
        _navigationBar.backgroundColor = [UIColor whiteColor];
    }
    return _navigationBar;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        CGFloat width = (SCREEN_WIDTH - 10 * (kDiscoverRowCount+1)) / kDiscoverRowCount;
        CGFloat height = width * 1.5 + 15.f + 36.f;
        layout.itemSize = CGSizeMake(width, height);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = RGBColor(240, 240, 240);
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[OSPGDiscoverCell class] forCellWithReuseIdentifier:kDiscoverCellID];
        WeakSelf(self);
        _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            StrongSelfReturnNil(self);
            [self loadDefaultData:NO];
        }];
        
        _collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            StrongSelfReturnNil(self);
            [self loadDefaultData:YES];
        }];
    }
    return _collectionView;
}

#pragma mark - action
- (void)didTapSearchBtn
{
    NSLog(@"Test didTapSearchBtn");
}

@end
