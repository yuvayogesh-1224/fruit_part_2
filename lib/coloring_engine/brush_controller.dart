import 'package:flutter/material.dart';
import '../models/stroke_model.dart';
import '../theme/app_colors.dart';

class BrushController extends ChangeNotifier {
  BrushStyle _style = BrushStyle.crayon;
  double _size = 28.0;
  Color _color = AppColors.defaultPalette[0];
  bool _isEraser = false;
  bool _isFillTool = false;

  BrushStyle get style => _style;
  double get size => _size;
  Color get color => _color;
  bool get isEraser => _isEraser;
  bool get isFillTool => _isFillTool;

  void setStyle(BrushStyle newStyle) {
    _style = newStyle;
    _isEraser = false;
    _isFillTool = false;
    notifyListeners();
  }

  void setSize(double newSize) {
    _size = newSize.clamp(10.0, 65.0);
    notifyListeners();
  }

  void setColor(Color newColor) {
    _color = newColor;
    _isEraser = false;
    notifyListeners();
  }

  void setEraser(bool active) {
    _isEraser = active;
    if (active) {
      _isFillTool = false;
    }
    notifyListeners();
  }

  void setFillTool(bool active) {
    _isFillTool = active;
    if (active) {
      _isEraser = false;
    }
    notifyListeners();
  }

  BrushStroke createStroke(Offset startPoint) {
    return BrushStroke(
      points: [startPoint],
      color: _color,
      size: _size,
      style: _style,
      isEraser: _isEraser,
    );
  }
}
