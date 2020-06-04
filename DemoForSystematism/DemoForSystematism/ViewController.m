//
//  ViewController.m
//  DemoForSystematism
//
//  Created by KFAaron on 2020/6/3.
//  Copyright © 2020 KFAaron. All rights reserved.
//

#import "ViewController.h"

static NSString * cellIdentifier = @"cellIdentifier";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, copy) NSDictionary *sourceDic;
@property (nonatomic, copy) NSArray *titleArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - UITableViewDelegate And UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.titleArr.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.titleArr[section] substringFromIndex:3];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *title = self.titleArr[section];
    NSArray *rows = self.sourceDic[title];
    return rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSString *title = self.titleArr[indexPath.section];
    NSArray *rows = self.sourceDic[title];
    cell.textLabel.text = rows[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - Propreties

- (NSDictionary *)sourceDic {
    if (!_sourceDic) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"mainResource" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSError *error;
        NSDictionary *sourceDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        _sourceDic = sourceDic;
    }
    return _sourceDic;
}

- (NSArray *)titleArr {
    if (!_titleArr) {
        NSArray *titleArr = [self.sourceDic.allKeys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [(NSString *)obj1 compare:(NSString *)obj2];
        }];
        _titleArr = titleArr;
    }
    return _titleArr;
}

@end
