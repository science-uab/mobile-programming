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
  TextInput,
  FlatList,
  TouchableHighlight,
  CameraRoll,
  Image,
  AsyncStorage,
  Dimensions,
} from 'react-native';

import Voice from 'react-native-voice';
import UUIDGenerator from 'react-native-uuid-generator';


export default class AddNote extends Component<{}> {
  constructor(props) {
    super(props);
    this.state = {
      id: null,
      error: '',
      results: [],
      partialResults: [],
      text: '',
      images: [],
      location: {},
    };
    // Voice 
    Voice.onSpeechError = this.onSpeechError.bind(this);
    Voice.onSpeechResults = this.onSpeechResults.bind(this);
    Voice.onSpeechPartialResults = this.onSpeechPartialResults.bind(this);
    Voice.onSpeechEnd = this.onSpeechEnd.bind(this);
  }

  static navigationOptions = {
    title: 'Take a note',
  };

  componentDidMount() {
    navigator.geolocation.getCurrentPosition((position) => {
      const location = position;
      this.setState({ location: location });
    });
    if (this.props.navigation.state.params !== undefined) {
      this.setState({
        images: this.state.images.concat(this.props.navigation.state.params.selected) 
      });
    }
  }

  handleChoosePhoto = () => {
    this.props.navigation.navigate('ImageBrowser');
  }

  handleTakePhoto = () => {
    console.log(this.state);
  }

  persistData() {

    let payload = {
      text: this.state.text,
      latitude: this.state.location.coords.latitude,
      longitude: this.state.location.coords.longitude,
      images: (() => {
        var imageUriArray = this.state.images.map((image, index)=> {
          console.log(image)
          return image.uri;
        });
        console.log(imageUriArray);
        return imageUriArray.concat(',');
      })(),
    }

    console.log(payload);

    fetch('http://10.0.0.45:5555/api/v1/note', {
      method: 'POST',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(payload),
    });

    this.props.navigation.navigate('notesApp');
  }

  // Speech controls ----------------------------------->
  onSpeechError(e) {
    this.setState({
      error: JSON.stringify(e.error),
    });
  }

  onSpeechEnd(e) {
    
  }

  onSpeechResults(e) {
    this.setState({
      text: this.state.text + ' ' + e.value[0]
    })
  }

  onSpeechPartialResults(e) {
    this.setState({
      partialResults: e.value,
    });
  }

  async _startRecognizing(e) {
    try {
      await Voice.start('ro-RO');
    } catch (e) {
      console.error(e);
    }
  }
// End speech controls ------------------------------------------------->
  render() {
    return (
        <View style={styles.container}>
          <View style={styles.imagesContainer}>
          {/* Images */}
          {this.state.images.map((image, index) => {
            console.log(image)
            var uri = {
              uri: image.uri
            }
            return (
              <Image style={styles.selectedImages} key={uri.uri} source={{uri: uri.uri}} />
            )
          })}
          </View>
          <TextInput onChangeText={(text) => this.setState({text})} value={this.state.text} style={styles.noteInput}></TextInput>
          
          <View style={styles.buttonContainer}>
              <View style={styles.takeNoteButton}>
                <Button
                  style={styles.noteActionButton} 
                  onPress={this.handleTakePhoto} 
                  title="Take a photo" 
                />
              </View>
              <View style={styles.takeNoteButton}>
                <Button
                  style={styles.noteActionButton} 
                  onPress={this.handleChoosePhoto} 
                  title="Choose photos" 
                />
              </View>
              <View style={styles.takeNoteButton}>
                <Button
                  style={styles.noteActionButton}
                  onPress={this._startRecognizing.bind(this)} 
                  title="Tap to speak" 
                />
              </View>
              <View style={styles.takeNoteButton}>
                <Button
                  style={styles.noteActionButton}
                  onPress={this.persistData.bind(this)} 
                  title="Save" 
                />
              </View>
          </View>
        </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    maxWidth: Dimensions.get('window').width
  },
  noteInput: {
    flex: 1
  },
  buttonContainer: {

  },
  takeNoteButton: {
    borderRadius:10,
    
  },
  noteActionButton: {
    height: 200,
    marginBottom: 5
  },
  imagesContainer: {
    flex: 4,
    flexDirection: 'row',
    borderBottomWidth: 1,
    borderBottomColor: 'lightgray'
  },
  selectedImages: {
    width: 70,
    height: 70,
  }
});