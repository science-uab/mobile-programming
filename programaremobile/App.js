// Sicoe Mihai Alexandru
// mitza.al@gmail.com 
// MIT license

import React, { Component } from 'react';
import { Platform, StyleSheet, Text, View, Button} from 'react-native';
import Config from 'react-native-config';
import ArticleList from './src/components/ArticleList/ArticleList';
import ArticleSingle from './src/components/ArticleSingle/ArticleSingle';
import Header from './src/components/Header/Header';

export default class App extends Component {

  state = {
    api: Config.LOCALE_API,
    data:[],
    initialPosition: 'unknown',
    selectedArticle: null,
    page: 0,
    location: null,
  }

  getCountyFromLocation = async(position) => {
    const requestParamsString = "lat=" +position.coords.latitude + "&lon=" + position.coords.longitude;
    const response = await fetch(Config.OMSV_API + requestParamsString)
    const locationData = await response.json();

    await this.fetchDataBasedOnRawLocation(locationData.address);
    await this.setState({
      location: locationData.address.county
    });
    return locationData;
  }

  handleLocationObtained = (initialPosition) => {
    this.setState({ initialPosition });
  };

  handleLocationExists = () => {
    this.fetchDataBasedOnRawLocation({county: this.state.location});
  }

  fetchData = () => {
    if (this.state.location === null) {
      const location = navigator.geolocation.getCurrentPosition(
        (position) => {
           const initialPosition = position;
           this.handleLocationObtained(this.getCountyFromLocation(initialPosition));
        },
        (error) => alert(error.message),
        { enableHighAccuracy: false, timeout: 20000, maximumAge: 1000 }
     )
    } else {
      this.handleLocationExists();
    }

  };

  fetchDataBasedOnRawLocation = async(locationData) => {
    alert(locationData.county);

    const response = await fetch(Config.LOCALE_API + 'api/article/all?location=' + locationData.county + '&page=' + this.state.page)
    const articles = await response.json();
    this.setState({data:articles});    
  };

  componentDidMount() {
    this.fetchData();
  }

  alertMe = () => {
    alert(Config.LOCALE_API);
    alert(this.state.data[0].title);
  }

  articleSelectHandler = key => {
    this.setState(prevState => {
      return {
        selectedArticle: prevState.data.find(article => {
          return article.id === key;
        })
      };
    });
  };

  handleModalClose = () => {
    this.setState({
      selectedArticle: null
    })
  }

  nextPageHandler = async () => {
    await this.setState((prevState) => {
      return {
        page: prevState.page + 1
      }
    });
    await this.fetchData();
  }

  prevPageHandler = async () => {
    await this.setState((prevState) => {
      return {
        page: prevState.page - 1
      }
    });
    await this.fetchData();
  }

  handleAppRefresh = () => {
    this.fetchData();
  }

  render() {
    return (
      <View style={styles.container}>
        <ArticleSingle
          onModalClosed={this.handleModalClose}
          selectedArticle={this.state.selectedArticle}
        />

        <Header 
          page={this.state.page}
          onNextPage = {this.nextPageHandler}
          onPrevPage = {this.prevPageHandler}
          onAppRefresh = {this.handleAppRefresh}
        />
      
        <ArticleList
          articles={this.state.data}
          onItemSelected={this.articleSelectHandler} />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'black',
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});
