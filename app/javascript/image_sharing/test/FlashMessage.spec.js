import 'jsdom-global/register';
import React from 'react';
import { shallow, configure } from 'enzyme';
import { expect } from 'chai';
import { Alert } from 'reactstrap';
import Adapter from 'enzyme-adapter-react-16';
import FlashMessage from '../components/FlashMessage';

configure({ adapter: new Adapter() });

describe('<FlashMessage />', () => {
  it('flash message success', () => {
    const feedbackStore = {
      response: {
        status: 'success',
        message: 'store data successfully'
      }
    };
    const wrapper = shallow(<FlashMessage store={feedbackStore} />);
    const alert = wrapper.find(Alert);
    expect(alert).to.have.length(1);
  });
});
