enum GameState {
  lobby,
  game,
  sabotage,
  emergencyMeetingCallout,
  emergencyMeeting,
  emergencyMeetingSummary,
  gameOver,
}

extension GameStateExtension on GameState {
  static const Map<GameState, String> _names = {
    GameState.lobby: 'lobby',
    GameState.game: 'game',
    GameState.sabotage: 'sabotage',
    GameState.emergencyMeetingCallout: 'emergencyMeetingCallout',
    GameState.emergencyMeeting: 'emergencyMeeting',
    GameState.emergencyMeetingSummary: 'emergencyMeetingSummary',
    GameState.gameOver: 'gameOver',
  };

  String get name => _names[this]!;
}
