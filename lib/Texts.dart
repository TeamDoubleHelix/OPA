class Texts {
  static bool isMaltese;

  static void initialise(bool maltese) {
    isMaltese = maltese;
  }

  static String openApp() {
    return isMaltese ? Maltese.openApp : English.openApp;
  }

  static String openFriends() {
    return isMaltese ? Maltese.openFriends : English.openFriends;
  }

  static String openEvents() {
    return isMaltese ? Maltese.openEvents : English.openEvents;
  }

  static String openPuzzles() {
    return isMaltese ? Maltese.openPuzzles : English.openPuzzles;
  }

  static String openSOS() {
    return isMaltese ? Maltese.openSOS : English.openSOS;
  }

  static String parseWeekday(int day) {
    switch (day) {
      case 1:
      case 8:
        return "Monday";
      case 2:
      case 9:
        return "Tuesday";
      case 3:
      case 10:
        return "Wednesday";
      case 4:
      case 11:
        return "Thursday";
      case 5:
      case 12:
        return "Friday";
      case 6:
      case 13:
        return "Saturday";
      case 0:
      case 7:
        return "Sunday";
    }
  }
}

class Maltese {
  static const String openApp = "",
      openEvents = "",
      openPuzzles = "",
      openFriends = "",
      openSOS = "";
}

class English {
  static const String openApp = "Hello! Welcome to...",
      openEvents = "View events near you.",
      openPuzzles = "Puzzles to keep you mentally active.",
      openFriends = "Contact your friends.",
      openSOS = "Emergency contact.";
}
