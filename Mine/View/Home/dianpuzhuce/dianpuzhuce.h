//
//  dianpuzhuce.h
//  Mine
//
//  Created by 张德强 on 15/11/5.
//  Copyright © 2015年 张德强. All rights reserved.
//

#import "BaseViewController.h"

@interface dianpuzhuce : BaseViewController<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>

@property(nonatomic,strong)UIButton *shenBtn;//开店申请

@property(nonatomic,strong)UIButton *jiaoBtn;//会员缴费

@property(nonatomic,strong)UIScrollView *scrollView;//主页面的滚动视图

@property(nonatomic,strong)UIButton *commitBtn;//提交按钮


@property(nonatomic,strong)UIPickerView *pickView;

//pickView数据源 里边第一个元素用于迫使用户对pickView做出选择   最后一个元素其实是用于记录tf的tag
@property(nonatomic,strong)NSMutableArray *pickArr;

@property(nonatomic,strong)UIToolbar *toolBar;

@property(nonatomic,strong)NSString *pickStr;



@end
