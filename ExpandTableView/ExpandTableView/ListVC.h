//
//  ListVC.h
//  ExpandTableView
//
//  Created by Qzhq on 2018/1/25.
//  Copyright © 2018年 Qzhq. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ListModel;
@interface ListVC : UITableViewController

@property (nonatomic, strong)NSMutableArray<ListModel *> *modelArr;

@end
