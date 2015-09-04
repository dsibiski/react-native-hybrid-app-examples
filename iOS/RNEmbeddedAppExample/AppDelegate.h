/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import <UIKit/UIKit.h>
#import "RCTBridge.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;

/**
 * Here we are exposing a `RCTBridge` publicly so that we can access
 * it from anywhere in our app. We simply need to gain access to the
 * AppDelegate and we can get the `RCTBridge`.
 */
@property (nonatomic, strong) RCTBridge *bridge;

@end
