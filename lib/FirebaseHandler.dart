import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opa/CoffeeOffer.dart';
import 'package:opa/EventDetails.dart';
import 'package:opa/Friends.dart';

class FirebaseHandler {
  static void addEvent(EventDetails details) {
    //CollectionReference eventsCollection =
    Firestore.instance.collection("Events").add({
      "title": details.title,
      "description": details.description,
      "location": details.location,
      "organiser": details.organiser,
      "going": details.going,
      "date": DateTime.now().add(Duration(days: 2))
    });
  }

  static Future<List<Person>> getPeople() async {
    List<Person> ret = new List<Person>();

    QuerySnapshot snap =
        await Firestore.instance.collection("Users").getDocuments();
    for (int i = 0; i < snap.documents[0].data['friends'].length; i++) {
      DocumentSnapshot s = await snap.documents[0].data['friends'][i].get();
      ret.add(new Person(s.data['Name'], s.data['Phone']));
    }

    return ret;
  }

  static Future<List<CoffeeOffer>> getOffer() async {
    List<CoffeeOffer> ret = new List<CoffeeOffer>();

    QuerySnapshot snap =
        await Firestore.instance.collection("Coffee").getDocuments();
        print(snap.documents.isEmpty);

    for (int i = 0; i < snap.documents.length; i++) {
      ret.add(
        CoffeeOffer(
            place: snap.documents[i].data['Name'],
            image: snap.documents[i].data['logo'],
            details: snap.documents[i].data['Offer'],
            url: snap.documents[i].data['url']),
      );
    }

    return ret;
  }

  static Future<List<List<EventDetails>>> getEvents() async {
    List<List<EventDetails>> ret = new List(7);
    for (int i = 0; i < 7; i++) {
      ret[i] = new List<EventDetails>();
    }

    QuerySnapshot snapshot =
        await Firestore.instance.collection("Events").getDocuments();
    for (DocumentSnapshot s in snapshot.documents) {
      DateTime t = s.data['date'];
      int weekdayOfEvent = t.weekday;
      int weekdayNow = DateTime.now().weekday;

      EventDetails details = EventDetails(
        description: s.data['description'],
        going: s.data['going'].cast<String>(),
        location: s.data['location'],
        organiser: s.data['organiser'],
        title: s.data['title'],
      );

      ret[shiftN(weekdayOfEvent, weekdayNow)].add(details);
    }
    return ret;
  }

  static int shiftN(n, shifts) {
    for (int i = 0; i < shifts; i++) {
      n--;
      if (n == -1) n = 6;
    }
    return n;
  }
}
