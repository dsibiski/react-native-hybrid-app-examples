//
//  ModalWithNavigatorCoordinator.m
//  RNEmbeddedAppExample
//
//  Created by Dave Sibiski on 9/4/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import "ModalWithNavigatorCoordinator.h"

@implementation ModalWithNavigatorCoordinator

RCT_EXPORT_MODULE()

// This is an exported method that is available in JS.
RCT_EXPORT_METHOD(closeModal) {
  [self.delegate closeModal];
}

@end
