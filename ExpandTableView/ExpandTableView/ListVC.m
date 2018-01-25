//
//  ListVC.m
//  ExpandTableView
//
//  Created by Qzhq on 2018/1/25.
//  Copyright © 2018年 Qzhq. All rights reserved.
//

#import "ListVC.h"
#import "ListCell.h"

@interface ListVC ()

@end

@implementation ListVC
static NSString * const cellId = @"cellId";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
    self.tableView.backgroundColor = [UIColor whiteColor];
    // 下面这些设置为了刷新时不会出现抖动现象
    self.tableView.rowHeight = 52;
    self.tableView.estimatedRowHeight =0;
    self.tableView.tableHeaderView = [[UIView alloc] init];
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    [self.tableView registerClass:[ListCell class] forCellReuseIdentifier:cellId];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.modelArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    return cell;
}

@end
