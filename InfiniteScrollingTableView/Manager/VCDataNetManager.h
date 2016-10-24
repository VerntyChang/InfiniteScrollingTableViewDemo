//
//  VCDataNetManager.h
//  InfiniteScrollingTableView
//
//  Created by Vernty on 2016/10/23.
//  Copyright © 2016年 VerntyChang. All rights reserved.
//

#import "VCBaseNetManager.h"

typedef void(^VCDataFailureBlock)(NSError *error);
typedef void(^VCDataSuccessBlock)(NSArray *arr);

@interface VCDataNetManager : VCBaseNetManager

+(id)fetchDataWithStartIndex:(NSUInteger)startIndex WithSuccess:(VCDataSuccessBlock)successBlock failure:(VCDataFailureBlock)failureBlock;

@end
