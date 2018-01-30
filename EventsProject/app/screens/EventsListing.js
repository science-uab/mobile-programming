/**
 * @author Malai Mihai
 * @email trmmsob@gmail.com
 * @licence MIT
 */
import React, {Component} from 'react';
import {Text, View, ScrollView, StyleSheet, TouchableOpacity, Dimensions} from 'react-native';
import {StatusBar} from 'react-native';
import EventItem from '../compoents/EventItem';
import Icon from 'react-native-vector-icons/dist/FontAwesome';
import MapView, {Marker} from 'react-native-maps';
import dataService from '../services/DataService';

const style = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#16a085"
  },
  scrollView: {
    marginRight: 10,
    marginLeft: 10
  },
  mapContainer: {
    ...StyleSheet.absoluteFillObject,
    justifyContent: 'flex-end',
    alignItems: 'center',
  },
  map: {
    ...StyleSheet.absoluteFillObject,
  },
})
;

class EventsListing extends Component<{}> {

  constructor(props) {
    super(props);
    this.state = {
      mapView: false
    };

    this.initEvents();
  }

  static navigationOptions = ({ navigation }) => {
    const { params = {} } = navigation.state;
    let headerRight = (
    <TouchableOpacity style={{marginRight: 10}}  onPress={params.handleIconPress ? params.handleIconPress : () => null}>
      <Icon name="map" size={26} color='#d35400'/>
    </TouchableOpacity>
    );

    return {
      title: "Events List",
      headerRight
    };
  };

  initEvents() {
    this.setState({
      events: dataService.getEvents()
    });
  }

  _handleIconPress = () => {
    this.setState({
      mapView: !this.state.mapView
    });
  }


  componentDidMount() {
    this.props.navigation.setParams({ handleIconPress: this._handleIconPress });
  }

  render() {
    return (
      <View style={style.container}>
        <StatusBar backgroundColor="#1abc9c"/>
        {
          this.state.mapView === true
            ?
            <View style={style.mapContainer}>
              <MapView
                style={style.map}
                initialRegion={{
                  latitude: 46.068604,
                  longitude: 23.569570,
                  latitudeDelta: 0.0922,
                  longitudeDelta: 0.0421,
                }}
              >
                {this.state.events.map(marker => (
                  <Marker
                    key={marker.id}
                    coordinate={{
                      latitude: marker.lat,
                      longitude: marker.lng
                    }}
                    title={marker.name}
                    description={marker.description}
                  />
                ))}
              </MapView>
            </View>
            :
            <View>
              <View style={style.scrollView}>
                {
                  this.state.events ?
                    <ScrollView>
                      {
                        this.state.events.map(event => {
                          return (
                            <EventItem key={event.id} event={event}/>
                          )
                        })
                      }
                    </ScrollView>
                    :
                    <Text>No Data to display!</Text>
                }
              </View>
            </View>
        }
      </View>

    )
  }
}

export default EventsListing;