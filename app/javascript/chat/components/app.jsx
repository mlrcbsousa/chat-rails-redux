import React from 'react';
import ChannelList from '../containers/channel_list';
import MessageList from '../containers/message_list';

const App = ({ match }) => {
  return (
    <div className="messaging-wrapper">
      <div className="logo-container">
        <img className="messaging-logo" src="https://raw.githubusercontent.com/lewagon/fullstack-images/master/uikit/logo.png" alt="logo" />
      </div>
      <ChannelList channel={match.params.channel} />
      <MessageList channel={match.params.channel} />
    </div>
  );
};

export default App;
