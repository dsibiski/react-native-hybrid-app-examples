# React Native Hybrid App Examples
A collection of examples for using React Native in an existing iOS application

### Concepts

#### Pre-loading the Bridge
One of the first things that you should do, if you want decent performance out of your hybrid app, is to pre-load your `RCTBridge` and keep a reference of it somewhere (possibly your `AppDelegate`):

*AppDelegate.h*
```objc
@property (nonatomic, strong) RCTBridge *bridge;
```
*AppDelegate.m*
```objc
@synthesize bridge;
...

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    ...configure the jsCodeLocation here...

    bridge = [[RCTBridge alloc] initWithBundleURL:jsCodeLocation
                                   moduleProvider:nil
                                    launchOptions:launchOptions];
                                    
    ...setup your rootViewController here...
    
    return YES;
}
```

This will allow the JavaScript to pre-load and allow you to use this bridge later on in other parts of the app:

```objc
AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:delegate.bridge moduleName:@"MyModule"];
```

#### Multiple "Entry" Points

In your `index.ios.js` file, you can "register" different modules that you want to use as seperate entry points in your app:

```javascript
var React = require('react-native');
var {
  AppRegistry,
} = React;

var MainEntry = require('./Main');
var SecondEntry = require('./Second');
var ThirdEntry = require('./Third');

AppRegistry.registerComponent('MainEntry', () => MainEntry);
AppRegistry.registerComponent('SecondEntry', () => SecondEntry);
AppRegistry.registerComponent('ThirdEntry', () => ThirdEntry);
```

You can then pass these in as the `moduleName` when creating a `RCTRootView`:

```objc
RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:delegate.bridge moduleName:@"SecondEntry"];
```

### Examples

#### Simple
1. [React View inside a Native View](https://github.com/dsibiski/react-native-embedded-app-example/blob/master/iOS/RNEmbeddedAppExample/ViewInViewController.m)
   - Very basic example that shows how a React Native component can be loaded inside of a `UIView` that already exists in `UIViewController`.
   
2. [Passing Data into a React View](https://github.com/dsibiski/react-native-embedded-app-example/blob/master/iOS/RNEmbeddedAppExample/PassingDataViewController.m)
   - Demonstrates how you can use `initialProperties` on `RCTRootView` to pass data to your React Native component.
   
#### Advanced

1. [Native Modal With RN Navigation](https://github.com/dsibiski/react-native-embedded-app-example/blob/master/iOS/RNEmbeddedAppExample/ModalWithNavigatorViewController.m)
   - This example demonstrates how a React Native component can communicate & perform actions on it's native Obj-C container.
   - Using a [Coordinator](https://github.com/dsibiski/react-native-embedded-app-example/blob/master/iOS/RNEmbeddedAppExample/ModalWithNavigatorCoordinator.m) native module, we are able to `delegate` method calls to the native Obj-C container.
     - **Why don't we just export the methods directly on the Obj-C container itself?** When a bridge is initialized, each native module gets instantiated and the bridge holds that instance. If we were to create another instance of that Obj-C container (from within our base Obj-C app), the JS calls wouldn't be able to use that instance, since it only knows about the instance on the bridge.
       - For this reason, we pass in a `delegate` to the native module instance on the bridge **after** the `RCTBridge` and `RCTRootView` are created.
       - For example:
            
            ```objc
            [(MyNativeModule *)[myAppdelegate.bridge.modules[@"MyNativeModule"] setDelegate:self]];
            ```
     - **Why don't we use the `moduleProvider` block to pass in instances of the modules when the bridge loads?** Since, we are trying to load the bridge at startup, for performance gains, we don't yet have the instance of all of our view controllers.
       - It's possible to do this (and perhaps recommended - no need for a `Coordinator`), but you would need to create your bridges when your container view controller loads, this could cause performance issues if you want your React Native components to display immediately.
       - For example (when loading your container view controller):

            ```objc
            RCTBridge *bridge = [[RCTBridge alloc] initWithBundleURL:jsCodeLocation 
                                                  moduleProvider:^ NSArray *{
                                                    return @[self];
                                                  }
                                                   launchOptions:nil];

            RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge moduleName: @"MyModule"];
            ```
       - There is more discussion about this technique [here](https://github.com/facebook/react-native/issues/1398).
       
### Discussions About Hybrid Apps

- [[NavigatorIOS] integration with navigator in existing native app #2442](https://github.com/facebook/react-native/issues/2442)
- [[Request] Invoke Methods of Native UI Components #2272](https://github.com/facebook/react-native/issues/2272)
- [[Integration w/ Existing App] How to pass the native navigation controller into a react-native root view component? #1422](https://github.com/facebook/react-native/issues/1422)
- [[Integration w/ Existing App] Multiple react-native Applications Design #1398](https://github.com/facebook/react-native/issues/1398)
- [[Perf] Small delay displaying RCTRootView after a push #1277](https://github.com/facebook/react-native/issues/1277)
- [Multiples Components best practices: sharing bridge? #1073](https://github.com/facebook/react-native/issues/1073)
- [Forcing view refresh #1049](https://github.com/facebook/react-native/issues/1049)
- [Best practice to integrate existing app with React-Native #995](https://github.com/facebook/react-native/issues/995)
- [[Initialization] Decouple script loading and environment setup from the root view #66](https://github.com/facebook/react-native/pull/66)
         
### Questions? Suggestions?

- Are there a specific use-cases that you need a solution for? Is the documentation here a little confusing? **Feel free to open up an issue.**
- Have you implemented something else than what's listed here? Can these examples be implemented in a better way? **Please submit a pull request!**
