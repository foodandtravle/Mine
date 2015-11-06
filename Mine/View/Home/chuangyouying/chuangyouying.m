//
//  chuangyouying.m
//  Mine
//
//  Created by 张德强 on 15/11/5.
//  Copyright © 2015年 张德强. All rights reserved.
//

#import "chuangyouying.h"

@interface chuangyouying ()<UIPickerViewDelegate>

@end

@implementation chuangyouying

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor yellowColor];
    
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(0, maiSrc.height-149-64-10, maiSrc.width, 100)];
    
    lable.backgroundColor=[UIColor redColor];
    
    [self.view addSubview:lable];
    
    
    
    
    UITextField *tf=[self createTextFieldWithFrame:CGRectMake(30, 100, 300, 30) placeholder:nil target:nil action:nil tag:0];
    
   
    
    tf.placeholder=@"asdasdadasd";
    
    
    [self.view addSubview:tf];
    
    UIToolbar *toolBar=[[UIToolbar alloc]init];
    
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(qwe:)];
    
    UIBarButtonItem *item2=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    
    UIBarButtonItem *item3=[[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    toolBar.items=@[item,item2,item3];
    
    toolBar.backgroundColor=[UIColor blackColor];
    
    tf.inputAccessoryView=toolBar;
    
    UIPickerView *pick=[[UIPickerView alloc]initWithFrame:CGRectMake(0, maiSrc.height-64-149, maiSrc.width, 100)];
    
    pick.backgroundColor=[UIColor lightGrayColor];
    
    pick.delegate=self;
    
    tf.inputView=pick;
    
}




-(void)asd:(UITextField *)tf{
    
    [tf becomeFirstResponder];
    
    NSLog(@"asdasd");
}

-(void)qwe:(UIBarButtonItem *)item{
    NSLog(@"qwe");
}

-(UITextField *)createTextFieldWithFrame:(CGRect )frame placeholder:(NSString *)placeholder target:(id)target action:(SEL)action tag:(NSInteger)tag{
    
    UITextField *tf=[[UITextField alloc]initWithFrame:frame];
    
    tf.placeholder=placeholder;
    
    tf.borderStyle=UITextBorderStyleRoundedRect;
    
    tf.adjustsFontSizeToFitWidth=YES;
    
    tf.textAlignment=NSTextAlignmentCenter;
    
    tf.tag=tag;
    
    [tf addTarget:target action:action forControlEvents:UIControlEventAllTouchEvents];
    
    return tf;
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
