/**
 * @author Malai Mihai
 * @email trmmsob@gmail.com
 * @licence MIT
 */
import React, { Component } from 'react';
import { Text, View } from 'react-native';
import { StatusBar } from 'react-native';

class OnBoarding extends Component<{}> {
  componentDidMount(){

  }

  render() {
    return (
      <View>
        <StatusBar backgroundColor="#1abc9c"/>
        <Text>
          OnBoarding screen!!!
        </Text>
      </View>
    )
  }
}

export default OnBoarding;
