// import 'package:flutter/material.dart';
import 'package:spotlight/models/notification_model_folder/notifcation_model.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final List<AppNotification> _notifications = [];

  List<AppNotification> get notifications => _notifications;

  void addNotification(String message) {
    _notifications.insert(
        0, AppNotification(message: message, timestamp: DateTime.now()));
  }
}
