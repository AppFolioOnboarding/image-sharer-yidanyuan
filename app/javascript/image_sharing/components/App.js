import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { inject } from 'mobx-react';
import FeedbackForm from './FeedbackForm';
import FlashMessage from './FlashMessage';
import Header from './Header';
import Footer from './Footer';

class App extends Component {
  static propTypes = {
    stores: PropTypes.object.isRequired
  };

  render() {
    const feedbackStore = this.props.stores.feedbackStore;
    return (
      <div>
        <Header title='Tell us what you think' />
        <FlashMessage store={feedbackStore} />
        <FeedbackForm store={feedbackStore} />
        <Footer />
      </div>
    );
  }
}

export default inject('stores')(App);
