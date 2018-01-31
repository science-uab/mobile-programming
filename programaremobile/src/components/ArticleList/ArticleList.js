// Sicoe Mihai Alexandru
// mitza.al@gmail.com 
// MIT license

import React from 'react';
import { Text, StyleSheet, FlatList } from 'react-native';
import ArticleItem from './../ArticleItem/ArticleItem';

const ArticleList = props => {
    return (
        <FlatList 
            style={styles.listContainer}
            data={props.articles}
            keyExtractor={item => item.id}
            renderItem={(info) => (
                <ArticleItem
                    articleTitle = {info.item.title}
                    articleBody = {info.item.body}
                    articleImages = {info.item.images}
                    onItemPress = {() => props.onItemSelected(info.item.id)}
                />
            )}
         />
    )
}

const styles = StyleSheet.create({
    listContainer: {
        marginTop: 5,
        width: '100%',
    },
})

export default ArticleList;