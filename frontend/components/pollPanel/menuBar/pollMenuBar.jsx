var React = require('react');
var PollMenuBarIndex = require('./pollMenuBarIndex');
var PollSearch = require('./pollSearch');
var CheckPolls = require('./checkPolls');
var LockUnlock = require('./lockUnlock');
var GroupUngroup = require('./groupUngroup');

var NavBar = React.createClass({

  render: function() {
    return (
      <div className="btn-toolbar">
        <nav className="poll-panel-menu-bar group">
          <CheckPolls polls={this.props.polls}/>
          <LockUnlock />
          <GroupUngroup />
          <PollSearch />
        </nav>
      </div>
    );
  }

});

module.exports = NavBar;
