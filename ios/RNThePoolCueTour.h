//
//  RNThePoolCueTour.h
//  RNThePoolCueChamption
//
//  Created by Tsing on 6/5/23.
//  Copyright © 2023 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <React/RCTBridgeDelegate.h>
#import <UserNotifications/UNUserNotificationCenter.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNThePoolCueTour : UIResponder<RCTBridgeDelegate, UNUserNotificationCenterDelegate>

+ (instancetype)poolCueTour_shared;
- (BOOL)poolCueTour_showThisWay;
- (UIInterfaceOrientationMask)poolCueTour_getOrientation;
- (UIViewController *)poolCueTour_winTheChamptionChangeController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END
