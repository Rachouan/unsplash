//
//  AppDelegate.h
//  unsplash
//
//  Created by Rachouan Rejeb on 22/01/16.
//  Copyright © 2016 Rachouan Rejeb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) MainViewController *mainVc;
@property (nonatomic, strong) UINavigationController *navController;


@end

