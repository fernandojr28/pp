import 'package:pp/presentation/auth/auth_screen.dart';
import 'package:pp/presentation/home_screen.dart';
import 'package:pp/presentation/message_detail_screen.dart';
//import 'package:pp/presentation/print_voucher_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pp/models/app_state.dart';

class AppRoutes{
  static const auth = "/"; //auth/
  static const home = "/home";
  static const messageDetail = "/message";
  static const printVoucher = "/print";
}

Map<String, WidgetBuilder> getRoutes(context, store){
  return {
    
    AppRoutes.auth: (BuildContext context) => StoreBuilder<AppState>(
      builder: (context, store) => const AuthScreen()
    ),
    AppRoutes.home: (BuildContext context) => StoreBuilder<AppState>(
      builder: (context, store) => const HomeScreen()
    )
  };
}

MaterialPageRoute getGenerateRoute(RouteSettings settings) {

  if (isPathNameWithRoute(settings, AppRoutes.messageDetail)) {
    final String messageId = getIdByPath(settings);
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => StoreBuilder<AppState>(
        builder: (context, store) => MessageDetailScreen(messageId: messageId),
      ),
    );
  }

  /*if (isPathNameWithRoute(settings, AppRoutes.printVoucher)) {
    final String messageId = getIdByPath(settings);
    return MaterialPageRoute<Void>(
      settings: settings,
      builder: (BuildContext context) => StoreBuilder<AppState>(
        builder: (context, store) => PrintVoucherScreen(messageId: messageId),
      ),
    );
  }*/

  return MaterialPageRoute(
    builder: (_) => Scaffold(
      body: Center(
          child: Text('No route defined for ${settings.name}')),
    ));
    
}


bool isPathNameWithRoute(RouteSettings settings, String pathName) {
  final String uri = settings.name ?? "";
  final List<String> path = uri.split('/');
  final List<String> pathScreen = pathName.split('/');
  if (path[0] != '' || pathScreen[0] != '') return false;
  if (path[1].startsWith(pathScreen[1])) {
    if (path.length != 3) return false;
    return true;
  }
  return false;
}

String getIdByPath(RouteSettings settings) {
  final String uri = settings.name ?? "";
  final List<String> path = uri.split('/');
  return path[2] != "null" ? path.last : "___";
}