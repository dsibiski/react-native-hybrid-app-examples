//
//  ModalWithNavigatorViewController.m
//  RNEmbeddedAppExample
//
//  Created by Dave Sibiski on 9/4/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import "ModalWithNavigatorViewController.h"
#import "AppDelegate.h"
#import "RCTRootView.h"
#import "ModalWithNavigatorCoordinator.h"

@interface ModalWithNavigatorViewController ()

@end

@implementation ModalWithNavigatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // We need a reference to the AppDelegate since that is where we stored our `RCTBridge`.
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    // Here we create a `RCTRootView` that initializes with the `RCTBridge` that we already pre-loaded.
    RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:delegate.bridge moduleName:@"ModalWithNavigator"];
    
    // Here we are getting access to the already instanciated `ModalWithNavigatorCoordinator` NativeModule and then
    // setting this controller as it's `Delegate`. This will enable the Coordinator to execute methods here, without
    // being coupled to this specific class.
    [(ModalWithNavigatorCoordinator *)[delegate nativeModuleForString:@"ModalWithNavigatorCoordinator"] setDelegate:self];
    
    // We want this view to take up the entire screen.
    rootView.frame = [UIScreen mainScreen].bounds;
    
    // Each `ViewController` comes with it's own "base" view, here we just want to add our `RCTRootView`
    // to that "base" view so that it is visible on the screen.
    [self.view addSubview:rootView];
}

// Here we override the `closeModal` delegate method from the Coordinator. This will be executed from the JS via
// the Coordinator.
- (void)closeModal {
    // We are simply dismissing the modal view.
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
