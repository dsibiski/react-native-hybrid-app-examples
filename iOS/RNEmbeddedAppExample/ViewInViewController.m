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
    
    // We need a reference to the AppDelegate since that is where we stored our `RCTBridge`.
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    // Here we create a `RCTRootView` that initializes with the `RCTBridge` that we already pre-loaded.
    RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:delegate.bridge moduleName:@"SimpleView"];
    
    // We only want this view to take a small portion of the screen.
    rootView.frame = CGRectMake(20, 84, [UIScreen mainScreen].bounds.size.width - 40, 200);
    
    // Each `ViewController` comes with it's own "base" view, here we just want to add our `RCTRootView`
    // to that "base" view so that it is visible on the screen.
    [self.view addSubview:rootView];
}

@end
