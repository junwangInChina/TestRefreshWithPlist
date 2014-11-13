//
//  ViewController.m
//  TestRefreshWithPlist
//
//  Created by wangjun on 14-11-12.
//  Copyright (c) 2014年 wangjun. All rights reserved.
//

#import "ViewController.h"
//#import "CUSPlistFileRefreshView.h"
#import <CUSUI/CUSUI.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,CUSPlistFileRefreshViewDelegate>

@property (nonatomic, retain) UITableView *mainTable;
@property (nonatomic, retain) CUSPlistFileRefreshView *refreshView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mainTable = [[UITableView alloc] initWithFrame:self.view.bounds
                                                  style:UITableViewStylePlain];
    _mainTable.delegate = self;
    _mainTable.dataSource = self;
    [self.view addSubview:_mainTable];
    
    UIView *zeroView = [UIView new];
    _mainTable.tableFooterView = zeroView;
    
    self.refreshView = [[CUSPlistFileRefreshView alloc] initWithPlist:@"LOVE"];
    _refreshView.delegate = self;
    _refreshView.lineColor = [UIColor redColor];
    _refreshView.zoomScale = 0.8;
    [_mainTable addSubview:_refreshView];
    
}

#pragma mark - UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tabIdentifier = @"MainTableViewCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tabIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tabIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第 %ld 行",(long)indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - CUSPlistFileRefreshViewDelegate
- (void)cusplistRefeshViewDidStarRefresh:(CUSPlistFileRefreshView *)view
{
    NSLog(@"start loading");
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.refreshView refreshFinished];
        NSLog(@"end loading");
    });
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.refreshView scrollViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self.refreshView scrollViewDidEndDragging:scrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
