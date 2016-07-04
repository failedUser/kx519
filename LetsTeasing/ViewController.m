//
//  ViewController.m
//  LetsTeasing
//
//  Created by apple on 16/6/29.
//  Copyright © 2016年 yueyin. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "navigation.h"
#import "YY_base_table.h"
#import "Personal_centerViewController.h"
#import "YY_TextView.h"
//动画时间
#define kAnimationDuration 0.1
//view高度
#define kViewHeight 40
//cell
#define defaultHeigeht  30
#define addHeight 10

#define HeightForTable 533

@interface ViewController ()<UITextViewDelegate,UITableViewDelegate>
{
    NSArray * ScellContent;
}
@property(nonatomic,strong) UILabel * title_label;
@property(nonatomic,strong) UITableView * table_Center;
@property(nonatomic,strong) UIView * text_view;
@property(nonatomic,strong) UILabel * line;
@property(nonatomic,strong) UITextView * innput_textView;
@property(nonatomic,strong)YY_base_table * yy_table;
@property(nonatomic,strong)YY_TextView* yy_text;
@property (weak, nonatomic)  NSLayoutConstraint *constrainH;
@property (nonatomic,weak)UIView *popView;
@end

@implementation ViewController
-(void)viewWillAppear:(BOOL)animated
{
    //添加键盘的监听事件
    
    //注册通知,监听键盘弹出事件
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
////    注册通知,监听键盘消失事件
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHidden) name:UIKeyboardDidHideNotification object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
 ScellContent = [NSArray arrayWithObjects:@"你你你你你你你您你你你你你你你你你你你你",@"你你你nininininininini你你你你您你你你你你你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你",@"你你你你你你你您你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你",@"你你你你你你你你您你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你",@"你你你你你你你您你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你",@"你你你你你你你您你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你",@"你你你你你你你您你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你",@"1",@"妮妮", nil];
    //设置导航栏的标题
    self.navigationItem.title = @"一起来吐槽";
       //设置导航栏的背景色
    [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
    //设置导航栏标题字体的颜色
   [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    //导航栏左边按钮
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(selfCenter)];
    //导航栏左边按钮颜色
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchToSm)];
    //导航栏右边边按钮颜色
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    //修改这个可以修改所有的背景色、但是不能单独在页面上改所有导航栏上的属性，只能在跟页面修改
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
   
    
    //实例化YY—table
    _yy_table = [[YY_base_table alloc]init];
    _yy_table.cellContent = ScellContent;
    _yy_table.backgroundColor = [UIColor grayColor];
    [_yy_table setFrame:CGRectMake(0, 0, 320, HeightForTable)];
    [self.view addSubview:_yy_table];
    
    UIView * baseVIew = [[UIView alloc]initWithFrame:CGRectMake(0, HeightForTable, 320, 30)];
    [self.view addSubview:baseVIew];
    
    UILabel *  line = [[UILabel alloc]initWithFrame:CGRectMake(10, 30, 300, 1)];
    line.backgroundColor = [UIColor blackColor];
    [baseVIew addSubview:line];
    self.yy_text  = [[YY_TextView alloc]initWithFrame:CGRectMake(5, 5, 320, 22)];
    self.yy_text.constrainH = self.constrainH;
    self.yy_text.popView = self.view;
//    [self.view addSubview:_yy_text];
    [baseVIew addSubview:self.yy_text];

    //添加手势
    UITapGestureRecognizer * Gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchesBegan)];
    [self.view addGestureRecognizer:Gesture];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_yy_text resignFirstResponder];
    [self.yy_text endEditing:YES];
 
}
//左边按钮的操作
-(void)selfCenter
{
    NSLog(@"push到个人中心");
    Personal_centerViewController * perV= [[Personal_centerViewController alloc]init];
    UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
    backbutton.title = @"";
    [backbutton setTintColor:[UIColor whiteColor]];
    self.navigationItem.backBarButtonItem = backbutton;
    [self.navigationController pushViewController:perV animated:YES];
}
//右边按钮的操作
-(void)searchToSm
{
    NSLog(@"查找什么东西");
    
}
- (NSInteger) heightForString:(UITextView *)textView andWidth:(float)width{
    
    CGSize sizeToFit = [textView sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    NSInteger height = sizeToFit.height;
    return height;
    
}


//键盘退出
-(void)touchesBegan
{
    //隐藏键盘
    [_yy_text resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
