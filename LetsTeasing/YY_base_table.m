//
//  YY_base_table.m
//  LetsTeasing
//
//  Created by apple on 16/6/30.
//  Copyright © 2016年 yueyin. All rights reserved.
//

#import "YY_base_table.h"
#import "textCell.h"
#import "JCAlertView.h"


@implementation YY_base_table

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:UITableViewStyleGrouped];
    self.delegate =self;
    self.dataSource = self;

    return self;
}

//tableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _cellContent.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CMainCell = @"textCell";
    textCell * cell = [tableView dequeueReusableCellWithIdentifier:CMainCell];
    
    if(cell == nil)
    {
        cell = [[textCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CMainCell];
    }
    //创建完字体格式之后就告诉cell
    cell.TextLabel.text = _cellContent[indexPath.row];
    cell.TextLabel.numberOfLines = cell.TextLabel.text.length/23 +1;
    [cell.TextLabel setFrame:CGRectMake(0, 30 , 320, 20*(cell.TextLabel.text.length/23+1))];
//    NSLog(@"第%ld行的长度=%ld",(long)indexPath.row,cell.TextLabel.text.length);
//    NSLog(@"第%ld行label的高度=%lu",(long)indexPath.row,20*(cell.TextLabel.text.length%23+1));
//    NSLog(@"第%ld行的高度=%f",(long)indexPath.row,cell.frame.size.height);
    //设置cell不能被选中
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * strcon =_cellContent[indexPath.row];

        return floor(strcon.length/23+1)*20 +30;
//    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
//degelete
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"nihaoaa");
    
    
}
- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击啦");
     [self showAlertWithOneButton];
    
}

- (void)showAlertWithOneButton{
//    YY_base_table * table = [[YY_base_table alloc]init];
    NSArray * aaa = [NSArray arrayWithObjects:@"今天是个好日子",@"明天是个好日子明天是个好日子明天是个好日子明天是个好日子明天是个好日子",@"后天也是个好日子",@"大后天不是个好日子",@"好日子好日子",@"1",@"2",@"3",@"4", nil];
//    [JCAlertView showOneButtonWithTitle:@"JCAletView" Message:@"1.The simplest UIAlertView replacement. You can use it just write one line of code.\n2.Don't be afraid that the length of message is too long. There is a UITextView to show long message automatically.It supports line break.\n3.Support queue to manager alertViews .\n4.Nice blur background .\n5.Block syntax.\n6.Support iOS 6 and greater.\n7.Please add Accelerate.framework before use.\n8.If you have any question or suggestion please feel free to connect me. Thank you!" ButtonType:JCAlertViewButtonTypeDefault ButtonTitle:@"got it" Click:nil];
    [JCAlertView showOneButtonWithTitle:@"XXX评论" array:aaa ButtonType:JCAlertViewButtonTypeDefault ButtonTitle:@"发送" Click:nil];
}
@end
