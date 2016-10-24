//
//  VCTableViewController.m
//  InfiniteScrollingTableView
//
//  Created by Vernty on 2016/10/23.
//  Copyright © 2016年 VerntyChang. All rights reserved.
//

#import "VCTableViewController.h"
#import "VCTableViewCell.h"

#import "VCDataModel.h"
#import "VCDataNetManager.h"

#import "UIViewController+ProgressHUD.h"

@interface VCTableViewController ()

@property (nonatomic, strong) NSMutableArray<VCDataModel*> *dataArray;
@property (nonatomic, assign) BOOL updating;

@end

static NSString * const VCCellIdentifier = @"VCTableViewCell";
static const int VCRemainingScrollBuffer_DataNumber = 20;
static const int VCFirstLoading = 0;

@implementation VCTableViewController

#pragma mark - Accessors
-(NSMutableArray<VCDataModel*> *)dataArray
{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}

#pragma mark - View Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
 
    [self setSelfSizingTableViewProperties];
    
    [self fetchNewData:0];
  
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
    [self.dataArray removeAllObjects];
    self.dataArray = nil;
    [self.tableView reloadData];
    
    [self fetchNewData:0];
    
}

#pragma mark - Self Sizing TableViewCell by Autolayout calculation
-(void)setSelfSizingTableViewProperties{
    
    self.tableView.estimatedRowHeight = 100.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

#pragma mark - Fetch Data by AFNetworking API wrapper
-(void)fetchNewData:(NSInteger) index{
    
    if(index == VCFirstLoading){
        [self vc_showProgressHudWithMessage:@"Loading"];
    }
    
    self.updating = YES;
    
    [VCDataNetManager fetchDataWithStartIndex:index WithSuccess:^ void(NSArray *arr){
        
        [self.dataArray addObjectsFromArray:arr];
        [self.tableView reloadData];
   
        self.updating = NO;
        [self vc_hideProgressHud];
        
    }failure:^ void(NSError * error){
        
        self.updating = NO;
        [self vc_hideProgressHud];
        
        NSLog(@"%@", [error localizedDescription]);
        
    }];

}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (self.dataArray == nil)? 0 : [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:VCCellIdentifier forIndexPath:indexPath];
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell isKindOfClass:[VCTableViewCell class]])
    {         
        VCDataModel *data = self.dataArray[indexPath.row];
        VCTableViewCell *textCell = (VCTableViewCell *)cell;
       
        textCell.idLabel.text = [NSString stringWithFormat:@"ID %d",data.id];
        textCell.dateLabel.text = data.created;
        textCell.senderLabel.text = data.source.sender;
        textCell.amountLabel.text = [NSString stringWithFormat:@"%ld",(long)data.destination.amount];
        textCell.currencyLabel.text = data.destination.currency;
        textCell.recipientLabel.text = data.destination.recipient;
        textCell.noteLabel.text = data.source.note;
    }
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.dataArray.count - indexPath.row < VCRemainingScrollBuffer_DataNumber && !self.updating) {
        
       [self fetchNewData:self.dataArray.count];
        
    }
}

@end