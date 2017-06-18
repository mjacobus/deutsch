const setup = new App.Setup();
const targetElement = document.getElementById('app')
let json = targetElement.dataset.nouns;

// TODO: Either get data via ajax, or pass correct json to data-attribute
json = JSON.parse(json);
json = JSON.parse(json);

questions = [
  {
    noun: 'some word',
    article: 'das',
    translation: 'foo1',
  },
  {
    noun: 'some word',
    article: 'der',
    translation: 'foo1',
  }
];

setup.articlesTest(
  // questions,
  json,
  targetElement
);
