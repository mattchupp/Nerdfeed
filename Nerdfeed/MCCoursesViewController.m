//
//  MCCoursesViewController.m
//  Nerdfeed
//
//  Created by Matthew Chupp on 4/1/15.
//  Copyright (c) 2015 MattChupp. All rights reserved.
//

#import "MCCoursesViewController.h"

@interface MCCoursesViewController ()

@property (nonatomic, strong) NSURLSession *session;

@end

@implementation MCCoursesViewController

- (NSInteger)tableView:(UITableView *)tableView {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    
    self = [super initWithStyle:style];
    if (self) {
        self.navigationItem.title = @"BNR Courses";
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        _session = [NSURLSession sessionWithConfiguration:config
                                                 delegate:nil
                                            delegateQueue:nil];
        [self fetchFeed];
    }
    return self;
}

- (void)fetchFeed {
    
    NSString *requestString = @"http://bookapi.bignerdranch.com/courses.json";
    NSURL *url = [NSURL URLWithString:requestString];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *dataTask =
        [self.session dataTaskWithRequest:req
                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            NSLog(@"%@", json);
        }];
    [dataTask resume];
}

@end
