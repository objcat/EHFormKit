# EHFormKit
静态列表构造工具 = = 白猫出品

## you say a xx without a picture

![Image text](./image-folder/2.0.png)


# 代码示例

```
  self.tableView = [[EHFormTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
  [self.view addSubview:self.tableView];
  
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
  }] eh_attributed:^(EHFormModel *model) {
      // 设置开关默认值
      model.on = YES;
  }];
```

# 更新日志
 
 #### 2018.9.13
 1.基础表单工具  
 #### 2019.11.14
 1.新增无痛全贴合自定义cell  
 2.支持自动滚动到输入行  
 3.支持无痛作用域内设置属性  
