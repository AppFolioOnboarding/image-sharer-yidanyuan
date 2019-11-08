import React, { Component } from 'react';
import { Col } from 'reactstrap';
import { Button, Input , Form, Label, FormGroup } from 'reactstrap';
import PropTypes from 'prop-types';
import { observer } from 'mobx-react';
import { inject } from 'mobx-react';

class FeedbackForm extends Component {
  static propTypes = {
    store: PropTypes.object.isRequired
  };

  render() {
    return (
      <Form>
        <Col lg={{ size: 4, offset: 4 }}>
          <FormGroup>
            <Label> User Name </Label>
            <Input className='js-username' type="text" placeholder="Please enter your user name" />
          </FormGroup>
          <FormGroup>
            <Label> Comments </Label>
            <Input className='js-comments' type="textarea" placeholder ="Please enter your comment" />
          </FormGroup>
          <Button type="button" >Post</Button>
        </Col>
      </Form>
    )
  }
}

export default FeedbackForm;
