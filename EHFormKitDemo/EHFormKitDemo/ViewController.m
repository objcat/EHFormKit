//
//  ViewController.m
//  EHFormKitDemo
//
//  Created by 张祎 on 2018/9/13.
//  Copyright © 2018年 objcat. All rights reserved.
//

#import "ViewController.h"
#import <EHFormKit/EHFormKit.h>
#import "SecondViewController.h"

@interface ViewController ()
@property (strong, nonatomic) EHFormTableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.navigationController.navigationItem.title = @"EHFromKit";
    
    self.tableView = [EHFormTableView tableView];
    self.tableView.frame = self.view.bounds;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    __weak typeof(self) weakSelf = self;
    
    [self.tableView addNormalRowWithName:@"hello world" value:nil cellClass:[EHTapTableViewCell class] rowHeight:50 callBack:^(EHFormModel *model, EHFormModelEventType eventType, NSDictionary *dictionary) {
        SecondViewController *second = [[SecondViewController alloc] init];
        [weakSelf.navigationController pushViewController:second animated:YES];
    }];
}

@end
