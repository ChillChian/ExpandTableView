//
//  ListCell.h
//  ExpandTableView
//
//  Created by Qzhq on 2018/1/24.
//  Copyright © 2018年 Qzhq. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ListModel;

@interface ListCell : UITableViewCell

- (void)cellWithModel:(ListModel *)model;

@end
