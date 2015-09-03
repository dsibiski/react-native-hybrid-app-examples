'use strict';

var React = require('react-native');

var {
    Text,
    View,
    TouchableHighlight,
    ListView,
} = React;

class SimpleList extends React.Component {
    constructor(props) {
        super(props);

        var dataSource = new ListView.DataSource(
            {rowHasChanged: (r1, r2) => r1 !== r2});
            this.state = {
                dataSource: dataSource.cloneWithRows(this.props.data)
            };

        this._renderRow = this._renderRow.bind(this);
        this._rowPressed = this._rowPressed.bind(this);
    }

    _rowPressed(row) {
        console.log(row);
    }

    _renderRow(rowData, sectionID, rowID) {
        return (
            <TouchableHighlight
                onPress={() => this._rowPressed(
                    this.props.data[rowID])
                }
                underlayColor='#f3f3f3'>
                <View style={styles.container}>
                    <View style={styles.rowContainer}>
                        <Text style={styles.name}>{rowData}</Text>
                    </View>
                    <View style={styles.separator}/>
                </View>
            </TouchableHighlight>
        );
    }

    render() {
        return (
            <ListView
                dataSource={this.state.dataSource}
                renderRow={this._renderRow}
                initialListSize={20}
            />
        );
    }
}

SimpleList.propTypes = {
    data: React.PropTypes.array.isRequired,
};

var styles = React.StyleSheet.create({
    separator: {
        height: 1,
        backgroundColor: '#dddde0'
    },
    name: {
        fontSize: 19,
        color: '#000'
    },
    container: {
        marginLeft: 15
    },
    rowContainer: {
        flexDirection: 'row',
        padding: 10,
        paddingLeft: 0
    }
});

module.exports = SimpleList;
