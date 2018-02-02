//
//  ListModel.h
//  ExpandTableView
//
//  Created by Qzhq on 2018/1/20.
//  Copyright © 2018年 Qzhq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListModel : NSObject

@property (nonatomic,copy)NSString *showName;
@property (nonatomic,copy)NSString *Id;
@property (nonatomic,assign)NSInteger Level; // 记录层级，可以按照层级设置样式等
@property (nonatomic,assign)NSInteger belowCount; // 记录被展开的元素个数
@property (nonatomic,weak)ListModel *superModel; // 记录之前是哪个元素的孩子节点，要用weak避免循环引用
@property (nonatomic,strong)NSArray<ListModel *> *subListModel;


//- (instancetype)initWithResp:(NSArray *)resp;
// 对模型进行展开，为了数据结构和TableView的cell一致
- (NSArray *)open;
// 把模型进行关闭
- (void)closeWithSubModels:(NSArray *)subModels;

@end
