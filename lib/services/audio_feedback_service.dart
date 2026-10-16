import 'package:flutter/services.dart';

class AudioFeedbackService {
  static bool soundEnabled = true;

  static void tap() {
    if (!soundEnabled) return;
    try {
      HapticFeedback.lightImpact();
      SystemSound.play(SystemSoundType.click);
    } catch (_) {}
  }

  static void colorSelected() {
    if (!soundEnabled) return;
    try {
      HapticFeedback.selectionClick();
    } catch (_) {}
  }

  static void fill() {
    if (!soundEnabled) return;
    try {
      HapticFeedback.mediumImpact();
      SystemSound.play(SystemSoundType.click);
    } catch (_) {}
  }

  static void levelComplete() {
    if (!soundEnabled) return;
    try {
      HapticFeedback.heavyImpact();
      Future.delayed(const Duration(milliseconds: 150), () {
        HapticFeedback.mediumImpact();
      });
      Future.delayed(const Duration(milliseconds: 300), () {
        HapticFeedback.heavyImpact();
      });
    } catch (_) {}
  }

  static void starEarned() {
    if (!soundEnabled) return;
    try {
      HapticFeedback.lightImpact();
    } catch (_) {}
  }
}
