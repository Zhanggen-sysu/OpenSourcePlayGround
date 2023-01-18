//
//  OSPGMovieListVC.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/18.
//

#import "OSPGMovieListVC.h"
#import "OSPGMovieResult.h"

@interface OSPGMovieListVC () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray<OSPGMovieResult *> *data;
@property (nonatomic, assign) OSPGMovieDiscoverType type;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation OSPGMovieListVC

- (instancetype)initWithTitle:(NSString *)title type:(OSPGMovieDiscoverType)type
{
    if (self = [super init]) {
        self.navigationItem.title = title;
        self.type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubviews];
    [self defineLayout];
}

- (void)setupSubviews
{
    
}

- (void)defineLayout
{
    
}

@end
