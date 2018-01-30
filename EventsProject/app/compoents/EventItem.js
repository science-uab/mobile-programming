/**
 * @author Malai Mihai
 * @email trmmsob@gmail.com
 * @licence MIT
 */
import React, {Component} from 'react';
import {Text, View, Image, Dimensions, StyleSheet, TouchableOpacity, Alert} from 'react-native';
import Icon from 'react-native-vector-icons/dist/FontAwesome';
import RNCalendarEvents from 'react-native-calendar-events';

const style = StyleSheet.create({
  eventContainer: {
    flex: 1,
    backgroundColor: "#ecf0f1",
    marginTop: 10
  },
  text: {
    padding: 15
  }
});

class EventItem extends Component {
  onPressAddToCalendar() {

    RNCalendarEvents.authorizationStatus()
      .then(status => {
        RNCalendarEvents.authorizeEventStore()
          .then(status => {
            console.log(status);
            if (status === "authorized") {
              RNCalendarEvents.saveEvent(this.props.event.name, {
                location: this.props.event.location,
                notes: this.props.event.description,
                startDate: this.props.event.date,
                endDate: this.props.event.date
              })
                .then(id => {
                  Alert.alert(
                    '',
                    'Event saved successfully',
                    [
                      {text: 'OK', onPress: () => console.log('OK Pressed')},
                    ],
                    { cancelable: false }
                  )
                })
                .catch(error => {
                  console.log(error)
                });
            }
          })
          .catch(error => {
            // handle error
          });
      })
      .catch(error => {
        // handle error
      });
  }

  render() {
    return (
      <View style={style.eventContainer}>
        <Image
          style={{width: Dimensions.get('window').width, height: 200}}
          source={{uri: "https://www.eventbriz.com/wp-content/uploads/2017/09/NOWLIVE.jpg"}}
        />
        <View style={{flex: 1, flexDirection: 'row',  justifyContent: 'space-between'}}>
          <Text style={style.text}>{this.props.event.name}</Text>
          <Text style={style.text}>{this.props.event.dateCnv}</Text>
        </View>
        <View style={{borderTopColor: "black", borderTopWidth: 1, backgroundColor: "rgba(0,0,0,0.8)"}}>
          <Text style={[style.text, {color: "white"}]}>
            {this.props.event.description}
          </Text>
        </View>
        <TouchableOpacity
          style={{
            position: "absolute",
            right: 0,
            borderWidth: 1,
            alignItems: 'center',
            borderColor: "rgba(0, 0, 0, 0)",
            backgroundColor: "#d35400",
            justifyContent: 'center',
            width: 50,
            height: 50,
          }}
          onPress={() => this.onPressAddToCalendar()}
        >
          <Icon name={"calendar"} size={30} color="white"/>
        </TouchableOpacity>
      </View>
    );
  }
}
export default EventItem;
