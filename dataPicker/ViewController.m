//
//  ViewController.m
//  dataPicker
//
//  Created by qiu on 16/1/22.
//  Copyright © 2016年 qiu. All rights reserved.
//

#import "ViewController.h"
#import "UUDatePicker.h"


#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UUDatePickerDelegate>

@property (nonatomic, strong) UUDatePicker *datePicker;

@property (nonatomic,strong) UILabel *label;

@property (nonatomic, strong) NSString *dataStr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 44)];
    self.label.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.label];
    
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(100, 160, 200, 44)];
    [btn1 setTitle:@"PUSH" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(PUSH) forControlEvents:UIControlEventTouchUpInside];
    btn1.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 220, 200, 44)];
    [btn2 setTitle:@"POP" forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor lightGrayColor];
    [btn2 addTarget:self action:@selector(POP) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}


-(void)setData{
    NSDate *now = [NSDate date];
    
    //delegate
    self.datePicker= [[UUDatePicker alloc]initWithframe:CGRectMake(0, HEIGHT-200, 320, 200) Delegate:self PickerStyle:UUDateStyle_YearMonthDayHourMinute];
    self.datePicker.ScrollToDate = now;
//    self.datePicker.maxLimitDate = now;
//    self.datePicker.minLimitDate = [now dateByAddingTimeInterval:-111111111];
    [self.view addSubview:self.datePicker];
}
-(void)PUSH{
    [self setData];
}
-(void)POP{
    if ([self.dataStr isEqualToString:@""] || self.dataStr == nil) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        NSString *dateString = [dateFormatter stringFromDate:self.datePicker.ScrollToDate];
        
        self.dataStr = dateString;
        
    
    }
    self.label.text = self.dataStr;
    
}

#pragma mark - UUDatePicker's delegate
- (void)uuDatePicker:(UUDatePicker *)datePicker
                year:(NSString *)year
               month:(NSString *)month
                 day:(NSString *)day
                hour:(NSString *)hour
              minute:(NSString *)minute
             weekDay:(NSString *)weekDay
{
     self.dataStr= [NSString stringWithFormat:@"%@-%@-%@ %@:%@",year,month,day,hour,minute];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
