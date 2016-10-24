//
//  VCTableViewCell.h
//  InfiniteScrollingTableView
//
//  Created by Vernty on 2016/10/23.
//  Copyright © 2016年 VerntyChang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *senderLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (weak, nonatomic) IBOutlet UILabel *currencyLabel;
@property (weak, nonatomic) IBOutlet UILabel *recipientLabel;
@property (weak, nonatomic) IBOutlet UILabel *noteLabel;

@end