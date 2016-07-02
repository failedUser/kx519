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
//动画时间
#define kAnimationDuration 0.1
//view高度
#define kViewHeight 40
//cell
#define defaultHeigeht  30
#define addHeight 10


@interface ViewController ()<UITextViewDelegate>
{
    NSArray * ScellContent;
}
@property(nonatomic,strong) UILabel * title_label;
@property(nonatomic,strong) UITableView * table_Center;
@property(nonatomic,strong) UIView * text_view;
@property(nonatomic,strong) UILabel * line;
@property(nonatomic,strong) UITextView * innput_textView;


@end

@implementation ViewController
-(void)viewWillAppear:(BOOL)animated
{
    //添加键盘的监听事件
    
    //注册通知,监听键盘弹出事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    //注册通知,监听键盘消失事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHidden) name:UIKeyboardDidHideNotification object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
 ScellContent = [NSArray arrayWithObjects:@"你你你你你你你您你你你你你你你你你你你你你你你",@"你你你你你你你您你你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你",@"你你你你你你你您你你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你",@"1你你你你你你你您你你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你",@"1你你你你你你你您你你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你",@"1你你你你你你你您你你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你你你你你你你你您你你你你你你你你你你你你你",@"1",@"1",@"妮妮", nil];
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
    YY_base_table * yy_table = [[YY_base_table alloc]init];
    yy_table.cellContent = ScellContent;
    yy_table.backgroundColor = [UIColor grayColor];
    [yy_table setFrame:CGRectMake(0, 0, 320, 524)];
    [self.view addSubview:yy_table];
  
    
    //textView
    _text_view = [[UIView alloc]initWithFrame:CGRectMake(0, 524, 320, 44)];
    _text_view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:_text_view];

   //text
    _innput_textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 5, 300, 30)];
    _innput_textView.backgroundColor = [UIColor whiteColor];
    NSDictionary *attributes = @{ NSFontAttributeName:[UIFont systemFontOfSize:30]};
    _innput_textView.attributedText = [[NSAttributedString alloc]initWithString: _innput_textView.text attributes:attributes];
    _innput_textView.delegate = self;
    [_text_view addSubview:_innput_textView];
    //label
    _line = [[UILabel alloc]initWithFrame:CGRectMake(10, 36, 300, 1)];
    _line.backgroundColor = [UIColor blackColor];
    [_text_view addSubview:_line];
    
    
    //添加手势
    UITapGestureRecognizer * Gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchesBegan)];
    [self.view addGestureRecognizer:Gesture];
    
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

//监听事件
// 键盘弹出时
-(void)keyboardDidShow:(NSNotification *)notification
{
    
    //获取键盘高度
    NSValue *keyboardObject = [[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    CGRect keyboardRect;
    
    [keyboardObject getValue:&keyboardRect];
    
    //调整放置有textView的view的位置
    
    //设置动画
    [UIView beginAnimations:nil context:nil];
    
    //定义动画时间
    [UIView setAnimationDuration:kAnimationDuration];
    
    //设置view的frame，往上平移
    [_text_view setFrame:CGRectMake(0, self.view.frame.size.height-keyboardRect.size.height-kViewHeight, 320, 44)];
    
    [UIView commitAnimations];
    
}
//键盘消失时
//键盘下降的时候TextView不能同步下降，需要修改
-(void)keyboardDidHidden
{
    //定义动画
    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:0.1];
    //设置view的frame，往下平移
//       NSLog(@"%f",_text_view.frame.origin.y);
    [_text_view setFrame:CGRectMake(0, self.view.frame.size.height-44, 320, 44)];
 
    [UIView commitAnimations];
}


//键盘退出
-(void)touchesBegan
{
    //隐藏键盘
    [_innput_textView resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}

@end
