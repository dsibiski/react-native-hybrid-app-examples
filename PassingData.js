'use strict';

var React = require('react-native');

var SimpleList = require('./SimpleList');

class PassingData extends React.Component {
    render() {
        return (
            <SimpleList data={this.props.data} />
        );
    }
}

PassingData.propTypes = {
    data: React.PropTypes.array.isRequired,
};

module.exports = PassingData;
