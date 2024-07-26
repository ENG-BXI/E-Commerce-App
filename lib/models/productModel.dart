class Productmodel {
  late int id;
  late double price;
  late double oldPrice;
  late int discount;
  late String image;
  late String name;
  late String description;
  late List<String> images;
  late bool inFavorites;
  late bool inCart;

  Productmodel(
      {required this.id,
      required this.price,
      required this.oldPrice,
      required this.discount,
      required this.image,
      required this.name,
      required this.description,
      required this.images,
      required this.inFavorites,
      required this.inCart});

  Productmodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = double.parse(json['price'].toString());
    oldPrice = double.parse(json['old_price'].toString()) ;
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'].cast<String>();
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    data['old_price'] = oldPrice;
    data['discount'] = discount;
    data['image'] = image;
    data['name'] = name;
    data['description'] = description;
    data['images'] = images;
    data['in_favorites'] = inFavorites;
    data['in_cart'] = inCart;
    return data;
  }
}
