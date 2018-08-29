//
//  ViewController.m
//  ExpandTableView
//
//  Created by Qzhq on 2018/1/25.
//  Copyright © 2018年 Qzhq. All rights reserved.
//

#import "ViewController.h"
#import "ListVC.h"
#import "ListModel.h"
#import "RespModel.h"
#import "MJExtension.h"

@interface ViewController ()

@property (nonatomic, strong) ListVC *listVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configListVC];
    [self loadData];
}

// 初始化子控制器，可拓展为可左右滑动切换的多控制器。
- (void)configListVC {
    ListVC *listVC = [[ListVC alloc] init];
    [self addChildViewController:listVC];
    listVC.view.frame = self.view.bounds;
    // 可以通过加载scrollView上的方式做成可左右切换的标签页类型
    [self.view addSubview:listVC.view];
    self.listVC = listVC;
}

// 进行加载数据，网络请求之类的,模拟的
- (void)loadData {
    // 随便初始化一组数据,获取到数据之后，需要字典数组转数组模型。
    
    NSArray *dataArr = @[@{
                             @"showName" : @"Beijing",
                             @"Id" : @"0",
                             @"Level" : @"0",
                             @"subListModel" : @[@{
                                                     @"showName" : @"BeiSiHuan",
                                                     @"Id" : @"0-0",
                                                     @"Level" : @"1",
                                                     @"subListModel" : @[@{
                                                                             @"showName" : @"ZhongGuanChun",
                                                                             @"Id" : @"0-0-0",
                                                                             @"Level" : @"2",
                                                                             @"subListModel" : @[@{
                                                                                                     @"showName" : @"Dasha",
                                                                                                     @"Id" : @"0-0-0-0",
                                                                                                     @"Level" : @"3",
                                                                                                     @"subListModel" : @[]
                                                                                                     },
                                                                                                 @{
                                                                                                     @"showName" : @"DaLou",
                                                                                                     @"Id" : @"0-0-0-1",
                                                                                                     @"Level" : @"3",
                                                                                                     @"subListModel" : @[]
                                                                                                     }]
                                                                             },
                                                                         @{
                                                                             @"showName" : @"Tianqiao",
                                                                             @"Id" : @"0-0-1",
                                                                             @"Level" : @"2",
                                                                             @"subListModel" : @[]
                                                                             }]
                                                     },
                                                 @{
                                                     @"showName" : @"Guomao",
                                                     @"Id" : @"0-1",
                                                     @"Level" : @"1",
                                                     @"subListModel" : @[]
                                                     }]
                             },
                         @{
                             @"showName" : @"Sichuan",
                             @"Id" : @"1",
                             @"Level" : @"0",
                             @"subListModel" : @[@{
                                                     @"showName" : @"Chengdu",
                                                     @"Id" : @"1-0",
                                                     @"Level" : @"1",
                                                     @"subListModel" : @[@{
                                                                             @"showName" : @"Wuhouqu",
                                                                             @"Id" : @"1-0-0",
                                                                             @"Level" : @"2",
                                                                             @"subListModel" : @[@{
                                                                                                     @"showName" : @"Jiuyanqiao",
                                                                                                     @"Id" : @"1-0-0-0",
                                                                                                     @"Level" : @"3",
                                                                                                     @"subListModel" : @[]
                                                                                                     },
                                                                                                 @{
                                                                                                     @"showName" : @"Xiongmaojidi",
                                                                                                     @"Id" : @"1-0-0-1",
                                                                                                     @"Level" : @"3",
                                                                                                     @"subListModel" : @[]
                                                                                                     }]
                                                                             },
                                                                         @{
                                                                             @"showName" : @"Gaoxinqu",
                                                                             @"Id" : @"1-0-1",
                                                                             @"Level" : @"2",
                                                                             @"subListModel" : @[]
                                                                             }]
                                                     },
                                                 @{
                                                     @"showName" : @"Leshan",
                                                     @"Id" : @"1-1",
                                                     @"Level" : @"1",
                                                     @"subListModel" : @[]
                                                     }]
                             },
                         @{
                             @"showName" : @"Guangdong",
                             @"Id" : @"2",
                             @"Level" : @"0",
                             @"subListModel" : @[@{
                                                     @"showName" : @"Guangzhou",
                                                     @"Id" : @"2-0",
                                                     @"Level" : @"1",
                                                     @"subListModel" : @[@{
                                                                             @"showName" : @"Tianhequ",
                                                                             @"Id" : @"2-0-0",
                                                                             @"Level" : @"2",
                                                                             @"subListModel" : @[@{
                                                                                                     @"showName" : @"Chebei",
                                                                                                     @"Id" : @"2-0-0-0",
                                                                                                     @"Level" : @"3",
                                                                                                     @"subListModel" : @[]
                                                                                                     },
                                                                                                 @{
                                                                                                     @"showName" : @"Xueyuan",
                                                                                                     @"Id" : @"2-0-0-1",
                                                                                                     @"Level" : @"3",
                                                                                                     @"subListModel" : @[]
                                                                                                     }]
                                                                             },
                                                                         @{
                                                                             @"showName" : @"Huadu",
                                                                             @"Id" : @"2-0-1",
                                                                             @"Level" : @"2",
                                                                             @"subListModel" : @[]
                                                                             }]
                                                     },
                                                 @{
                                                     @"showName" : @"Huizhou",
                                                     @"Id" : @"2-1",
                                                     @"Level" : @"1",
                                                     @"subListModel" : @[]
                                                     }]
                             },
                         @{
                             @"showName" : @"Shanxi",
                             @"Id" : @"3",
                             @"Level" : @"0",
                             @"subListModel" : @[@{
                                                     @"showName" : @"Xi'an",
                                                     @"Id" : @"3-0",
                                                     @"Level" : @"1",
                                                     @"subListModel" : @[@{
                                                                             @"showName" : @"Weiyangqu",
                                                                             @"Id" : @"3-0-0",
                                                                             @"Level" : @"2",
                                                                             @"subListModel" : @[@{
                                                                                                     @"showName" : @"Daminggong",
                                                                                                     @"Id" : @"3-0-0-0",
                                                                                                     @"Level" : @"3",
                                                                                                     @"subListModel" : @[]
                                                                                                     },
                                                                                                 @{
                                                                                                     @"showName" : @"Weiyanggong",
                                                                                                     @"Id" : @"3-0-0-1",
                                                                                                     @"Level" : @"3",
                                                                                                     @"subListModel" : @[]
                                                                                                     }]
                                                                             },
                                                                         @{
                                                                             @"showName" : @"Chang'an",
                                                                             @"Id" : @"3-0-1",
                                                                             @"Level" : @"2",
                                                                             @"subListModel" : @[]
                                                                             }]
                                                     },
                                                 @{
                                                     @"showName" : @"Baoji",
                                                     @"Id" : @"3-1",
                                                     @"Level" : @"1",
                                                     @"subListModel" : @[]
                                                     }]
                             },
                         @{
                             @"showName" : @"Shandong",
                             @"Id" : @"4",
                             @"Level" : @"0",
                             @"subListModel" : @[@{
                                                     @"showName" : @"Jinan",
                                                     @"Id" : @"4-0",
                                                     @"Level" : @"1",
                                                     @"subListModel" : @[]
                                                     },
                                                 @{
                                                     @"showName" : @"Weihai",
                                                     @"Id" : @"4-1",
                                                     @"Level" : @"1",
                                                     @"subListModel" : @[]
                                                     }]
                             },
                         @{
                             @"showName" : @"Anhui",
                             @"Id" : @"5",
                             @"Level" : @"0",
                             @"subListModel" : @[@{
                                                     @"showName" : @"Hefei",
                                                     @"Id" : @"5-0",
                                                     @"Level" : @"1",
                                                     @"subListModel" : @[]
                                                     },
                                                 @{
                                                     @"showName" : @"Liu'an",
                                                     @"Id" : @"5-1",
                                                     @"Level" : @"1",
                                                     @"subListModel" : @[]
                                                     }]
                             },
                         @{
                             @"showName" : @"Suzhou",
                             @"Id" : @"6",
                             @"Level" : @"0",
                             @"subListModel" : @[@{
                                                     @"showName" : @"Wuxi",
                                                     @"Id" : @"6-0",
                                                     @"Level" : @"1",
                                                     @"subListModel" : @[]
                                                     },
                                                 @{
                                                     @"showName" : @"Suzhou",
                                                     @"Id" : @"6-1",
                                                     @"Level" : @"1",
                                                     @"subListModel" : @[@{
                                                                             @"showName" : @"Gusu",
                                                                             @"Id" : @"6-1-0",
                                                                             @"Level" : @"2",
                                                                             @"subListModel" : @[]
                                                                             },
                                                                         @{
                                                                             @"showName" : @"Chengnan",
                                                                             @"Id" : @"6-1-1",
                                                                             @"Level" : @"2",
                                                                             @"subListModel" : @[]
                                                                             }]
                                                     }]
                             }];
    
    NSArray<RespModel *> *respModelArr = [RespModel mj_objectArrayWithKeyValuesArray:dataArr];
    
    // 这里需要转换成自己需要的数组模型，可以和上一步合到一起。
    NSMutableArray *modelArr = [NSMutableArray array];
    for (RespModel *resp in respModelArr) {
        ListModel *model = [[ListModel alloc] initWithResp:resp];
        [modelArr addObject:model];
    }
    
    self.listVC.modelArr = modelArr;
    [self.listVC.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

