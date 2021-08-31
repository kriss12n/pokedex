import 'package:flutter/material.dart';

class PokedexView extends ChangeNotifier {
  double _viewport;
  double _opacityNav = 0;
  double _opacityBody = 1;
  double _opacityImage = 1;

  double get viewport => this._viewport;
  double get opacityNav => this._opacityNav;
  double get opacityBody => this._opacityBody;
  double get opacityImage => this._opacityImage;

  set viewport(double viewport) {
    this._viewport = viewport;
    if (viewport >= 0.6) {
      this._opacityNav = 1;
      this._opacityBody = 0;
    } else if (viewport <= 0.6 && viewport >= 0.43) {
      this._opacityBody = 1;
    } else if (viewport >= 0.42) {
      this._opacityImage = 0;
    } else if (viewport == 0.41) {
      this._opacityImage = 1;
      this._opacityNav = 0;
      this._opacityBody = 1;
    }
    notifyListeners();
  }
}
