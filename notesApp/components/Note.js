/**
 * @Author: Olariu Lucian
 * @Email: olariu.lucian1@gmail.com
 * @License: MIT
 */

import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  Button,
  Image,
  Dimensions
} from 'react-native';

import TimeAgo from 'react-native-timeago';

export default class Note extends Component<{}> {
  constructor(props) {
    super(props);
  }
  static navigationOptions = {
      title: 'Note',
  };

  state = {
    id: this.props.navigation.state.params.noteData.id,
    text: this.props.navigation.state.params.noteData.text,
    latitude: this.props.navigation.state.params.noteData.latitude,
    longitude: this.props.navigation.state.params.noteData.longitude,
    images: this.props.navigation.state.params.noteData.images.split(','),
    createdAt: this.props.navigation.state.params.noteData.created_at
    
  }

  render() {
    return (
      <View style={styles.container}>
        <View style={styles.imagesContainer}>
        {this.state.images.map((image, index) => {
            return (
              <Image style={styles.selectedImages} key={index} source={{uri: image}} />
            )
          })}
        </View>

        <View style={styles.textContainer}>
          <Text>{this.state.text}</Text>
        </View>

        <View style={styles.metaDataContainer}>
          <Text>{this.state.latitude}</Text>
          <Text>{this.state.longitude}</Text>
          <TimeAgo style={styles.listItemTime} time={this.state.createdAt} />
          <Text>{console.log(Dimensions.get('window').width)}</Text>
        </View>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingRight: 10,
    paddingLeft: 10,
    paddingTop: 15,
    maxWidth: Dimensions.get('window').width
  },
  textContainer: {
    flex: 1,
    borderBottomWidth: 1,
    borderBottomColor: 'lightgray'
  },
  imagesContainer: {
    flex: 2,
    flexDirection: 'row',
    borderBottomWidth: 1,
    borderBottomColor: 'lightgray'
  },
  metaDataContainer: {
    flex: 1
  },
  selectedImages: {
    width: 100,
    height: 100,
    marginRight: 10
  }
});