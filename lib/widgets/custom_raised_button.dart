import 'package:flutter/material.dart';

@immutable
class CustomRaisedButton extends StatelessWidget {
  const CustomRaisedButton({
    Key? key,
    required this.child,
    this.icon,
    this.color,
    this.textColor,
    this.height = 50.0,
    this.borderRadius = 2.0,
    this.loading = false,
    this.onPressed,
  }) : super(key: key);

  final Widget child;
  final Icon? icon;
  final Color? color;
  final Color? textColor;
  final double height;
  final double borderRadius;
  final bool loading;
  final VoidCallback? onPressed;

  Widget buildSpinner(BuildContext context) {
    final ThemeData data = Theme.of(context);
    return Theme(
      data: data.copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white70)),
      child: const SizedBox(
        width: 28,
        height: 28,
        child: CircularProgressIndicator(
          strokeWidth: 3.0,
        ),
      ),
    );
  }

  Widget _makeWithIcon(context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: TextStyle(fontSize: 20, color: color),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
      ), // height / 2
      elevation: 0,
    );
    return ElevatedButton.icon(
      style: style,
      icon: const Icon(Icons.abc_outlined),
      label: loading ? buildSpinner(context) : child,
      onPressed: onPressed,
    );
  }

  Widget _makeWithoutIcon(context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: TextStyle(fontSize: 20, color: color),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
      ), // height / 2
      elevation: 0,
    );
    return ElevatedButton(
      style: style,
      onPressed: onPressed,
      child: loading ? buildSpinner(context) : child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: icon != null ? _makeWithIcon(context) : _makeWithoutIcon(context),
    );
  }
}
