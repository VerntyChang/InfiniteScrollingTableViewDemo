//
//  VCDataModel.h
//  InfiniteScrollingTableView
//
//  Created by Vernty on 2016/10/23.
//  Copyright © 2016年 VerntyChang. All rights reserved.
//

#import "JSONModel.h"

@interface destination : JSONModel

@property (nonatomic,copy)   NSString *recipient;
@property (nonatomic,assign) double  amount;
@property (nonatomic,copy)   NSString *currency;

@end


@interface source : JSONModel

@property (nonatomic,copy) NSString *note;
@property (nonatomic,copy) NSString *sender;

@end


@interface VCDataModel : JSONModel

@property (nonatomic,assign) int id;
@property (nonatomic,copy)   NSString *created;
@property (strong,nonatomic) source *source;
@property (strong,nonatomic) destination *destination;

@end