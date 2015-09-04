'use strict';

var React = require('react-native');

var SimpleList = require('./SimpleList');

class PassingData extends React.Component {
    render() {
        return (
            // Here we simply pass down our `data` prop that we got from our
            // ViewController to the next component which is a ListView wrapped
            // with some styling.
            <SimpleList data={this.props.data} />
        );
    }
}

PassingData.propTypes = {
    // This prop is passed down in `initialProperties` from Obj-C.
    data: React.PropTypes.array.isRequired,
};

module.exports = PassingData;
