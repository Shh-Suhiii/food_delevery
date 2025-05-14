import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery2/models/cart_item.dart';

import 'Food.dart';

class Restaurant extends ChangeNotifier {
  // list of food menu
  final List<Food> _menu = [
    // burgersf
    Food(
      name: 'Classic Cheeseburger',
      description:
          " A juicy patty with melted cheddar, lettuce, and tomato, and a hint of onion and pickle.",
      imagePath: "assets/burger.jpg",
      price: 99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "extra cheese", price: 89),
        Addon(name: 'bacon', price: 79),
        Addon(name: 'Avacado', price: 121),
      ],
    ),
    Food(
      name: 'Spicy Chicken Burger',
      description:
          "Grilled chicken patty infused with Indian spices, topped with lettuce and spicy mayo.",
      imagePath: "assets/burger.jpg",
      price: 119,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "jalapenos", price: 25),
        Addon(name: 'extra spicy sauce', price: 20),
        Addon(name: 'double chicken patty', price: 70),
      ],
    ),
    Food(
      name: 'Paneer Tikka Burger',
      description:
          "Soft paneer tikka pieces grilled to perfection with mint chutney and crispy onions.",
      imagePath: "assets/burger.jpg",
      price: 109,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "extra paneer", price: 40),
        Addon(name: 'cheese slice', price: 25),
        Addon(name: 'green chutney', price: 15),
      ],
    ),
    Food(
      name: 'Double Trouble Burger',
      description:
          "Two juicy patties stacked with cheese, onions, pickles, and our special smoky sauce.",
      imagePath: "assets/burger.jpg",
      price: 159,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "triple patty", price: 60),
        Addon(name: 'onion rings', price: 30),
        Addon(name: 'egg', price: 20),
      ],
    ),
    Food(
      name: 'Maharaja Veg Burger',
      description:
          "Royal Indian-style burger with a large crispy veg patty, onion rings, and spicy mayo.",
      imagePath: "assets/burger.jpg",
      price: 129,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "extra veg patty", price: 35),
        Addon(name: 'chipotle dip', price: 20),
        Addon(name: 'cheese burst', price: 45),
      ],
    ),

    // salads
    Food(
      name: 'Greek Salad',
      description:
          "Fresh cucumbers, tomatoes, olives, red onions, and feta cheese tossed in olive oil.",
      imagePath: "assets/salads.jpg",
      price: 79,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "extra feta", price: 20),
        Addon(name: 'olives', price: 15),
        Addon(name: 'boiled egg', price: 25),
      ],
    ),

    Food(
      name: 'Caesar Salad',
      description:
          "Crispy romaine lettuce, parmesan cheese, croutons, and creamy Caesar dressing.",
      imagePath: "assets/salads.jpg",
      price: 89,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "grilled chicken", price: 40),
        Addon(name: 'extra croutons', price: 10),
        Addon(name: 'boiled egg', price: 25),
      ],
    ),

    Food(
      name: 'Fruit & Nut Salad',
      description:
          "A mix of seasonal fruits, walnuts, almonds, and a drizzle of honey-lemon dressing.",
      imagePath: "assets/salads.jpg",
      price: 99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "extra nuts", price: 30),
        Addon(name: 'chia seeds', price: 15),
        Addon(name: 'yogurt topping', price: 20),
      ],
    ),

    Food(
      name: 'Indian Chana Salad',
      description:
          "Boiled chickpeas mixed with onions, tomatoes, coriander, and tangy masala.",
      imagePath: "assets/salads.jpg",
      price: 59,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "lemon juice", price: 5),
        Addon(name: 'boiled potato cubes', price: 10),
        Addon(name: 'green chillies', price: 5),
      ],
    ),

    Food(
      name: 'Protein Power Salad',
      description:
          "A high-protein mix of sprouts, kidney beans, tofu, and crunchy veggies with light dressing.",
      imagePath: "assets/salads.jpg",
      price: 109,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "extra tofu", price: 25),
        Addon(name: 'quinoa', price: 30),
        Addon(name: 'boiled egg', price: 25),
      ],
    ),

    // sides
    Food(
      name: 'French Fries',
      description:
          "Crispy golden potato fries served with tangy tomato ketchup.",
      imagePath: "assets/sides.jpg",
      price: 59,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "cheese sauce", price: 20),
        Addon(name: 'peri peri seasoning', price: 10),
        Addon(name: 'extra fries', price: 40),
      ],
    ),

    Food(
      name: 'Onion Rings',
      description: "Deep-fried crispy onion rings served with spicy dip.",
      imagePath: "assets/sides.jpg",
      price: 69,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "extra dip", price: 15),
        Addon(name: 'cheese drizzle', price: 25),
        Addon(name: 'jalapenos', price: 15),
      ],
    ),

    Food(
      name: 'Garlic Bread',
      description: "Toasted bread slices loaded with garlic butter and herbs.",
      imagePath: "assets/sides.jpg",
      price: 79,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "mozzarella cheese", price: 30),
        Addon(name: 'chilli flakes', price: 10),
        Addon(name: 'stuffed version', price: 40),
      ],
    ),

    Food(
      name: 'Cheesy Nachos',
      description:
          "Crispy nacho chips topped with melted cheese and jalapenos.",
      imagePath: "assets/sides.jpg",
      price: 99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "sour cream", price: 20),
        Addon(name: 'extra cheese', price: 25),
        Addon(name: 'guacamole', price: 30),
      ],
    ),

    Food(
      name: 'Veg Nuggets',
      description: "Crunchy veggie nuggets served with creamy mayo dip.",
      imagePath: "assets/sides.jpg",
      price: 89,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "cheese filling", price: 20),
        Addon(name: 'spicy dip', price: 15),
        Addon(name: 'extra 4 nuggets', price: 40),
      ],
    ),

    // drinks
    Food(
      name: 'Classic Lemonade',
      description:
          "Refreshing homemade lemonade with a twist of mint and rock salt.",
      imagePath: "assets/drinks.jpg",
      price: 49,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "extra lemon", price: 5),
        Addon(name: 'mint leaves', price: 5),
        Addon(name: 'ice cubes', price: 0),
      ],
    ),

    Food(
      name: 'Mango Smoothie',
      description:
          "Chilled mango smoothie blended with milk and a hint of cardamom.",
      imagePath: "assets/drinks.jpg",
      price: 79,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "chia seeds", price: 10),
        Addon(name: 'dry fruits', price: 15),
        Addon(name: 'extra mango pulp', price: 20),
      ],
    ),

    Food(
      name: 'Cold Coffee',
      description: "Creamy cold coffee served with a swirl of chocolate syrup.",
      imagePath: "assets/drinks.jpg",
      price: 69,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "ice cream scoop", price: 30),
        Addon(name: 'extra coffee shot', price: 15),
        Addon(name: 'whipped cream', price: 20),
      ],
    ),

    Food(
      name: 'Strawberry Milkshake',
      description:
          "Rich strawberry milkshake with a touch of vanilla and fresh fruit pieces.",
      imagePath: "assets/drinks.jpg",
      price: 89,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "extra strawberries", price: 15),
        Addon(name: 'ice cream', price: 25),
        Addon(name: 'sprinkles', price: 10),
      ],
    ),

    Food(
      name: 'Masala Chaas',
      description:
          "Traditional Indian buttermilk with roasted cumin, coriander, and green chilli.",
      imagePath: "assets/drinks.jpg",
      price: 39,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "extra masala", price: 5),
        Addon(name: 'mint leaves', price: 5),
        Addon(name: 'boondi', price: 10),
      ],
    ),
  ];

  // GETTERS

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  // OPEREATIONSS

  //  user cart

  final List<CartItem> _cart = [];

  // add to cart

  void addtoCart(Food food, List<Addon> selectedAddons) {
    // see if there is a cart already with the same food amd slected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;

      //check if the list of selected addons are the same
      bool isSameAddons = ListEquality().equals(
        item.selectedAddons,
        selectedAddons,
      );

      return isSameFood && isSameAddons;
    });
    // if item already exists , increasee its quanitity
    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(
        CartItem(food: food, selectedAddons: selectedAddons, quantity: 1),
      );
    }
    notifyListeners();
  }

  //  remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // get total price from cart

  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  // get total number of items in cart
  int getTotalItemCount() {
    int totoalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totoalItemCount += cartItem.quantity;
    }
    return totoalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // HELPERSSS

  //  gemeretes a receipt

  // fomrat double value into money

  // format list of addons into a string summary
}
