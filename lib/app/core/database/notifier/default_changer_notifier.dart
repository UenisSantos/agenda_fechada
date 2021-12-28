import 'package:flutter/cupertino.dart';

class DefaultChangerNotifier extends ChangeNotifier {
  bool _loading = false;
  String? _error;
  bool _success = false;

  bool get loading => _loading;
  String? get error => _error;
  bool get isSuccess => _success;
  bool  get hasError => _error != null;

  void showLoading() => _loading = true;
  void hideLoading() => _loading = false;

  void success() => _success = true;
  void setError(String? error) => _error = error;

  void showLoadingAndREsetState() {
    showLoading();
    resetState();
  }

  void resetState() {
    setError(null);
    _success = false;
  }
}
