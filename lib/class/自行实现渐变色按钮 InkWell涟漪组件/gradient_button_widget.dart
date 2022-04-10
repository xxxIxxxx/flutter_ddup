import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key? key,
    this.colors,
    this.height,
    this.width,
    this.borderRadius,
    this.onPressed,
    required this.child,
  }) : super(key: key);

  final List<Color>? colors;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final GestureTapCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<Color> _colors =
        colors ?? [theme.primaryColor, theme.primaryColorDark];

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
        borderRadius: borderRadius,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          onTap: onPressed,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
