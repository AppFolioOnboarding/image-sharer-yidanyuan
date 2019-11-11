import 'jsdom-global/register';
import React from 'react';
import { shallow, configure } from 'enzyme';
import { expect } from 'chai';
import FeedbackForm from '../components/FeedbackForm';
import { Form, Button, Input } from 'reactstrap';
import FeedbackStore from '../stores/FeedbackStore';
import Adapter from 'enzyme-adapter-react-16';
import sinon from 'sinon';
configure({ adapter: new Adapter() });

describe('<FeedbackForm />', () => {
  let feedbackStore = new FeedbackStore();

  it('render feedback form success with both valid inputs', () => {
    feedbackStore.userName = 'Yidan';
    feedbackStore.comments = 'test comment valid input';

    const wrapper = shallow(<FeedbackForm store={feedbackStore} />);

    const form = wrapper.find(Form);

    expect(form).to.have.length(1);

    const userNameInput = form.find(Input).at(0);
    expect(userNameInput.props()).to.deep.equal({
      className: 'js-username',
      type: 'text',
      placeholder: 'Please enter your user name'
    });

    const commentsInput = form.find(Input).at(1);
    expect(commentsInput.props()).to.deep.equal({
      className: 'js-comments',
      type: 'textarea',
      placeholder: 'Please enter your comment'
    });

    const button = form.find(Button);
    expect(button).to.have.length(1);
  })
});
