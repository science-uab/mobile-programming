// Sicoe Mihai Alexandru
// mitza.al@gmail.com 
// MIT license

import React from 'react';
import {Text, View, TouchableOpacity, StyleSheet, Image, ImageBackground} from 'react-native';
import Config from 'react-native-config';
import LinearGradient from 'react-native-linear-gradient';

class ArticleItem extends React.Component {

    shorterBody = (bodyText) => {
        return bodyText.substring(0, 250) + '... ';
    }

    imageSource = (path) => {
        return ({
            uri: Config.LOCALE_API + "images/" + path
        })
    }

    render (props) {
        return (
            <TouchableOpacity onPress={this.props.onItemPress}>
                <View style={styles.articleItem}>
                    <ImageBackground resizeMode="cover" source={this.imageSource(this.props.articleImages[0].path)} style={styles.articleImagePrewiew}>
                        <LinearGradient
                            colors={['rgba(1, 1, 1,0)', 'rgba(1, 1, 1,0.3)', 'rgb(1, 1, 1)']}
                            style={styles.contentContainer}
                        >
                            <Text style={styles.articleTitle}>{this.props.articleTitle}</Text>
                        </LinearGradient>
                    </ImageBackground>
                    {/* <View>
                        <Text style={styles.articleTitle}>{this.props.articleTitle}</Text>
                        <Text style={styles.articleBodyPreview}>{this.shorterBody(this.props.articleBody)}</Text>
                    </View> */}
                </View>
            </TouchableOpacity>
        );
    }
};

const styles = StyleSheet.create({
    articleItem: {
        flex: 1
        // paddingHorizontal: 10,
        // paddingVertical: 10,
    },
    articleTitle: {
        color: "white",
        fontSize: 18,
        fontWeight: "bold",
        paddingVertical: 20,
        paddingHorizontal: 35,
        paddingTop: "35%",
    },
    articleBodyPreview: {
        fontSize: 14,
        color: "#324147",
    },
    articleImagePrewiew: {
        // marginRight: 8,
        // height: 400,
        width: "100%",
    }
});

export default ArticleItem;