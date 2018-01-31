// Sicoe Mihai Alexandru
// mitza.al@gmail.com 
// MIT license

import React from 'react';
import {Linking, TouchableOpacity, View, Text, StyleSheet} from 'react-native';
import PropTypes from 'prop-types';

class OpenArticleInBrowser extends React.Component {
  handleClick = () => {
    Linking.canOpenURL(this.props.url).then(supported => {
      if (supported) {
        Linking.openURL(this.props.url);
      } else {
        console.log("Can't open: " + this.props.url);
      }
    });
  };
  render() {
    return (
      <TouchableOpacity onPress={this.handleClick}>
        <View style={styles.ArticleLink}>
          <Text style={styles.ArticleLinkText}>{this.props.ArticleSourceName}</Text>
        </View>
      </TouchableOpacity>
    );
  }
}

const styles = StyleSheet.create(
    {
        ArticleLink: {
            width: "auto",
            alignItems: 'flex-end',
            borderRadius: 1,
            paddingHorizontal: 5,
        },
        ArticleLinkText: {
            padding: 2,
            paddingRight: 0,
            color: "blue",
            fontWeight: "bold",
            paddingHorizontal: 5,
            paddingTop: 12,
            fontSize: 18,
            paddingBottom: 15,
            textAlign: "justify",
        },
    }
);

export default OpenArticleInBrowser;