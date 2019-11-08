import 'jsdom-global/register';
import React from 'react';
import { shallow, configure } from 'enzyme';
import { expect } from 'chai';
import Footer from '../components/Footer';
import Adapter from 'enzyme-adapter-react-16';
configure({ adapter: new Adapter() });

describe('<Footer />', () => {
  it('render in Footer.js success', () => {
    const wrapper = shallow(
      <Footer />
    );
    const footer = wrapper.find('h3');
    expect(footer.text()).to.equal('This is a footer!');
  })
});

