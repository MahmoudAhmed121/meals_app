import 'package:counter_two/features/home/database/db_helper.dart';
import 'package:counter_two/features/home/models/meal_model.dart';
import 'package:counter_two/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 
  DatabaseHelper databaseHelper = DatabaseHelper();
  MealModel burgerModel = MealModel(
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSc0CP3KOXcs5-Fjf4ZlS3YiWBb_a3Mmg7M7g&s',
    name: "burger",
    description: "Sink your teeth into our delicious Burger Meal – a mouthwatering combo that hits the spot every time! Enjoy a juicy, flame-grilled beef patty topped with melted cheese, crisp lettuce, ripe tomatoes, and our signature sauce, all nestled in a soft, toasted bun. Served with a side of golden, crispy fries and a refreshing soda to complete the perfect meal.",
    rate: 4.3,
    time: '5 - 10',
  );
  
   MealModel pizzaModel = MealModel(
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIibPbOeDQQscm9g-fDNdCvROokQJukg8nYQ&s',
    name: "pizza",
    description: "Indulge in our Ultimate Pizza Feast – a perfect blend of crispy crust, rich tomato sauce, and gooey melted cheese, loaded with your favorite toppings! Choose from classic Margherita, spicy Pepperoni, savory BBQ Chicken, or a loaded Veggie Delight. Each slice is packed with flavor, baked to golden perfection, and best enjoyed hot & fresh!",
    rate: 5.0,
    time: '10 - 15',
  );

   MealModel koshariModel = MealModel(
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMoS1nSH6WqxOE4-hInBqvQMTiwwyCERaaUw&s',
    name: "Koshari",
    description: "Savor the authentic taste of Egypt’s beloved Koshari – a hearty mix of golden rice, pasta, crispy lentils, and chickpeas, topped with a rich tomato sauce and caramelized onions. Spiced to perfection with garlic, vinegar, and a dash of chili for that iconic flavor explosion in every bite!",
    rate: 4.0,
    time: '2 - 5',
  );
  
 await databaseHelper.insertMeal(burgerModel);
 await databaseHelper.insertMeal(pizzaModel);
 await databaseHelper.insertMeal(koshariModel);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
