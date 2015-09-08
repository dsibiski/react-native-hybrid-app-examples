# React Native Embedded App Example
A collection of examples for using React Native in an existing iOS application

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
         - ie. `[(MyNativeModule *)[myAppdelegate.bridge.modules[@"MyNativeModule"] setDelegate:self]];`
         
### Questions? Suggestions?

- Are there a specific use-cases that you need a solution for? Is the documentation here a little confusing? **Feel free to open up an issue.**
- Have you implemented something else than what's listed here? Can these examples be implemented in a better way? **Please submit a pull request!**