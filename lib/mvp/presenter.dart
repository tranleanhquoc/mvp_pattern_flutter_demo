import 'package:mvp_pattern_flutter_demo/mvp/mvp_view.dart';

class Presenter<T extends MvpView> {
  T view;

  attachView(T view) {
    this.view = view;
  }

  deattachView() {
    this.view = null;
  }

  T getView() {
    return view;
  }
}