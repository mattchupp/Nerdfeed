//
//  AppDelegate.m
//  Nerdfeed
//
//  Created by Matthew Chupp on 4/1/15.
//  Copyright (c) 2015 MattChupp. All rights reserved.
//

#import "AppDelegate.h"
#import "MCCoursesViewController.h"
#import "MCWebViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds] ];
    
    MCCoursesViewController *cvc = [[MCCoursesViewController alloc]
                                    initWithStyle:UITableViewStylePlain];
    
    UINavigationController *masterNav = [[UINavigationController alloc]
                                         initWithRootViewController:cvc];
    
    MCWebViewController *wvc = [[MCWebViewController alloc] init];
    cvc.webViewController = wvc;
    
    //self.window.rootViewController = masterNav;
    
    // Add a split view controller for the iPad
    // First:
    // Check to make sure we are running on the iPad
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        
        // webViewController must be in navigation controller
        UINavigationController *detailNav =
        [[UINavigationController alloc] initWithRootViewController:wvc];
        
        UISplitViewController *svc = [[UISplitViewController alloc] init];
        
        // Set the delegate of the split view controller to the detail VC
        svc.delegate = wvc;
        
        svc.viewControllers = @[masterNav, detailNav];
        
        // Set the root view controller of the window to the split view controller
        self.window.rootViewController = svc;
    
    } else {
        // On non-iPad devices, just use the navigation controller
        self.window.rootViewController = masterNav; 
    }
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
