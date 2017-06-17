import React from 'react';
import ReactDOM from 'react-dom';

export default class Setup {
  start(element) {
    ReactDOM.render(
      <h1>Hello, world!</h1>,
      element
    );
  }
}
