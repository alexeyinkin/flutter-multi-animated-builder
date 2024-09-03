This widget overcomes the limitation of `AnimatedBuilder` of listening to only one object.

```dart
int n = 0;

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiAnimatedBuilder(
      animations: [myNotifier1, myNotifier2],
      build: (context) {
        return Text('Rebuilt ${++n} times.');
      },
    );
  }
}
```