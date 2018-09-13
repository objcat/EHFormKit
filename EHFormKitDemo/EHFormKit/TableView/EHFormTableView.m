//
//  EHFormTableView.m
//  DABAN
//
//  Created by 张祎 on 2018/9/12.
//  Copyright © 2018年 objcat. All rights reserved.
//

#import "EHFormTableView.h"
#import "EHFormTableViewCell.h"
#import "EHWhiteRowTableViewCell.h"
#import "EHButtonTableViewCell.h"
#import "EHSwitchTableViewCell.h"

@interface EHFormTableView () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSMutableArray *arr;
@end

@implementation EHFormTableView

- (EHFormModel *)addRowWithName:(NSString *)name
                 value:(NSString *)value
             rowHeight:(CGFloat)rowHeight
                  type:(EHFormType)type
                canTap:(BOOL)canTap
           canSelected:(BOOL)canSelected
       separatorHeight:(CGFloat)separatorHeight
        separatorColor:(UIColor *)separatorColor
       separatorOffset:(CGFloat)separatorOffset
         touchUpInside:(void (^) (EHFormModel *model))touchUpInside {
    
    EHFormModel *model = [[EHFormModel alloc] init];
    model.name = name ? : @"未命名";
    model.value = value ? : @"";
    model.type = type;
    model.canSelected = canSelected;
    model.canTap = canTap;
    model.touchUpInside = touchUpInside;
    model.rowHeight = rowHeight;
    model.separatorHeight = separatorHeight;
    model.separatorColor = separatorColor;
    model.separatorOffset = separatorOffset;
    [self.arr addObject:model];
    return model;
}

- (void)addWhiteRowWithBackgroundColor:(UIColor *)backgroundColor
                             rowHeight:(CGFloat)rowHeight
                       separatorHeight:(CGFloat)separatorHeight
                        separatorColor:(UIColor *)separatorColor
                       separatorOffset:(CGFloat)separatorOffset {
    EHFormModel *model = [[EHFormModel alloc] init];
    model.rowHeight = rowHeight;
    model.type = EHFormTypeWhiteRow;
    model.separatorHeight = separatorHeight;
    model.separatorColor = separatorColor;
    model.separatorOffset = separatorOffset;
    model.backgroundColor = backgroundColor;
    [self.arr addObject:model];
}

- (NSMutableArray *)arr {
    if (!_arr) {
        _arr = [NSMutableArray array];
    }
    return _arr;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self registerNib:[UINib nibWithNibName:@"EHTapTableViewCell" bundle:nil] forCellReuseIdentifier:@"EHTapTableViewCell"];
        [self registerNib:[UINib nibWithNibName:@"EHSwitchTableViewCell" bundle:nil] forCellReuseIdentifier:@"EHSwitchTableViewCell"];
        [self registerNib:[UINib nibWithNibName:@"EHPhoneNumberTableViewCell" bundle:nil] forCellReuseIdentifier:@"EHPhoneNumberTableViewCell"];
        [self registerNib:[UINib nibWithNibName:@"EHLabelTableViewCell" bundle:nil] forCellReuseIdentifier:@"EHLabelTableViewCell"];
        
        [self registerClass:[EHWhiteRowTableViewCell class] forCellReuseIdentifier:@"EHWhiteRowTableViewCell"];
        [self registerClass:[EHButtonTableViewCell class] forCellReuseIdentifier:@"EHButtonTableViewCell"];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EHFormModel *model = self.arr[indexPath.row];
    EHFormTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:model.reuseIdentifier];
    cell.model = model;
    cell.touchUpInside = model.touchUpInside;
    if (model.canSelected) cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    else cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    EHFormModel *model = self.arr[indexPath.row];
    return model.rowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    EHFormModel *model = self.arr[indexPath.row];
    if (model.touchUpInside && model.canTap) {
        model.touchUpInside(model);
    }
}

- (void)dealloc {
    NSLog(@"表单释放");
}


@end
