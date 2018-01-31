/**
 * @Author: Olariu Lucian
 * @Email: olariu.lucian1@gmail.com
 * @License: MIT
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  Button
} from 'react-native';

import CameraRollPicker from 'react-native-camera-roll-picker';

export default class ImageBrowser extends Component {
  constructor(props) {
    super(props);

    this.state = {
      num: 0,
      selected: [],
    };
  }

  static navigationOptions = {
    title: 'Select images for note',
  };

  getSelectedImages(images, current) {
    var num = images.length;

    this.setState({
      num: num,
      selected: images,
    });
  }

  handleSaveImages() {
    this.props.navigation.navigate('AddNote', {selectedImages: this.state.selected});
  }

  render() {
    return (
      <View style={styles.container}>
        <View style={styles.content}>
          <Text style={styles.text}>
            <Text style={styles.bold}> {this.state.num} </Text> images has been selected
          </Text>
        </View>
        <CameraRollPicker
          scrollRenderAheadDistance={500}
          initialListSize={1}
          pageSize={3}
          removeClippedSubviews={false}
          groupTypes='All'
          batchSize={5}
          maximum={3}
          selected={this.state.selected}
          assetType='Photos'
          imagesPerRow={3}
          imageMargin={5}
          callback={this.getSelectedImages.bind(this)} />
        <Button
            onPress={() => {this.props.navigation.navigate('AddNote', {selected: this.state.selected})}} 
            title="Save Images" 
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F6AE2D',
  },
  content: {
    marginTop: 15,
    height: 50,
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    flexWrap: 'wrap',
  },
  text: {
    fontSize: 16,
    alignItems: 'center',
    color: '#fff',
  },
  bold: {
    fontWeight: 'bold',
  },
  info: {
    fontSize: 12,
  },
});