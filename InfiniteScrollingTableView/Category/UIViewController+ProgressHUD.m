//
//  UIViewController+ProgressHUD.m
//  InfiniteScrollingTableView
//
//  Created by Vernty on 2016/10/23.
//  Copyright © 2016年 VerntyChang. All rights reserved.
//

#import "UIViewController+ProgressHUD.h"

#import "MBProgressHUD.h"
#import <objc/runtime.h>

static char VCProgressHUDKey;

@implementation UIViewController (HUD)

- (MBProgressHUD *)progressHud
{
    MBProgressHUD *hud = objc_getAssociatedObject(self, &VCProgressHUDKey);
    
    if(hud){
        return hud;
    }
  
    hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
 
    objc_setAssociatedObject(self, &VCProgressHUDKey, hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return hud;
}

- (void)vc_showProgressHudWithMessage:(NSString *)message{
    
    MBProgressHUD * hud = [self progressHud];
    hud.label.text = message;
    
}

- (void)vc_hideProgressHud{
    
    MBProgressHUD * hud = [self progressHud];
    dispatch_async(dispatch_get_main_queue(), ^{
        [hud hideAnimated:YES];
    });
}

@end