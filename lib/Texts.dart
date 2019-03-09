class Texts {
  static bool isMaltese;

  static void initialise(bool maltese) {
    isMaltese = maltese;
  }

  static String openApp() {
    return isMaltese ? Maltese.openApp : English.openApp;
  }

  static String openFriends() {
    return isMaltese ? Maltese.openApp : English.openApp;
  }

  static String openEvents() {
    return isMaltese ? Maltese.openApp : English.openApp;
  }

  static String openPuzzles() {
    return isMaltese ? Maltese.openApp : English.openApp;
  }

  static String openSOS() {
    return isMaltese ? Maltese.openApp : English.openApp;
  }
}

class Maltese {
  static const String openApp = "", openEvents = "", openPuzzles = "", openFriends = "", openSOS = "";
}

class English {
  static const String openApp = "", openEvents = "", openPuzzles = "", openFriends = "", openSOS = "";
}
