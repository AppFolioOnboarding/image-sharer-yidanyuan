import 'jsdom-global/register';
import React from 'react';
import { shallow, configure } from 'enzyme';
import { expect } from 'chai';
import Adapter from 'enzyme-adapter-react-16';
import App from '../components/App';
import Header from '../components/Header';
import Footer from '../components/Footer';
import FeedbackForm from '../components/FeedbackForm';
import FlashMessage from '../components/FlashMessage';

configure({ adapter: new Adapter() });

describe('<App />', () => {
  it('render in App.js success', () => {
    const feedbackStores = {
      feedbackStore: {}
    };
    const wrapper = shallow(<App.wrappedComponent stores={feedbackStores} />);
    const header = wrapper.find(Header);
    const footer = wrapper.find(Footer);
    const flashMessage = wrapper.find(FlashMessage);
    const form = wrapper.find(FeedbackForm);

    expect(header).to.have.length(1);
    expect(footer).to.have.length(1);
    expect(flashMessage).to.have.length(1);
    expect(form).to.have.length(1);
  });
});
