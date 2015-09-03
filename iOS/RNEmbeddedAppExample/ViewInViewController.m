//
//  ViewInViewController.m
//  RNEmbeddedAppExample
//
//  Created by Dave Sibiski on 9/2/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import "ViewInViewController.h"
#import "RCTRootView.h"
#import "AppDelegate.h"

@interface ViewInViewController ()

@end

@implementation ViewInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"View in View";
    
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:delegate.bridge moduleName:@"SimpleView"];
    rootView.frame = CGRectMake(20, 84, [UIScreen mainScreen].bounds.size.width - 40, 200);
    
    [self.view addSubview:rootView];
}

@end
