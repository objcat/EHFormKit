# EHFormKit
一个快速构造表单的工具 继承UITableView

## you say a xx without a picture


![Image text](https://raw.githubusercontent.com/objcat/EHFormKit/master/image-folder/img.png)

## 代码示例

    self.title = @"表单演示";
    
    self.tableView = [[EHFormTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    
    UIColor *separatorColor = RGBA(200, 199, 204, 1);
    
    __weak typeof(self) weakSelf = self;
    
    [self.tableView addWhiteRowWithBackgroundColor:self.tableView.backgroundColor rowHeight:10 separatorHeight:0 separatorColor:separatorColor separatorOffset:0];
    
    [self.tableView addRowWithName:@"个人资料" value:nil rowHeight:50 type:EHFormTypeTap canTap:YES canSelected:YES separatorHeight:0.5 separatorColor:separatorColor separatorOffset:30 touchUpInside:^(EHFormModel *model) {
        NSLog(@"点击个人资料 %ld 行", [weakSelf.tableView.arr indexOfObject:model]);
    }];
    
    [self.tableView addRowWithName:@"客服电话" value:@"1388888888" rowHeight:50 type:EHFormTypeTelephone canTap:YES canSelected:YES separatorHeight:0.5 separatorColor:separatorColor separatorOffset:30 touchUpInside:^(EHFormModel *model) {
        NSLog(@"点击客服电话");
    }];
    
    EHFormModel *switchModel = [self.tableView addRowWithName:@"消息免打扰" value:@"1388888888" rowHeight:50 type:EHFormTypeSwitch canTap:NO canSelected:NO separatorHeight:0.5 separatorColor:separatorColor separatorOffset:30 touchUpInside:^(EHFormModel *model) {
        if (model.on) {
            NSLog(@"开关on");
        } else {
            NSLog(@"开关off");
        }
    }];
    
    switchModel.on = YES;
    
    [self.tableView addRowWithName:@"姓名" value:@"张三" rowHeight:50 type:EHFormTypeLabel canTap:NO canSelected:NO separatorHeight:0 separatorColor:separatorColor separatorOffset:30 touchUpInside:^(EHFormModel *model) {
        NSLog(@"点击个人资料");
    }];
 
