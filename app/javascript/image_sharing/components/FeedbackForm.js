import React, { Component } from 'react';
import { Button, Input, Form, Label, FormGroup, Col } from 'reactstrap';
import PropTypes from 'prop-types';
import PostFeedbackService from '../services/PostFeedbackService';

class FeedbackForm extends Component {
  static propTypes = {
    store: PropTypes.object.isRequired
  };

  onClickHandler = (e) => {
    const params = {
      userName: this.props.store.userName,
      comment: this.props.store.comment
    };
    const service = new PostFeedbackService(this.props.store, params);
    return service.postFeedback();
  };

  render() {
    return (
      <Form>
        <Col lg={{ size: 4, offset: 4 }}>
          <FormGroup>
            <Label> User Name </Label>
            <Input
              className='js-username'
              type="text"
              placeholder="Please enter your user name"
              onChange={e => this.props.store.setUserName(e.target.value)}
            />
          </FormGroup>
          <FormGroup>
            <Label> Comments </Label>
            <Input
              className='js-comments'
              type="textarea"
              placeholder="Please enter your comment"
              onChange={e => this.props.store.setComment(e.target.value)}
            />
          </FormGroup>
          <Button type="button" onClick={this.onClickHandler}>Post</Button>
        </Col>
      </Form>
    );
  }
}

export default FeedbackForm;
