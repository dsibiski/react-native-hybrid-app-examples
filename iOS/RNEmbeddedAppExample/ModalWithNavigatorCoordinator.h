//
//  ModalWithNavigatorCoordinator.h
//  RNEmbeddedAppExample
//
//  Created by Dave Sibiski on 9/4/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCTBridgeModule.h"

@protocol ModalWithNavigatorCoordinatorDelegate;

@interface ModalWithNavigatorCoordinator : NSObject <RCTBridgeModule>

@property (nonatomic, weak) id<ModalWithNavigatorCoordinatorDelegate> delegate;

@end

// Here we define the delegate methods that could be overriden by any other object.
@protocol ModalWithNavigatorCoordinatorDelegate <NSObject>
@optional

- (void)closeModal;

@end
