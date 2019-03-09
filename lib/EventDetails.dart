class EventDetails {
  final String title;
  final String description;
  final String location;
  final String organiser;
  final List<String> going;

  EventDetails(
      {this.title,
      this.description,
      this.location,
      this.organiser,
      this.going});

  static List<EventDetails> eventsMonday = [
    EventDetails(
        title: "Bowling",
        description: "Bowling for everyone!",
        organiser: "Attard Council",
        location: "Eden Bowling",
        going: ["Joe", "Harry"]),
        EventDetails(
        title: "Walking",
        description: "Countryside walk and picnic!",
        organiser: "Attard Parish Church",
        location: "Ta Qali",
        going: ["Cettina", "John"])
  ];
  static List<EventDetails> eventsTuesday = [
    EventDetails(
        title: "Cooking",
        description: "Group cooking brownies! All ingredients provided.",
        organiser: "Sant Anna Over 60s",
        location: "Parish Center",
        going: ["Cettina", "George", "Harry"]),
        EventDetails(
        title: "Theatre",
        description: "Going to see the play at the theatre!",
        organiser: "Attard Parish Church",
        location: "Manoel Theatre",
        going: ["Victoria", "Earl"])
  ];
  static List<EventDetails> eventsWednesday = [
    EventDetails(
        title: "Knitting",
        description: "Beginners knitting class for everyone!",
        organiser: "Crochet Club",
        location: "Lija Bocci Club",
        going: ["Edith", "Agnes"]),
        EventDetails(
        title: "Gozo",
        description: "Day trip to gozo!",
        organiser: "Attard Parish Church",
        location: "Gozo",
        going: ["Cettina", "John", "Doris", "Lewis", "Ernest", "Bertha" ])
  ];
}
