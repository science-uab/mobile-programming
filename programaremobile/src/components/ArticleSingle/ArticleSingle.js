// Sicoe Mihai Alexandru
// mitza.al@gmail.com 
// MIT license

import React from 'react';
import { View, ScrollView, Image, Modal, Button, StyleSheet, Text, Platform } from 'react-native';
import Config from 'react-native-config';
import TimeAgo from 'react-native-timeago';
import OpenArticleInBrowser from './../OpenArticleInBrowser/OpenArticleInBrowser';


let moment = require('moment');
require('moment/locale/ro');
moment.locale('ro');

class ArticleSingle extends React.Component {

    imageSource = (path) => {
        return ({
            uri: Config.LOCALE_API + "images/" + path
        })
    }

    render (props) {
        ArticleModalContent = null;
        CloseButton = null;

        if (this.props.selectedArticle) {
            ArticleModalContent = (
                <ScrollView style={styles.articleContainer}
                showsVerticalScrollIndicator={false}
                >
                    <Text style={styles.articleTitle}>
                        {this.props.selectedArticle.title}
                    </Text>

                    <Image
                        source={this.imageSource(this.props.selectedArticle.images[0].path)}
                        style={styles.articleImage}
                    />
                 
                    {/* ARTICLE META */}
                    <View style={styles.articleMeta}>
                        <View style={styles.articleMetaAuthorAndDate}>
                            <Text style={styles.articleMetaAuthor}>
                                {this.props.selectedArticle.author}
                            </Text>
                            <TimeAgo style={styles.articleMetaDate} time={this.props.selectedArticle.date_published} />
                        </View>
                        <OpenArticleInBrowser
                        ArticleSourceName={this.props.selectedArticle.source.name}
                        url={this.props.selectedArticle.url}/>

                    </View>
                    
                    {/* ARTICLE BODY */}
                    <Text style={styles.articleBody}>
                        {this.props.selectedArticle.body}
                    </Text>


                </ScrollView>
            )
        }

        return (
            <Modal 
            visible={(this.props.selectedArticle !== null)}
            onRequestClose={this.props.onModalClosed}
            animationType="slide"
            >   
                <View style={styles.modalContainer}>
                    {ArticleModalContent}
                    {CloseButton}
                    <Button style={styles.closeButton} title={"Închide"} onPress={this.props.onModalClosed} />
                </View>
            </Modal>
        );
    }
}

const styles = StyleSheet.create({
    articleMeta: {
        flex: 1, 
        flexDirection: 'row',
        justifyContent: 'space-between',
    },  
    closeButton: {
        marginTop: 15,
    },
    articleMetaAuthorAndDate: {
        
    },
    articleMetaDate: {
        paddingHorizontal: 5,
        fontSize: 10,
    },
    articleMetaAuthor: {
        paddingHorizontal: 5,
        fontWeight: "bold",
        paddingTop: 10,
        fontSize: 16,
    },
    articleMetaContent: {
        paddingHorizontal: 5,
        paddingTop: 10,
        fontSize: 16,
    },
    articleBody: {
        paddingHorizontal: 5,
        paddingTop: 10,
        fontSize: 16,
        paddingBottom: 50,
        textAlign: "justify",
    },
    articleTitle: {
        color: "black",
        fontWeight: "bold",
        fontSize: 26,
        paddingVertical: 5,
        paddingBottom: 12,
    },
    articleImage: {
        height: 280,
        width: "100%",
    },
    articleContainer: {
        height: "95%",
        marginTop: 10,
        paddingTop: 10,
    },
    modalContainer: {
        margin: 22,
        flex: 1,
    },
    modalPlaceName: {
        marginVertical: 5,
        fontWeight: "bold",
        textAlign: "center",
        fontSize: 28,
    }
});

export default ArticleSingle;