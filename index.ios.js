/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';

var React = require('react-native');
var {
  AppRegistry,
} = React;

var SimpleView = require('./SimpleView');
var PassingData = require('./PassingData');

AppRegistry.registerComponent('SimpleView', () => SimpleView);
AppRegistry.registerComponent('PassingData', () => PassingData);
