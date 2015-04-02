//
//  AppDelegate.m
//  Nerdfeed
//
//  Created by Matthew Chupp on 4/1/15.
//  Copyright (c) 2015 MattChupp. All rights reserved.
//

#import "AppDelegate.h"
#import "MCCoursesViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds] ];
    
    MCCoursesViewController *cvc = [[MCCoursesViewController alloc]
                                    initWithStyle:UITableViewStylePlain];
    
    UINavigationController *masterNav = [[UINavigationController alloc]
                                         initWithRootViewController:cvc];
    
    self.window.rootViewController = masterNav;
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
