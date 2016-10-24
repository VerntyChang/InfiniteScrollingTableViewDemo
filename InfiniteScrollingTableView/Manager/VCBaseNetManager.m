//
//  VCBaseNetManager.m
//  InfiniteScrollingTableView
//
//  Created by Vernty on 2016/10/23.
//  Copyright © 2016年 VerntyChang. All rights reserved.
//

#import "VCBaseNetManager.h"
#import "AFNetworking.h"

@implementation VCBaseNetManager

+ (AFHTTPSessionManager *)sharedAFNManager{
   
    static AFHTTPSessionManager *manager=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (manager == nil) {
            manager = [AFHTTPSessionManager manager];
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        }
    });
    return manager;
}

+ (id)GET:(NSString *)path parameters:(NSDictionary *)params WithSuccess:(VCBaseSuccessBlock)success failure:(VCBaseFailureBlock)failure{
    
    return [[self sharedAFNManager] GET:path parameters:params progress:nil success:^ void(NSURLSessionDataTask * task, id responseObject) {
        
        success(responseObject);
        
    } failure:^ void(NSURLSessionDataTask * operation, NSError * error) {
        
        failure(error);
    }];
     
}

@end