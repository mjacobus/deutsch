import React from 'react';

export default class MultipleChoiceQuestion extends React.Component {
  constructor(props) {
    super(props)
    this.question = props.question;

    this.state = {
      showHint: false,
      answer: null
    }
  }

  render() {
    let question = this.question;
    let options = question.getOptions().map((value, index) => {
      return this.renderOption(value, index);
    });

    return (
      <div className="question-container question-multiple-choice">
        <p className="question">{this.question.getQuestion()}</p>
        {this.renderHint()}
        <div className="options">{options}</div>
      </div>
    );
  }

  renderOption(value, index) {
    const classes = ["btn btn-default"];
    const q = this.question;

    if (q.hasAnswer() && value.toLowerCase() == q.getAnswer().toLowerCase()) {
      classes.push('chosen');
      classes.push(q.isCorrect() ? 'correct' : 'incorrect');
    }

    const extraClass = value == this.question.getAnswer() ? 'chosen' : '';

    return <a
      data-value={value}
      key={index}
      onClick={(event) => this.handleClick(event) }
      className={classes.join(' ')}>{value}</a>
  }

  renderHint() {
    if (this.state.showHint) {
      return (<p className="hint">{this.question.getHint()}</p>);
    }

    return (<a href="#" className="pull-right" onClick={(event) => this.handleHintClick(event)}><p className="hint">Gimme a hint!</p></a>);
  }

  handleClick(event) {
    event.preventDefault();
    const answer = event.target.dataset.value;
    this.question.setAnswer(answer);
    this.setState({answer});
    console.log('Correct Answer:', this.question.getCorrectAnswer());
  }

  handleHintClick(event) {
    event.preventDefault();
    this.setState({showHint: true});
  }
}
