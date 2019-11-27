import 'jsdom-global/register';
import React from 'react';
import { mount, shallow, configure } from 'enzyme';
import { expect } from 'chai';
import { Form, Button, Input } from 'reactstrap';
import sinon from 'sinon';
import Adapter from 'enzyme-adapter-react-16';
import * as api from '../utils/helper';
import FeedbackStore from '../stores/FeedbackStore';
import FeedbackForm from '../components/FeedbackForm';

configure({ adapter: new Adapter() });

describe('<FeedbackForm />', () => {
  const feedbackStore = new FeedbackStore();

  let sandbox;

  beforeEach(() => {
    sandbox = sinon.createSandbox();
  });

  afterEach(() => {
    sandbox.restore();
  });

  it('render feedback form success with both valid inputs', () => {
    feedbackStore.userName = 'Yidan';
    feedbackStore.comments = 'test comment valid input';

    const click = () => {};
    const wrapper = shallow(<FeedbackForm store={feedbackStore} onClick={click} />);

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
  });

  it.only('call postFeedbackService success when submit the form', () => {
    const data = Promise.resolve({ message: 'message' });
    sandbox.stub(api, 'post').returns(data);

    const click = sinon.spy();
    const wrapper = mount(<FeedbackForm store={feedbackStore} onClick={click} />);
    const button = wrapper.find(Button);
    button.simulate('click');

    sinon.assert.calledOnce(api.post);
  });
});
