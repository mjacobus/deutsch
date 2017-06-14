import MultipleChoiceQuestion from './../src/MultipleChoiceQuestion'

describe('something', () => {
  let question;

  beforeEach(() => {
    question = new MultipleChoiceQuestion({
      options: ['der', 'die', 'das'],
      correctAnswer: 'die',
      question: 'Correct article for Lampe',
      hint: 'Lamp'
    });
  });

  it('returns the question', () => {
    expect(question.getQuestion()).toEqual('Correct article for Lampe');
  });

  it('returns correct answer', () => {
    expect(question.getCorrectAnswer()).toEqual('die');
  });

  it('returns options', () => {
    expect(question.getOptions()).toEqual(['der', 'die', 'das']);
  });

  it('returns hint', () => {
    expect(question.getHint()).toEqual('Lamp');
  });

  describe('isCorrect', () => {
    it('is initially false', () => {
      expect(question.isCorrect()).toEqual(false);
    });

    it('returns false when the answer is NOT correct', () => {
      question = question.setAnswer('der');

      expect(question.isCorrect()).toEqual(false);
    });

    it('returns true when the answer is correct', () => {
      question = question.setAnswer('Die');

      expect(question.isCorrect()).toEqual(true);
    });
  });
});

