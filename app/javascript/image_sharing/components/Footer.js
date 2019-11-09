import React, { Component } from 'react';
import { Row, Col } from 'reactstrap';

class Footer extends Component {
  render() {
    return (
      <div>
        <Row>
          <Col lg={{ size: 4, offset: 4 }}>
            <h6 className='text-center'>
              &copy; Appfolio Inc., 2019
            </h6>
          </Col>
        </Row>
      </div>
    );
  }
}

export default Footer;
