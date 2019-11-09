import 'jsdom-global/register';
import React from 'react';
import { shallow, configure } from 'enzyme';
import { expect } from 'chai';
import Adapter from 'enzyme-adapter-react-16';
import Footer from '../components/Footer';


configure({ adapter: new Adapter() });

describe('<Footer />', () => {
  it('render in Footer.js success', () => {
    const wrapper = shallow(<Footer />);
    const footer = wrapper.find('h6');
    expect(footer.text()).to.to.contain('Appfolio Inc., 2019');
  });
});

