import 'package:pp/containers/auth_form_container.dart';
import 'package:flutter/material.dart';
import 'package:pp/widgets/social_button.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN AB'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          AuthFormContainer(
           builder: (BuildContext context, vm) {
             return Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                //const SizedBox(height: 50),
                _buildSocialRow(vm.signInWithGoogle),
               ],
             );
           }
          )
        ],
      ),
    );
}

/*
Widget _buildBody() {
  return Column(
    children: [
      //_buildSocialRow()
    ],
  );
}*/

  Widget _buildSocialRow(
      VoidCallback signInWithGoogle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: SocialButton(
            icon: const Icon(
              //FontAwesomeIcons.facebookF,
              Icons.abc,
              size: 16,
              color: Colors.white,
            ),
            type: SocialType.google,
            onPressed: () => signInWithGoogle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  "|",
                  style: TextStyle(color: Colors.white38, fontSize: 12),
                ),
                SizedBox(width: 8),
                Text("Google", style: TextStyle(color: Colors.white))
              ],
            ),
          ),
        ),
        //UIHelper.horizontalSpaceMedium,
        
        
      ],
    );
  }
}
