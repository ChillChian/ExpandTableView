//
//  ViewController.m
//  ExpandTableView
//
//  Created by Qzhq on 2018/1/25.
//  Copyright © 2018年 Qzhq. All rights reserved.
//

#import "ViewController.h"
#import "ListVC.h"

@interface ViewController ()

@property (nonatomic, strong) ListVC *listVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configListVC];
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
