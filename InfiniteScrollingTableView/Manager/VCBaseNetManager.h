//
//  VCBaseNetManager.h
//  InfiniteScrollingTableView
//
//  Created by Vernty on 2016/10/23.
//  Copyright © 2016年 VerntyChang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^VCBaseFailureBlock)(NSError * error);
typedef void(^VCBaseSuccessBlock)(id responseObject);

@interface VCBaseNetManager : NSObject

+ (id)GET:(NSString *)path parameters:(NSDictionary *)params WithSuccess:(VCBaseSuccessBlock)success failure:(VCBaseFailureBlock)failure;
  
@end
