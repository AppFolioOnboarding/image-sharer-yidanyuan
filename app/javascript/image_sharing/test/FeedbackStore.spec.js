import 'jsdom-global/register';
import React from 'react';
import { expect } from 'chai';
import FeedbackStore from '../stores/FeedbackStore';

describe('FeedbackStore', () => {
  it('should set user name', () => {
    const store = new FeedbackStore();
    store.setUserName('User01');
    expect(store.user_name).to.equal('User01');
  });

  it('save comment success', () => {
    const store = new FeedbackStore();
    store.setComment('comments');
    expect(store.comment).to.equal('comments');
  });

  it('should set response', () => {
    const store = new FeedbackStore();
    store.setResponse('success', 'message');
    expect(store.response.status).to.equal('success');
    expect(store.response.message).to.equal('message');
  });
});
