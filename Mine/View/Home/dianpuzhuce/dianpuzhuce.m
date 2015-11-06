//
//  dianpuzhuce.m
//  Mine
//
//  Created by 张德强 on 15/11/5.
//  Copyright © 2015年 张德强. All rights reserved.
//

#import "dianpuzhuce.h"

@interface dianpuzhuce ()

@end

@implementation dianpuzhuce

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    _pickArr=[NSMutableArray array];
    
    self.navigationItem.title=@"开店申请";
    
    self.navigationItem.leftBarButtonItem=[self navigationItemTitle:@"返回" target:self action:@selector(leftBtnItemClick)];
    
    [self.view addSubview:self.shenBtn];
    
    [self.view addSubview:self.jiaoBtn];
    
    [self.view addSubview:self.scrollView];
    
    [self addObservesOnScrollview];
    
}

-(UIButton *)shenBtn{
    
    if (!_shenBtn) {
        
        _shenBtn=[self createUIButtonWithFrame:CGRectMake(0, 0, maiSrc.width/2, 50) title:@"店铺申请" backgroundColor:[UIColor redColor] titleColor:[UIColor blackColor] target:self selected:@selector(shenBtnClick:)];
    }
    return _shenBtn;
}

-(UIButton *)jiaoBtn{
    
    if (!_jiaoBtn) {
        
          _jiaoBtn=[self createUIButtonWithFrame:CGRectMake(maiSrc.width/2, 0, maiSrc.width/2, 50) title:@"缴会员费" backgroundColor:[UIColor whiteColor] titleColor:[UIColor blackColor] target:self selected:@selector(jiaoBtnClick:)];
    }
    
    return _jiaoBtn;
}

-(UIScrollView *)scrollView{
    
    if (!_scrollView) {
       
        _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 50, maiSrc.width, maiSrc.height-64-49-50)];
        
        _scrollView.contentSize=CGSizeMake(0, maiSrc.height*2);
        
        _scrollView.backgroundColor=[UIColor yellowColor];
        
        _scrollView.showsVerticalScrollIndicator=NO;
        
        _scrollView.pagingEnabled=NO;
        
        [_scrollView addSubview:self.commitBtn];
    }
    
    return _scrollView;
}

-(UIButton *)commitBtn{
    
    if (!_commitBtn) {
        
        _commitBtn=[self createUIButtonWithFrame:CGRectMake(10, 50+10+40*12+70, maiSrc.width-20, 50) title:@"提交申请" backgroundColor:[UIColor blueColor] titleColor:[UIColor whiteColor] target:self selected:@selector(commitBtnClick:)];
        
        _commitBtn.layer.masksToBounds=YES;
        
        _commitBtn.layer.cornerRadius=5;
        
        _commitBtn.titleLabel.font=[UIFont systemFontOfSize:32];
    }
    return _commitBtn;
}

-(UIToolbar *)toolBar{
    
    if (!_toolBar) {
        
        _toolBar=[[UIToolbar alloc]init];
        
        UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(leftItemBtnClick)];
        
        UIBarButtonItem *itemSpace=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        
        UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(rightItemBtnClick)];
        
        _toolBar.items=@[leftItem,itemSpace,rightItem];
        
    }
    
    return _toolBar;
}

-(void)addObservesOnScrollview{
    
    NSArray *nameArr=@[@"姓名:",@"性别:",@"所在城市:",@"详细地址:",@"证件类型:",@"证件号:",@"联系电话:",@"邮箱:",@"店铺名称:",@"店铺类型:",@"创业理想:",@"证件照片:"];
    
    for (NSInteger i=0; i<12; i++) {
        
        CGRect frame=CGRectMake(5, 10+40*i, 100*SIZE, 30);
        
        CGRect tframe=CGRectMake(5+100*SIZE+10, 10+40*i, maiSrc.width-5-100*SIZE-10-20, 30);
        
        [self.scrollView addSubview:[self createUILableWithFrame:frame text:nameArr[i]]];
        
        UITextField *tf=[self createTextFieldWithFrame:tframe placeholder:nameArr[i] tag:i+1];
        
        tf.delegate=self;
        
        [self.scrollView addSubview:tf];
    }
    
    //移除部分tf
    NSArray *arr2=@[@"2",@"5",@"10"];
    
    for (NSInteger i=0; i<3; i++) {
        
        UITextField *tf=(UITextField *)[self.view viewWithTag:[arr2[i] integerValue]];
        
        _pickView=[[UIPickerView alloc]initWithFrame:CGRectMake(0, maiSrc.height-149-64, maiSrc.width, 100)];
        
        _pickView.delegate=self;
        
        _pickView.dataSource=self;
        
        _pickView.backgroundColor=[UIColor lightGrayColor];
        
        tf.inputView=_pickView;
        
        tf.inputAccessoryView=self.toolBar;
    }
}


#pragma mark 响应事件

//申请开店
-(void)shenBtnClick:(UIButton *)sender{
    
    self.jiaoBtn.backgroundColor=[UIColor whiteColor];
    
    self.shenBtn.backgroundColor=[UIColor redColor];
    
    NSLog(@"申请开店");
}

//会员缴费
-(void)jiaoBtnClick:(UIButton *)sender{
    
    self.shenBtn.backgroundColor=[UIColor whiteColor];
    
    self.jiaoBtn.backgroundColor=[UIColor redColor];
    
    NSLog(@"会员缴费");
}

//提交按钮
-(void)commitBtnClick:(UIButton *)sender{
    
    NSLog(@"提交");
}

//返回按钮
-(void)leftBtnItemClick{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    NSLog(@"asd");
}

//取消
-(void)leftItemBtnClick{
    
    NSLog(@"1");
    
    NSInteger tag=[[_pickArr lastObject] integerValue];
    
    UITextField *tf=(UITextField *)[self.view viewWithTag:tag];
    
    [tf resignFirstResponder];
    
    UITextField *tf2=(UITextField *)[self.view viewWithTag:tag+1];
    
    [tf2 becomeFirstResponder];
}

//确认
-(void)rightItemBtnClick{
    
    NSLog(@"2");
    
    NSInteger tag=[[_pickArr lastObject] integerValue];
    
    UITextField *tf=(UITextField *)[self.view viewWithTag:tag];
    
    [tf resignFirstResponder];
    
    UITextField *tf2=(UITextField *)[self.view viewWithTag:tag+1];
    
    [tf2 becomeFirstResponder];
}


#pragma mark ===========   pickViewDelegate    ==========

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return _pickArr.count-1;
}


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return _pickArr[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    NSInteger tag=[[_pickArr lastObject] integerValue];
    
    UITextField *tf=(UITextField *)[self.view viewWithTag:tag];
    
    [tf resignFirstResponder];
    
    UITextField *tf2=(UITextField *)[self.view viewWithTag:tag+1];
    
    [tf2 becomeFirstResponder];
}

#pragma mark - 光标下移，激活键盘，释放键盘
//光标下移
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField.tag==12) {
        
        [textField resignFirstResponder];//释放键盘
        
    }else{
        
        UITextField *tf=(UITextField*)[self.view viewWithTag:textField.tag+1];
        
        [tf becomeFirstResponder];//激活键盘
    }
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    switch (textField.tag) {
        case 2:
            _pickArr.array=@[@"男",@"女",@"2"];
            break;
            case 5:
            _pickArr.array=@[@"类型1",@"类型2",@"类型3",@"5"];
            break;
        default:
            _pickArr.array=@[@"类型A",@"类型B",@"类型C",@"10"];
            break;
    }

    [_pickView reloadInputViews];
}


#pragma mark =============================================================


-(UILabel *)createUILableWithFrame:(CGRect)frame text:(NSString *)text {
    
    UILabel *lable=[UILabel new];
    
    lable.frame=frame;
    
    lable.text=text;
    
    lable.textAlignment=NSTextAlignmentRight;
    
    lable.font=[UIFont systemFontOfSize:18];
    
    return lable;
}

-(UITextField *)createTextFieldWithFrame:(CGRect )frame placeholder:(NSString *)placeholder tag:(NSInteger)tag{
    
    UITextField *tf=[[UITextField alloc]initWithFrame:frame];
    
    tf.placeholder=placeholder;
    
    tf.tag=tag;
    
    tf.borderStyle=UITextBorderStyleRoundedRect;
    
    tf.adjustsFontSizeToFitWidth=YES;
    
    tf.textAlignment=NSTextAlignmentLeft;
    
    return tf;
}

-(UIButton *)createUIButtonWithFrame:(CGRect)frame title:(NSString *)title backgroundColor:(UIColor *)bColor titleColor:(UIColor *)tColor target:(id)target selected:(SEL)acction{
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame=frame;
    
    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn setTitleColor:tColor forState:UIControlStateNormal];
    
    [btn setBackgroundColor:bColor];
    
    [btn addTarget:target action:acction forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

-(UIBarButtonItem *)navigationItemTitle:(NSString *)title target:(id)target action:(SEL)action{
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame=CGRectMake(10, 10, 40, 40);
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
    
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithCustomView:btn];
    
    return item;
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
