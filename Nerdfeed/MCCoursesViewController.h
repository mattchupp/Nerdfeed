//
//  MCCoursesViewController.h
//  Nerdfeed
//
//  Created by Matthew Chupp on 4/1/15.
//  Copyright (c) 2015 MattChupp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class MCWebViewController;

@interface MCCoursesViewController : UITableViewController

@property (nonatomic) MCWebViewController *webViewController; 

@end
