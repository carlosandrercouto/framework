import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'features/login/presentation/ui/screens/login_screen.dart';
import 'features/store/presentation/ui/screens/shopping_cart_screen.dart';
import 'features/store/presentation/ui/screens/store_screen.dart';

Map<String, dynamic> routes = <String, dynamic>{
  'login': (args) => LoginScreen(),
  'store': (args) => StoreScreen(),
  'shoppingCart': (ShoppingCartScreenArguments args) => ShoppingCartScreen(productsCartList: args.productsCartList),
};

List<String> routesRoutedByCupertino = [];

Function router = (settings, screen) => routesRoutedByCupertino.contains(settings.name)
    ? buildCupertinoPageRoute(settings, screen)
    : buildMaterialPageRoute(settings, screen);

Route getRoute(RouteSettings settings) {
  if (routes.containsKey(settings.name)) {
    return router(settings, routes[settings.name](settings.arguments));
  }
  return buildMaterialPageRoute(settings, LoginScreen());
}

MaterialPageRoute buildMaterialPageRoute(RouteSettings settings, dynamic builder) {
  return MaterialPageRoute(settings: settings, builder: (context) => builder);
}

CupertinoPageRoute buildCupertinoPageRoute(RouteSettings settings, dynamic builder) {
  return CupertinoPageRoute(settings: settings, builder: (context) => builder);
}
