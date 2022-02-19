import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class AppNotificationToast {
  static toastAlerta(String mensagem, int time) {
    BotToast.showText(
      text: mensagem,
      duration: Duration(seconds: time),
      contentColor: Colors.red.withOpacity(0.9),
      textStyle: const TextStyle(fontSize: 15.0, color: Colors.white),
    );
  }
}
