var runAllCallbacks = function (callbacks, response) {
  for (var i = 0; i < callbacks.length; i++) {
    callbacks[i](response);
  }
};

module.exports = {

  fetchAllPolls: function (userId, callbacks) {
    $.ajax({
      url: "api/users/" + userId + "/polls/",
      success: function (message) {
        runAllCallbacks(callbacks, message);
      }
    });
  },

  fetchSinglePoll: function (id, callbacks) {
    $.ajax({
      url: "api/polls/" + id,
      success: function (message) {
        runAllCallbacks(callbacks, message);
      }
    });
  },

  createPoll: function (poll, callbacks) {
    $.ajax({
      url: "api/polls",
      method: "POST",
      data: {poll: poll},
      success: function (message) {
        runAllCallbacks(callbacks, message);
      }
    });
  },

  fetchAllQuestions: function (pollId, callbacks) {
    $.ajax({
      url: "api/polls/" + pollId + "/questions/",
      success: function (message) {
        runAllCallbacks(callbacks, message);
      }
    });
  },

  fetchSingleQuestion: function (questionId, callbacks) {
    $.ajax({
      url: "api/questions/" + questionId,
      success: function (message) {
        runAllCallbacks(callbacks, message);
      }
    });
  },

  createQuestion: function (pollId, question, callbacks) {
    $.ajax({
      url: "api/polls/"+pollId+"/questions",
      method: "POST",
      data: {question: question},
      success: function (message) {
        runAllCallbacks(callbacks, message);
      }
    });
  },

  fetchAllResponses: function (questionId, callbacks) {
    $.ajax({
      url: "api/questions/" + questionId + "/responses/",
      success: function (message) {
        runAllCallbacks(callbacks, message);
      }
    });
  },

  fetchSingleResponse: function (questionId, callbacks) {
    $.ajax({
      url: "api/responses/" + questionId,
      success: function (message) {
        runAllCallbacks(callbacks, message);
      }
    });
  },

  createResponse: function (questionId, response, callbacks) {
    $.ajax({
      url: "api/questions/"+questionId+"/responses",
      method: "POST",
      data: {response: response},
      success: function (message) {
        runAllCallbacks(callbacks, message);
      }
    });
  }
};
