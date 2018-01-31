// Sicoe Mihai Alexandru
// mitza.al@gmail.com 
// MIT license

import React from 'react';
import { Text, View, StyleSheet, Button, TouchableHighlight} from 'react-native';


class Header extends React.Component {

    firstPage = (
        <View style={styles.headerContainer}>
        <TouchableHighlight style={styles.pageButton} onPress={() => {}}>
            <Text style={styles.pageButtonText}>
                {" "}
            </Text>
        </TouchableHighlight>
        
        <TouchableHighlight style={styles.pageButton} onPress={this.props.onAppRefresh}>
            <Text style={styles.headerText}>locale</Text>
        </TouchableHighlight>

        <TouchableHighlight style={styles.pageButton} onPress={this.props.onNextPage}>
            <Text style={styles.pageButtonText}>
                {">"}
            </Text>
        </TouchableHighlight>
    </View>
    )

    notFirstPage = (
        <View style={styles.headerContainer}>
        <TouchableHighlight style={styles.pageButton} onPress={this.props.onPrevPage}>
            <Text style={styles.pageButtonText}>
                {"<"}
            </Text>
        </TouchableHighlight>

        <TouchableHighlight style={styles.pageButton} onPress={this.props.onAppRefresh}>
            <Text style={styles.headerText}>locale</Text>
        </TouchableHighlight>

        <TouchableHighlight style={styles.pageButton} onPress={this.props.onNextPage}>
            <Text style={styles.pageButtonText}>
                {">"}
            </Text>
        </TouchableHighlight>
    </View>
    )

    render() {
        const PreviewsPage = null;
        if (this.props.page !== 0) {
            return this.notFirstPage;
        } else {
            return this.firstPage;
        }
       
    }
}

const styles = StyleSheet.create({
    pageButton: {
        flex:1 , marginRight:10,
    },
    pageButtonText: {
        paddingTop: 10,
        flex:1 , marginRight:10,
        fontWeight: "bold",
        color: "white",
        textAlign: 'center',
        fontSize: 22,
    },
    headerContainer: {
        flexDirection: 'row',
        justifyContent: 'center',
    },
    headerText: {
        fontWeight: "bold",
        fontSize: 20,
        textAlign: 'center',
        marginVertical: 10,
        color: "#F5FCFF",
      },
})

export default Header;