var Dispatcher = require('../dispatcher');
var QuestionConstants = require('../constants/questionConstants.js');
var ApiUtil = require('../util/apiUtil.js');

var PresentationActions = {
  // Read
  receiveSinglePresentation: function (question) {
    Dispatcher.dispatch({
      actionType: QuestionConstants.PRESENTATION_RECEIVED,
      question: question
    });
  },

  fetchPresentation: function(username, callback) {
    var callbacks = [PresentationActions.receiveSinglePresentation, callback];
    ApiUtil.fetchPresentationForUser(username, callbacks);
  },
};

module.exports = PresentationActions;
