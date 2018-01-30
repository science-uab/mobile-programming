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
  FlatList,
  TouchableHighlight,
  Alert,
  AsyncStorage,
  Image
} from 'react-native';

import TimeAgo from 'react-native-timeago';

export default class notesApp extends Component<{}> {
  constructor(props) {
    super(props);
  }
  static navigationOptions = {
    title: 'All Notes',
  };

  state = {
      notes: [],
      cityName: null
  }

  componentDidMount() {
    this.getNotes()
    this.getCity()
  }

  async getNotes() {
    let response = await fetch('http://10.0.0.45:5555/api/v1/notes')
    let notes = await response.json()
    this.setState({notes: notes});
  }

  getCity() {
    var url = `https://maps.googleapis.com/maps/api/geocode/json?latlng=46.0644575,23.5677094&key=AIzaSyACsMbX2GHAHUudwoYRmre-ze_MFoLw5Ec`;
    fetch(url)
      .then((response) => response.json())
      .then((responseJson) => {
        console.log(responseJson);
        this.setState({
          cityName: responseJson.results[3].formatted_address,
        });
      })
      .catch((error) => {
       console.error(error);
      });
  }

  handleAddNote = () => {
    this.props.navigation.navigate('AddNote');
  }

  render() {
    const { navigate } = this.props.navigation;
    return (
      <View style={styles.outerContainer}>
        {console.log(this.state.notes)}
        <View style={styles.container}>
          <FlatList
            style={styles.listContainer}
            data={this.state.notes}
            keyExtractor={item => item.id}
            renderItem={({item}) => 
              <View style={styles.listItem}>
                <Image style={{height:100, width:100, marginRight: 10, flex: 2}} key={item.id} source={{uri: item.images.split(',')[0]} } />
                <View style={styles.listItemTextContainer}>
                  <Text style={styles.listItemText}>{item.text.substring(0,20)} ...</Text>
                  <TimeAgo style={styles.listItemTime} time={item.created_at} />
                  <Text style={styles.listItemText}>{this.state.cityName}</Text>
                </View>
                <TouchableHighlight onPress={() =>navigate('Note', { noteData: item })} style={styles.listItemNav}>
                  <Text style={{textAlign: 'center', color: 'white', fontSize: 20, fontWeight: 'bold'}}>-></Text>
                </TouchableHighlight>
              </View>}
          />
        </View>
        <Button style={{height: 50}} onPress={this.handleAddNote} title="Take a note" />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  outerContainer: {
    flex: 1,
    flexDirection: 'column',
    justifyContent: 'space-between',
  },
  container: {
    flex: 1,
    flexDirection: 'column',
    justifyContent: 'space-between',
    paddingRight: 10,
    paddingLeft: 10,
    paddingTop: 15
  },
  listContainer: {
    flex: 1
  },
  listItem: {
    flex: 1,
    height: 100,
    marginBottom: 10,
    paddingBottom: 5,
    borderWidth: 1,
    borderColor: 'lightgray',
    elevation: 1,
    flexDirection: 'row',
  },
  listItemNav: {
    flex: 1,
    width: 40,
    height: 100,
    backgroundColor: '#2196F3',
    elevation: 4,
    justifyContent: 'center',
    alignItems: 'center',
    
  },
  listItemTextContainer: {
    flex: 5,
    flexDirection: 'column',
    justifyContent: 'space-between',
  },
  listItemText: {
  
  },
  listItemTime: {
    color: 'lightgray',
    fontStyle: 'italic'
  }
});
