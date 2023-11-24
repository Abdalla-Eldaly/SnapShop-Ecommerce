
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:snapshop_ecommerce_app/provider/Provider.dart';
import 'package:snapshop_ecommerce_app/ui/common/product/productDetails/productDetails.dart';
import 'package:snapshop_ecommerce_app/ui/homeFragmentation/homePage/DetailsViewAll/DetailsViewAll.dart';
import 'package:snapshop_ecommerce_app/ui/homeFragmentation/homePage/HomeScreen.dart';
import 'package:snapshop_ecommerce_app/ui/homeFragmentation/homePage/HomeTab/HomeTab.dart';

import 'data/database/firebase_options.dart';
import 'di/di.dart';
import 'my_theme.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        // Add other providers here if needed
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SnapShop',
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.transparent),
        appBarTheme: const AppBarTheme(
          toolbarHeight: 100,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: MyTheme.primaryColor,
            size: 30,
          ),
        ),
        primaryColor: MyTheme.discountColor,
        textTheme: const TextTheme(
            labelLarge: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: MyTheme.primaryColor),
            labelMedium: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: MyTheme.primaryColor),
            labelSmall: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: MyTheme.primaryColor),
            bodyMedium: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: MyTheme.primaryColor)),
      ),
      routes: {
        HomeTab.routeName: (_) => HomeTab(),
        HomeScreen.routeName: (_) => HomeScreen(),
        ProductDetails.routeName: (_) => ProductDetails(),
        ViewAll.routeName: (_) => ViewAll(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
