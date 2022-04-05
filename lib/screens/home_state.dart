abstract class CountState {
  CountState();
}

class CountInitial extends CountState {
  CountInitial();
}

class ChangeCount extends CountState {
  ChangeCount();
}

class ChangeError extends CountState {
  ChangeError();
}
