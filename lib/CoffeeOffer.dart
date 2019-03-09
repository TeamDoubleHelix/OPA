class CoffeeOffer {
  final String image, place, details, url;

  static const List<CoffeeOffer> test = [
    CoffeeOffer(
        place: "Costa",
        image:
            "https://www.festisite.com/static/partylogo/img/logos/costa-coffee.png",
        details: "Buy 3 drinks and get the fourth free!",
        url: "https://cdn.qrstuff.com/images/default_qrcode.png"),
    CoffeeOffer(
        place: "Saracino's",
        image: "https://timetoeat.com.mt/frontend/assets/images/logos/saracinos.png",
        details: "Buy one get one free on all lunch menu items!",
        url: "https://cdn.qrstuff.com/images/default_qrcode.png"),
    CoffeeOffer(
        place: "Vecchia Napoli",
        image:
            "http://skyparksmain.blob.core.windows.net/wp-uploads/wp-content/uploads/2016/07/vecchia-napoli-1.png",
        details: "Buy 2 pizza and get a free dessert!",
        url: "https://cdn.qrstuff.com/images/default_qrcode.png")
  ];

  const CoffeeOffer({this.place, this.image, this.details, this.url});
}
