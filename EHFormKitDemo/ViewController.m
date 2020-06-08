//
//  ViewController.m
//  EHFormKitDemo
//
//  Created by 张祎 on 2018/9/13.
//  Copyright © 2018年 objcat. All rights reserved.
//

#import "ViewController.h"
#import "EHFormTableView.h"
#import "SecondViewController.h"

@interface ViewController ()
@property (strong, nonatomic) EHFormTableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView = [EHFormTableView tableView];
    self.tableView.frame = self.view.bounds;
    NSLog(@"%@", NSStringFromCGRect(self.view.bounds));
    [self.view addSubview:self.tableView];
    
    __weak typeof(self) weakSelf = self;
    
    [self.tableView addNormalRowWithName:@"清爽开始 - 静态列表" value:nil cell:@"EHTapTableViewCell" rowHeight:50 callBack:^(EHFormModel *model) {
        SecondViewController *second = [[SecondViewController alloc] init];
        [weakSelf.navigationController pushViewController:second animated:YES];
    }];
    
    [self.tableView addNormalRowWithName:@"高级用法 - 表单(敬请期待)" value:nil cell:@"EHTapTableViewCell" rowHeight:50 callBack:^(EHFormModel *model) {
    }];
}

@end
