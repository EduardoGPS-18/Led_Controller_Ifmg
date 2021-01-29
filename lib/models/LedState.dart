class LedState {
  bool _ledState = false;

  void ledInvert() => _ledState = !ledState;
  void ledOff() => _ledState = false;
  void ledOn() => _ledState = true;

  get ledState => _ledState;
}
