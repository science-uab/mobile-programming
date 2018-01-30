/**
 * @author Malai Mihai
 * @email trmmsob@gmail.com
 * @licence MIT
 */
import React, { Component } from 'react';
import { StackNavigator } from 'react-navigation';
import EventsListing from "./screens/EventsListing"

const EventsListingApp = StackNavigator({
  Home: { screen: EventsListing}
})

export default class App extends Component<{}> {
  render() {
    return (
      <EventsListingApp/>
    );
  }
}
