import React from 'react';
import ReactDOM from 'react-dom';
import { MultipleChoiceQuestion } from './components/questions';
import Question from './MultipleChoiceQuestion';

export default class Setup {
  articlesTest(questions, targetElement) {
    const options = ['der', 'die', 'das'];

    const nodes = questions.map((data, index)  => {
      const question = new Question({
        question: data.noun,
        correctAnswer: data.article,
        hint: data.translation,
        options: options,
      });

      return (<MultipleChoiceQuestion key={index} question={question} />);
    });

    this.renderNodes(nodes, targetElement);
  }

  renderNodes(nodes, targetElement) {
    ReactDOM.render(
      <div className="nodes container">{nodes}</div>,
      targetElement
    );
  }
}
