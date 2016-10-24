//
//  VCDataNetManager.m
//  InfiniteScrollingTableView
//
//  Created by Vernty on 2016/10/23.
//  Copyright © 2016年 VerntyChang. All rights reserved.
//

#import "VCDataNetManager.h"
#import "VCDataModel.h"

static NSString * const VCDataURLString = @"https://hook.io/syshen/infinite-list";
static const int VCFetchDataNumber = 50;

@implementation VCDataNetManager
 
+(id)fetchDataWithStartIndex:(NSUInteger)startIndex WithSuccess:(VCDataSuccessBlock)successBlock failure:(VCDataFailureBlock)failureBlock{
    
    NSDictionary *parameters = @{
                                 @"startIndex" : @(startIndex),
                                 @"num" : @(VCFetchDataNumber)
                                };
    
    return [self GET:VCDataURLString parameters:parameters WithSuccess:^ void(id responseObject) {
        
        //parse JSON
        id dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        
        successBlock([VCDataModel arrayOfModelsFromDictionaries:dic error:nil]);
   
        
    } failure:^ void(NSError * error) {
        
        failureBlock(error);
         
    }];
    
}
@end
