import 'package:pp/abstract/abs.dart';
//import 'package:pp/redux/middleware/app_middleware.dart';
import 'package:pp/redux/middleware/auth_middleware.dart';
import 'package:pp/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
//import 'package:pp/redux/actions/app_actions.dart';
import 'package:pp/redux/reducers/app_state_reducer.dart';
import 'package:pp/theme.dart';
import 'package:pp/models/app_state.dart';
import 'package:pp/routes.dart';

Future<void> main({
  UserRepositoryAbs? userRepository,
  //AppRepositoryAbs? appRepository,
}) async {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  //final AppRepository appRepository = AppRepository();
  final UserRepository userRepository = UserRepository();

  runApp(MultiservicesApp(
    userRepository: userRepository,
    //appRepository: appRepository,
    navigatorKey: navigatorKey,
  ));

}

class MultiservicesApp extends StatelessWidget {

  final Store<AppState> store;
  final GlobalKey<NavigatorState> navigatorKey;

  MultiservicesApp({
    Key? key,
    required UserRepositoryAbs userRepository,
    //required AppRepository appRepository,
    required GlobalKey<NavigatorState> navigatorKey,
  }) : navigatorKey = navigatorKey,
       store = Store<AppState>(
        appReducer,
        initialState: AppState.loading(),
        middleware: [
          ...createAuthMiddleware(
          navigatorKey, UserRepository()),
          //...createAppMiddleware(AppRepository())
        ]
       ),
      super(key: key) {
        //store.dispatch(InitAppAction());
      }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        title: 'Multiservices jj',
        theme: AppTheme.theme,
        routes: getRoutes(context, store),
        onGenerateRoute: (RouteSettings settings) => getGenerateRoute(settings),
      )
    );
  }
}