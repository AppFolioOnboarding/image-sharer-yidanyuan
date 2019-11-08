import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { Row, Col } from 'reactstrap';


class Footer extends Component {
  render(){
    return (
      <div>
        <Row>
          <Col lg={{ size: 4, offset: 4 }}>
            <h3 className='text-center'>
              This is a footer!
            </h3>
          </Col>
        </Row>
      </div>
    );
  }
}

export default Footer;
