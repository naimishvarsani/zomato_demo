import 'package:zomato/utility.dart';

class FoodItems {
  String name, image;

  FoodItems({required this.name, required this.image});
}

class Restaurants {
  String imageUrl, title, locations, rating, price;

  Restaurants(
      {required this.imageUrl,
      required this.locations,
      required this.price,
      required this.rating,
      required this.title});
}

List<FoodItems> foodItemList = [
  FoodItems(name: "Healthy", image: AssetsPath.image + 'salad.png'),
  FoodItems(name: "Pizza", image: AssetsPath.image + 'pizza-png-15.png'),
  FoodItems(name: "Burger", image: AssetsPath.image + 'burger.png'),
  FoodItems(name: "Thali", image: AssetsPath.image + 'fullthali.png'),
  FoodItems(name: "Rolls", image: AssetsPath.image + 'rolls.png'),
  FoodItems(name: "Continental", image: AssetsPath.image + 'continental.png'),
  FoodItems(name: "Shake", image: AssetsPath.image + 'shake.png'),
  FoodItems(name: "Combo", image: AssetsPath.image + 'combo.png'),
];

List<Restaurants> restaurantList = [
  Restaurants(
      title: "Om Sweet & Snacks",
      locations: "North Indian,  South Indian, Chinese",
      price: "100",
      rating: "4.2",
      imageUrl:
          "https://2rdnmg1qbg403gumla1v9i2h-wpengine.netdna-ssl.com/wp-content/uploads/sites/3/2016/05/worstSnacks-527905022-770x533-1-745x490.jpg"),
  Restaurants(
    title: "The Masala Story",
    locations: "North Indian, Mughlai, Kebab",
    price: "300",
    rating: "4.1",
    imageUrl:
        "https://c.ndtvimg.com/2020-01/a39okhfk_620_625x300_21_January_20.jpg",
  ),
  Restaurants(
    title: "Domino's Pizza",
    locations: "Pizza, Fast Food",
    price: "150",
    rating: "4.1",
    imageUrl:
        "https://www.indianhealthyrecipes.com/wp-content/uploads/2015/10/pizza-recipe-1-500x500.jpg",
  ),
  Restaurants(
    title: "MCDonald's",
    locations: "Burger, Fast Food, Beverages",
    price: "150",
    rating: "4.1",
    imageUrl:
        "https://www.newfoodmagazine.com/wp-content/uploads/mcdonalds.jpg",
  ),
  Restaurants(
    title: "Gohana Faous Jalebi",
    locations: "Street Food, Mithai",
    price: "100",
    rating: "4.2",
    imageUrl: "https://pbs.twimg.com/media/EhHIY9CWsAA9rN9.jpg",
  ),
  Restaurants(
    title: "Burger King",
    locations: "Burger, American, Desserts",
    price: "150",
    rating: "4.2",
    imageUrl:
        "https://media1.s-nbcnews.com/j/newscms/2019_21/2870431/190524-classic-american-cheeseburger-ew-207p_d9270c5c545b30ea094084c7f2342eb4.fit-2000w.jpg",
  ),
  Restaurants(
    title: "Haldiram's",
    locations: "North Indian, Mithai, South Indian",
    price: "100",
    rating: "4.0",
    imageUrl:
        "https://media.self.com/photos/5ebd7a636ed447b59b846244/4:3/w_2560%2Cc_limit/snack-plate.jpg",
  ),
];
