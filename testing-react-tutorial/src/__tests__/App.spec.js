import React from 'react';
import { create } from 'react-test-renderer';
import Button from '../Button'


describe('Button component', () => {
//   test('Matches the snapshot', () => {
//     const button = create(<Button />);
//     expect(button.toJSON()).toMatchSnapshot();
//   });

  test('it shows the expected text when clicked (testing the wrong way!)', () => {
    const component = create(<Button text="SUBSCRIBE TO BASIC"/>)
    const instance = component.getInstance()
    expect(instance.state.text).toBe('')
  });

});
