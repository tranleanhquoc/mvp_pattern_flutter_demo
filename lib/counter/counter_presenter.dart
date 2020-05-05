import 'package:mvp_pattern_flutter_demo/counter/counter_view.dart';
import 'package:mvp_pattern_flutter_demo/mvp/presenter.dart';

class CounterPresenter extends Presenter<CounterView> {
  int count = 0;

  increment() {
    count++;
    getView().onIncrement(count);
  }

  decrement() {
    count--;
    getView().onDecrement(count);
  }
}
