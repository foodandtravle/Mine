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
    
    [self.view addSubview:self.tableView];
    
    _dataArr=self.dataArr;
    
    
    
    
}

-(UITableView *)tableView{
    
    if (!_tableView) {
        
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, maiSrc.width, maiSrc.height-64-49)];
        
        _tableView.delegate=self;
        
        _tableView.dataSource=self;
        
        UIView *ive=[[UIView alloc]initWithFrame:CGRectMake(0, 0, maiSrc.width, 44)];
        
        ive.backgroundColor=[UIColor redColor];
        
        _tableView.tableFooterView=ive;
        
        _tableView.separatorInset=UIEdgeInsetsMake(0, 0, 0, maiSrc.width-15);
        
//        [_tableView registerNib:[UINib nibWithNibName:@"" bundle:nil] forCellReuseIdentifier:@"identifier"];
//
//        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"identifier"];
    }
    
    return _tableView;
}

-(NSMutableArray *)dataArr{
    
    if (!_dataArr) {
     
        _dataArr=[[NSMutableArray alloc]init];
        
        [_dataArr addObject:@[@"测试A",@"测试B",@"测试C",@"测试D"]];
        
        NSMutableArray *arr=[NSMutableArray new];
        
        for (NSInteger i=0; i<30; i++) {
            
            [arr addObject:[NSString stringWithFormat:@"测试%ld",i]];
        }
        
        [_dataArr addObject:arr];
        
    }
    return _dataArr;
}


#pragma mark =====     TableViewDelegate     ========
-(NSInteger )numberOfSectionsInTableView:(UITableView *)tableView{
    
    return _dataArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_dataArr[section] count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    if (section==0) {
        
        return @"平台公告";
    }
    return @"创业故事";
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *str=@"identifier";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    
    if (!cell) {
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
    }
    
    cell.textLabel.text=_dataArr[indexPath.section][indexPath.row];
    
    return cell;
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
