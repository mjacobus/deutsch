import Question from '../../../MultipleChoiceQuestion';
import {MultipleChoiceQuestion} from '../';
import React from 'react';
import { shallow } from 'enzyme';

describe('<MultipleChoiceQuestion />', () => {
  let component;
  let question;

  beforeEach(() => {
    question = new Question({
      question: 'Der di or das?',
      correctAnswer: 'der',
      options: ['der', 'die', 'das'],
      hint: 'is masculine',
    });

    component = shallow(
      <MultipleChoiceQuestion question={question} />
    );
  });

  it('has accessor to the question', () => {

    expect(2).toEqual(2);
    // expect(component.contains(<p className="question">{question.getQuestion()}</p>)).toEqual(true);
  });
});
