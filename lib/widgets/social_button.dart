import 'package:pp/widgets/custom_raised_button.dart';
import 'package:flutter/material.dart';


enum SocialType { facebook, google }

class SocialButton extends CustomRaisedButton {
  const SocialButton({
    Key? key,
    required Widget child,
    Icon? icon,
    bool loading = false,
    SocialType? type,
    VoidCallback? onPressed,
  }) : super(
    key: key,
    child: child,
    height: 44.0,
    color: type == SocialType.facebook ? const Color(0xFF4267B2) : const Color(0xFFDD4B39),
    textColor: Colors.black87,
    borderRadius: 8,
    loading: loading,
    onPressed: onPressed,
    icon: icon as Icon,
  );
}