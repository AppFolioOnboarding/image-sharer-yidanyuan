import 'jsdom-global/register';
import React from 'react';
import sinon from 'sinon';
import * as api from '../utils/helper';
import PostFeedbackService from '../services/PostFeedbackService';

describe.only('PostFeedbackService', () => {
  let sandbox;

  beforeEach(() => {
    sandbox = sinon.createSandbox();
  });

  afterEach(() => {
    sandbox.restore();
  });

  it('post feedback success with message displayed', () => {
    const dummyStore = {
      setResponse: sinon.spy()
    };

    const data = Promise.resolve({ message: 'message' });
    sandbox.stub(api, 'post').returns(data);

    const service = new PostFeedbackService(dummyStore, {});
    return service.postFeedback().then(() => {
      sinon.assert.calledWith(dummyStore.setResponse, 'success', 'comment successfully saved!');
    });
  });

  it('post feedback message fail with message displayed for invalid input', () => {
    const dummyStore = {
      setResponse: sinon.spy()
    };

    // {data:{error: {user_name:['can\'t be blank'], comment:['can\'t be blank']}}}
    const data = Promise.reject({ data: {
      error: { user_name: ['can\'t be blank'], comment: ['can\'t be blank'] } } });
    sandbox.stub(api, 'post').returns(data);

    const service = new PostFeedbackService(dummyStore, {});
    return service.postFeedback().then(() => {
      sinon.assert.calledWith(
        dummyStore.setResponse,
        'danger', 'user_name and comment can\'t be blank'
      );
    });
  });
});
