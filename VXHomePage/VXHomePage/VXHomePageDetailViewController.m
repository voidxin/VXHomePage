//
//  VXHomePageDetailViewController.m
//  VXHomePage
//
//  Created by voidxin on 17/4/12.
//  Copyright © 2017年 voidxin. All rights reserved.
//

#import "VXHomePageDetailViewController.h"
#import <VXProtocolManager/VXProtocolManager.h>
#import <VXCommonPageServicePtotocol/VXCommonPageServicePtotocol.h>
@interface VXHomePageDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation VXHomePageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addUI];
    
}


#pragma mark - addUI 
- (void)addUI {
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.bounds;
}

#pragma mark - tableView delegate and Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    cell.textLabel.text = @"homepagedetail";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id <VXCommonPageServicePtotocol> private = [VXProtocolManager serviceProvideForProtocol:@protocol(VXCommonPageServicePtotocol)];
    UIViewController *commonVC = [private commonPageViewControllerWith:@"commonPage"];
    commonVC.title = @"commonPage";
    [self.navigationController pushViewController:commonVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - getter 

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}


@end
