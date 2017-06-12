export default class MultipleChoiceQuestion {
  constructor(options) {
    this._question = options.question;
    this._correctAnswer = options.correctAnswer;
    this._options = options.options;
    this._hint = options.hint;
    this._answer = null;
  }

  getQuestion() {
    return this._question;
  }

  getCorrectAnswer() {
    return this._correctAnswer;
  }

  getOptions() {
    return this._options;
  }

  getHint() {
    return this._hint;
  }

  setAnswer(answer) {
    this._answer = answer;
    return this;
  }

  isCorrect() {
    const givenAnswer = (this._answer + '').toLowerCase();
    const correctAnswer = this.getCorrectAnswer().toLowerCase();
    return correctAnswer === givenAnswer;
  }
}
