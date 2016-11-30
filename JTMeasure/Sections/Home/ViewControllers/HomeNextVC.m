//
//  HomeNextVC.m
//  JTMeasure
//
//  Created by 魏初芳 on 16/7/11.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "HomeNextVC.h"
#import <CTPersistance.h>
#import "Person.h"
#import "PersonInfoTable.h"
#import "UserInfoReformer.h"

#import <objc/runtime.h>

#import "UIView+AddRecorder.h"
#import "UIScrollView+EmptyDataSet.h"

@interface HomeNextVC ()<UITableViewDelegate, UITableViewDataSource, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *datas;
@end

@implementation HomeNextVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.datas = [@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"] mutableCopy];
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (IBAction)buttonCliecked:(UIButton *)sender {
    self.datas = [[NSArray array]mutableCopy];
    [self.tableView reloadData];
}

#pragma mark *** Delegate ***
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

static NSString *cellID = @"Cell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.datas[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    NSAttributedString *arrString = [[NSAttributedString alloc] initWithString:@"没有数据"];
    return arrString;
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    UIImage *image = [UIImage imageNamed:@"empty.png"];
    return image;
}

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    NSAttributedString *arrString = [[NSAttributedString alloc] initWithString:@"点击重新加载"];
    return arrString;
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button {
    NSLog(@"按钮点击...");
    self.datas = [@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"] mutableCopy];
    [self.tableView reloadData];
}

- (CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.toValue = [NSNumber numberWithFloat:0.5];
    animation.duration = 2.0;
    animation.repeatCount = MAXFLOAT;
    return animation;
}

//- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView {
//    return [UIColor orangeRed];
//}

//- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView {
//    UIView *view = [[UIView alloc] initWithFrame:scrollView.bounds];
//    view.backgroundColor = [UIColor purpleColor];
//    return view;
//}

@end
