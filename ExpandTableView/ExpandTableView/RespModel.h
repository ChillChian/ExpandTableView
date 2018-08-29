//
//  RespModel.h
//  ExpandTableView
//
//  Created by Qzhq on 2018/8/29.
//  Copyright © 2018年 Qzhq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RespModel : NSObject

@property (nonatomic, copy) NSString *showName;
@property (nonatomic, copy) NSString *Id;
@property (nonatomic, copy) NSString *Level;
@property (nonatomic, strong) NSArray<RespModel *> *subListModel;

@end
