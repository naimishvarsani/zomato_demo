import 'package:zomato/Helper/utility.dart';

final List<String> options = [
  "Pro",
  "Rating: 4.0+",
  "Max Saftey",
  "Fastest Delivery",
  "Offers",
  "TakeAway",
  "Popular"
];

class FoodItems {
  String name, image;

  FoodItems({required this.name, required this.image});
}

class Restaurants {
  String image, title, dishname, rating, price;

  Restaurants(
      {required this.image,
      required this.dishname,
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
      dishname: "Cheese Chips",
      price: "100",
      rating: "4.2",
      image: AssetsPath.image + 'chips.jpg'),
  Restaurants(
      title: "The Continental",
      dishname: "Continental Food",
      price: "300",
      rating: "4.1",
      image: AssetsPath.image + 'continetal.jpg'),
  Restaurants(
    title: "Domino's Pizza",
    dishname: "Pizza",
    price: "150",
    rating: "4.1",
    image: AssetsPath.image + 'pizza.jpg',
  ),
  Restaurants(
    title: "MCDonald's",
    dishname: "Burger,Beverages",
    price: "150",
    rating: "4.1",
    image: AssetsPath.image + 'mcd.jpg',
  ),
  Restaurants(
    title: "Gohana Faous Jalebi",
    dishname: "Masala Roll",
    price: "100",
    rating: "4.2",
    image: AssetsPath.image + 'roll.jpg',
  ),
];
