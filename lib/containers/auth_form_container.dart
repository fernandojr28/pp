import 'package:pp/models/app_state.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:pp/redux/actions/actions.dart';
//import 'package:flutter/foundation.dart';

class AuthFormContainer extends StatelessWidget {

  const AuthFormContainer({Key? key, required this.builder}) : super(key: key);

  //final Widget Function(BuildContext context, _ViewModel vm) builder;

  
  final Widget Function(BuildContext context, _ViewModel vm) builder;


  @override
  Widget build(BuildContext context) {
     return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) {
        return _ViewModel.fromStore(store, context);
      },
      builder: builder,
    );
  }
}


class _ViewModel {

  _ViewModel({
    required this.signInWithGoogle,
    required this.platformException
  });

  final VoidCallback signInWithGoogle;
  final PlatformException? platformException;

  static _ViewModel fromStore(Store<AppState> store, BuildContext context) {
    return _ViewModel(
      platformException: store.state.platformException,
      signInWithGoogle: () {
        store.dispatch(SignInWithGoogleAndPasswordRequestAction());
      });
  }
}