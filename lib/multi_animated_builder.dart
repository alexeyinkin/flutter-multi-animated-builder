import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// Calls [builder] everytime any of the [animations] fires.
class MultiAnimatedBuilder extends StatelessWidget {
  /// The animations to listen to.
  final List<Listenable> animations;

  /// The callback to call when any of the [animations] fires.
  final WidgetBuilder builder;

  /// Calls [builder] everytime any of the [animations] fires.
  const MultiAnimatedBuilder({
    super.key,
    required this.animations,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return switch (animations.length) {
      0 => builder(context),
      1 => AnimatedBuilder(
          animation: animations.first,
          builder: (context, child) => builder(context),
        ),
      _ => AnimatedBuilder(
          animation: animations.first,
          builder: (context, child) => MultiAnimatedBuilder(
            animations: animations.sublist(1),
            builder: builder,
          ),
        ),
    };
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<Listenable>('animations', animations));
    properties.add(ObjectFlagProperty<WidgetBuilder>.has('builder', builder));
  }
}
