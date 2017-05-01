//
//  LCNewsPageTableViewController.m
//  news
//
//  Created by Liu-Mac on 24/11/2016.
//  Copyright © 2016 Liu-Mac. All rights reserved.
//

#import "LCNewsPageTableViewController.h"

#import "LCNewsItem.h" // model
#import "LCNewsTableViewCell.h" // view
#import "NewsCellPresenter.h" // presenter
#import "DataTool.h" // dataTool

#import <MJExtension.h>
#import <SVProgressHUD.h>
#import <MJRefresh.h>

#import "LCWebViewController.h"

@interface LCNewsPageTableViewController ()

/** items */
@property (nonatomic, strong) NSArray<NewsCellPresenter *> *presenters;

@end

@implementation LCNewsPageTableViewController

- (void)getPresentersWithType:(NSString *)type {
    
    [[DataTool sharedInstance] getItemsWithType:type resultHandle:^(NSArray<LCNewsItem *> *models) {
        NSMutableArray *ps = [NSMutableArray array];
        for (LCNewsItem *model in models) {
            
            NewsCellPresenter *presenter = [NewsCellPresenter new];
            presenter.model = model;
            [ps addObject:presenter];
        }
        self.presenters = ps.copy;
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self getPresentersWithType:self.type];
    }];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"LCNewsTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellID"];
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark - table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.presenters.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *const ID = @"cellID";
    
    LCNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    [self.presenters[indexPath.row] bindWithCell:cell];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 70.0;
}

#pragma mark - table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LCWebViewController *webVC = [[LCWebViewController alloc] init];
    UIWebView *webV = (UIWebView *)webVC.view;
    NewsCellPresenter *item = self.presenters[indexPath.row];
    NSURLRequest *requst = [NSURLRequest requestWithURL:[NSURL URLWithString:item.model.url]];
    [webV loadRequest: requst];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:webVC];
    [self presentViewController:nav animated:YES completion:nil];
}

@end
