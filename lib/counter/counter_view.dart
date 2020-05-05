import 'package:mvp_pattern_flutter_demo/mvp/mvp_view.dart';

abstract class CounterView extends MvpView {
  void onIncrement(int value);
  void onDecrement(int value);
}