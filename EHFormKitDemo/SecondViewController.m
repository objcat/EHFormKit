//
//  SecondViewController.m
//  EHFormKitDemo
//
//  Created by 张祎 on 2018/9/13.
//  Copyright © 2018年 objcat. All rights reserved.
//

#import "SecondViewController.h"
#import "EHFormTableView.h"

@interface SecondViewController ()
@property (strong, nonatomic) EHFormTableView *tableView;
@end

@implementation SecondViewController


- (void)logWithModel:(EHFormModel *)model {
    NSLog(@"点击%@ 该行的索引为%ld, 去掉空白行该行的索引为%ld",model.name, [self.tableView.sourceArray indexOfObject:model], [self.tableView.indexArray indexOfObject:model]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"表单演示";
    
    self.tableView = [EHFormTableView tableView];
    self.tableView.frame = self.view.bounds;
    [self.view addSubview:self.tableView];
    // 开启自动滚动到输入框
    self.tableView.autoScrollToTextField = YES;
    
    __weak typeof(self) weakSelf = self;
    
    [self.tableView addWhiteRowWithcell:@"EHWhiteRowTableViewCell" BackgroundColor:self.tableView.backgroundColor rowHeight:16 separatorHeight:0 separatorColor:nil separatorOffset:0];
    
    [self.tableView addNormalRowWithName:@"个人资料" value:nil cell:@"EHTapTableViewCell" rowHeight:50 callBack:^(EHFormModel *model) {
        [weakSelf logWithModel:model];
    }];
    
    [self.tableView addNormalRowWithName:@"客服电话" value:@"1388888888" cell:@"EHPhoneNumberTableViewCell" rowHeight:50 callBack:^(EHFormModel *model) {
        [weakSelf logWithModel:model];
    }];
    
    [[self.tableView addUnableTapRowWithName:@"消息免打扰" value:nil cell:@"EHSwitchTableViewCell" rowHeight:50 callBack:^(EHFormModel *model) {
        if (model.on) {
            NSLog(@"开关on");
        } else {
            NSLog(@"开关off");
        }
    }] eh_attributed:^(EHFormModel *attributed) {
        /**
         * 注意attributed为model补充属性, 你可以在里面设置一些默认值或者给model赋一些必要的值, 这些都能在初始化cell的时候获取到
         */
        // 例如: 设置开关默认值
        attributed.on = YES;
    }];
    
    [self.tableView addWhiteRowWithcell:@"EHWhiteRowTableViewCell" BackgroundColor:self.tableView.backgroundColor rowHeight:16 separatorHeight:0 separatorColor:nil separatorOffset:0];
    
    [self.tableView addNormalRowWithName:@"个人资料" value:nil cell:@"EHTapTableViewCell" rowHeight:50 callBack:^(EHFormModel *model) {
        [weakSelf logWithModel:model];
    }];
    
    [self.tableView addNormalRowWithName:@"客服电话" value:@"1388888888" cell:@"EHPhoneNumberTableViewCell" rowHeight:50 callBack:^(EHFormModel *model) {
        [weakSelf logWithModel:model];
    }];
    
    [[self.tableView addUnableTapRowWithName:@"消息免打扰" value:nil cell:@"EHSwitchTableViewCell" rowHeight:50 callBack:^(EHFormModel *model) {
        if (model.on) {
            NSLog(@"开关on");
        } else {
            NSLog(@"开关off");
        }
    }] eh_attributed:^(EHFormModel *attributed) {
        // 设置开关默认值
        attributed.on = YES;
    }];
    
    [self.tableView addNormalRowWithName:@"请输入用户名" value:@"" cell:@"EHTextFieldTableViewCell" rowHeight:50 callBack:^(EHFormModel *model) {
        
    }];
    
    [self.tableView addWhiteRowWithcell:@"EHWhiteRowTableViewCell" BackgroundColor:self.tableView.backgroundColor rowHeight:30 separatorHeight:0 separatorColor:nil separatorOffset:0];
    
    [self.tableView addNormalRowWithName:@"退出登录" value:nil cell:@"EHButtonTableViewCell" rowHeight:50 callBack:^(EHFormModel *model) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否退出登录" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *determin = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alert addAction:determin];
        [alert addAction:cancel];
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    }];
    
    
    NSLog(@"%@", [self.tableView firstModelWithName:@"退出登录"]);
    
    for (EHFormModel *model in [self.tableView modelsWithName:@"个人资料"]) {
        // 该方法是取出所有
        NSLog(@"%@", model);
    }
}


@end
