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
@property (nonatomic, copy) NSArray *courses;

@end

@implementation MCCoursesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
}

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
//    return 0;
    return [self.courses count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return nil;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                            forIndexPath:indexPath];
    NSDictionary *course = self.courses[indexPath.row];
    cell.textLabel.text = course[@"title"];

    return cell;
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
                        completionHandler:
         ^(NSData *data, NSURLResponse *response, NSError *error) {
              
             NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                                        options:0
                                                                          error:nil];
             self.courses = jsonObject[@"courses"];
             
             NSLog(@"%@", self.courses);
             
             dispatch_async(dispatch_get_main_queue(), ^{
                 [self.tableView reloadData];
             });
        }];
    [dataTask resume];
}

@end
