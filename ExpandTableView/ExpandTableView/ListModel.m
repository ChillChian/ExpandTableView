//
//  ListModel.m
//  ExpandTableView
//
//  Created by Qzhq on 2018/1/20.
//  Copyright © 2018年 Qzhq. All rights reserved.
//

#import "ListModel.h"

@implementation ListModel

- (NSArray *)open {
    NSArray *subModels = self.subListModel;
    self.subListModel = nil;
    self.belowCount = subModels.count;
    return subModels;
}

- (void)closeWithSubModels:(NSArray *)subModels {
    self.subListModel = [NSMutableArray arrayWithArray:subModels];
    self.belowCount = 0;
}

- (void)setBelowCount:(NSInteger)belowCount {
    self.superModel.belowCount += (belowCount - _belowCount);
    _belowCount = belowCount;
}

@end