//
//  ListVC.m
//  ExpandTableView
//
//  Created by Qzhq on 2018/1/25.
//  Copyright © 2018年 Qzhq. All rights reserved.
//

#import "ListVC.h"
#import "ListCell.h"
#import "ListModel.h"

@interface ListVC ()

@end

@implementation ListVC
static NSString * const cellId = @"cellId";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    [self configTableView];
    
}

// 下面这些设置为了刷新时不会出现抖动现象
- (void)configTableView {
    self.tableView.rowHeight = 52;
    self.tableView.estimatedRowHeight =0;
    self.tableView.tableHeaderView = [[UIView alloc] init];
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    [self.tableView registerClass:[ListCell class] forCellReuseIdentifier:cellId];
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
    [cell cellWithModel:self.modelArr[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ListModel *model = self.modelArr[indexPath.row];
    if (model.subListModel.count == 0 && model.belowCount == 0) {
        return;
    }
    [self.tableView beginUpdates];
    if (model.belowCount == 0) {
        [self openWithModel:model indexPath:indexPath];
    } else {
        [self closeWithModel:model indexPath:indexPath];
    }
    [self.tableView endUpdates];
}

- (void)openWithModel:(ListModel *)model indexPath:(NSIndexPath *)indexPath {
    // data
    NSInteger subModelCount = self.modelArr.count;
    NSArray *subModels = [model open];
    NSIndexSet *indexes = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(indexPath.row+1, subModels.count)];
    [self.modelArr insertObjects:subModels atIndexes:indexes];
    
    // row
    NSMutableArray *indexPaths = [NSMutableArray new];
    for (int i = 0; i < self.modelArr.count - subModelCount; i++) {
        NSIndexPath *insertIndexPath = [NSIndexPath indexPathForRow:(indexPath.row+1+i) inSection:indexPath.section];
        [indexPaths addObject:insertIndexPath];
    }
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
}
- (void)closeWithModel:(ListModel *)model indexPath:(NSIndexPath *)indexPath {
    // data
    NSArray *subModels = [self.modelArr subarrayWithRange:NSMakeRange(indexPath.row+1, model.belowCount)];
    [model closeWithSubModels:subModels];
    [self.modelArr removeObjectsInArray:subModels];
    
    // row
    NSMutableArray *indexPaths = [NSMutableArray new];
    for (int i = 0; i < subModels.count; i++) {
        NSIndexPath *insertIndexPath = [NSIndexPath indexPathForRow:(indexPath.row+1+i) inSection:indexPath.section];
        [indexPaths addObject:insertIndexPath];
    }
    [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
