import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { inject } from 'mobx-react';
import FeedbackForm from './FeedbackForm';
import Header from './Header';
import Footer from "./Footer";

class App extends Component {
  /* Add Prop Types check*/
  static propTypes = {
    stores: PropTypes.object.isRequired
  };

  render() {
    const feedbackStore = this.props.stores.feedbackStore;
    return (
      <div>
        <Header title={'Tell us what you think'} />
        <FeedbackForm store={feedbackStore} />
        <Footer />
      </div>
    )
  }
}

export default inject(
  'stores'
)(App);
