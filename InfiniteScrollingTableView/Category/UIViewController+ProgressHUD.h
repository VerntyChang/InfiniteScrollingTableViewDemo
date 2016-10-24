//
//  UIViewController+ProgressHUD.h
//  InfiniteScrollingTableView
//
//  Created by Vernty on 2016/10/23.
//  Copyright © 2016年 VerntyChang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ProgressHUD)

- (void)vc_showProgressHudWithMessage:(NSString *)message;

- (void)vc_hideProgressHud;
    
@end