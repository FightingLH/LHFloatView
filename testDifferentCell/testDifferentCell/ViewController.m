//
//  ViewController.m
//  testDifferentCell
//
//  Created by lh on 16/8/17.
//  Copyright © 2016年 lh. All rights reserved.
//
//关于UITableView复用的问题、在使用tableView的时候肯定会遇到复用不同类型的cell的问题

#import "ViewController.h"
#import "TestModel.h"
#import "MyCellOne.h"
#import "MyCellTwo.h"
#import "MyCellThree.h"
static NSString *const KCellone = @"KCellWeather";//
static NSString *const KCelltwo = @"KCellAccross";//
static NSString *const KCellthree = @"KCellthree";
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *detailArray;
@end

@implementation ViewController
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}
-(NSArray *)detailArray{
    if (!_detailArray) {
        _detailArray = [NSMutableArray new];
    }
    return _detailArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self prepareData];
    [self uiConfig];
    
}
-(void)prepareData{
     self.detailArray = @[KCellone,KCelltwo,KCellthree];
    for (int i = 0; i< 10; i++) {
        
        TestModel *model = [[TestModel alloc]init];
        if (i%2==0) {
            model.type = 1;
        }else{
            model.type = 2;
        }
        model.name = [NSString stringWithFormat:@"李%d",i];
        model.phone = [NSString stringWithFormat:@"123344%d",arc4random()%100];
        [self.dataArray addObject:model];
        
    }
    for (int i = 0; i<10; i++) {
        TestModel *model = [[TestModel alloc]init];
        if (i%2==0) {
            model.type = 1;
        }else{
            model.type = 2;
        }
        model.name = [NSString stringWithFormat:@"王八旦%d",i];
        model.phone = [NSString stringWithFormat:@"7895541%d",arc4random()%200];
        [self.dataArray addObject:model];
    }
    for (int i = 0; i<20; i++) {
         TestModel *model = [[TestModel alloc]init];
        model.type = 3;
        model.name = [NSString stringWithFormat:@"王八旦%d",i];
        model.phone = [NSString stringWithFormat:@"7895541%d",arc4random()%200];
        [self.dataArray addObject:model];
    }
    
}
-(void)uiConfig{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.scrollEnabled = YES;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[MyCellOne class]
           forCellReuseIdentifier:KCellone];
    [self.tableView registerClass:[MyCellTwo class]
           forCellReuseIdentifier:KCelltwo];
    [self.tableView registerClass:[MyCellThree class] forCellReuseIdentifier:KCellthree];
    [self.view addSubview:self.tableView];

}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     NSString *cellIdentify ;
    TestModel *model = _dataArray[indexPath.row];
    if (model.type == 1) {
        cellIdentify = KCellone;
    }else if(model.type == 2){
        cellIdentify = KCelltwo;
    }else if(model.type == 3){
        cellIdentify = KCellthree;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ([cellIdentify isEqualToString:@"KCellWeather"]) {
        
    }
    else if([cellIdentify isEqualToString:@"KCellAccross"]){
    
    }else if([cellIdentify isEqualToString:@"KCellthree"]){
    
    }
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentify ;
    TestModel *model = _dataArray[indexPath.row];
    if (model.type == 1) {
        cellIdentify = KCellone;
    }else if(model.type == 2){
        cellIdentify = KCelltwo;
    }else if(model.type == 3){
        cellIdentify = KCellthree;
    }
    if ([cellIdentify isEqualToString:KCellone]) {
        return 200;
    }else if([cellIdentify isEqualToString:KCelltwo]){
        return 100;
    }else if([cellIdentify isEqualToString:KCellthree]){
        return 50;
    }else{
        return 1;
    }
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
