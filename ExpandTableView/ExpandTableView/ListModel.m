//
//  ListModel.m
//  ExpandTableView
//
//  Created by Qzhq on 2018/1/20.
//  Copyright © 2018年 Qzhq. All rights reserved.
//

#import "ListModel.h"
#import "RespModel.h"

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

- (instancetype)initWithResp:(RespModel *)resp {
    ListModel *model = [[ListModel alloc] init];
    model.showName = resp.showName;
    model.Id = resp.Id;
    model.Level = resp.Level.integerValue;
    if (resp.subListModel.count != 0) {
        NSMutableArray<ListModel *> *subModelArr = [NSMutableArray array];
        for (RespModel *subResp in resp.subListModel) {
            ListModel *subModel = [[ListModel alloc] initWithResp:subResp];
            subModel.superModel = model;
            [subModelArr addObject:subModel];
        }
        model.subListModel = subModelArr;
    }
    return model;
}

@end
