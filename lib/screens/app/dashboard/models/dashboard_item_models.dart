import 'package:flutter/material.dart';
import 'package:senim/screens/app/dashboard/models/dashboard_model.dart';

class DashboardItemModel {
  final DashboardItemType type;

  DashboardItemModel({required this.type});

  int get currentIndex {
    switch (type) {
      case DashboardItemType.certificationsGuest:
      case DashboardItemType.certificationsUser:
        return 0;
      case DashboardItemType.chatsGuest:
      case DashboardItemType.chatsUser:
        return 1;
      case DashboardItemType.notificationsGuest:
      case DashboardItemType.notificationsUser:
        return 2;
      case DashboardItemType.logistics:
        return 3;
      case DashboardItemType.profileGuest:
      case DashboardItemType.profileUser:
        return 4;
    }
  }

  String get title {
    switch (type) {
      case DashboardItemType.certificationsGuest:
      case DashboardItemType.certificationsUser:
        return "Главная";
      case DashboardItemType.chatsGuest:
      case DashboardItemType.chatsUser:
        return "Чаты";
      case DashboardItemType.notificationsGuest:
      case DashboardItemType.notificationsUser:
        return "Уведомление";
      case DashboardItemType.logistics:
        return "Логистика";
      case DashboardItemType.profileGuest:
      case DashboardItemType.profileUser:
        return "Профиль";
    }
  }

  IconData get iconData {
    switch (type) {
      case DashboardItemType.certificationsGuest:
      case DashboardItemType.certificationsUser:
        return Icons.document_scanner_outlined;
      case DashboardItemType.chatsGuest:
      case DashboardItemType.chatsUser:
        return Icons.message;
      case DashboardItemType.notificationsGuest:
      case DashboardItemType.notificationsUser:
        return Icons.notifications;
      case DashboardItemType.profileGuest:
      case DashboardItemType.profileUser:
        return Icons.person;
      case DashboardItemType.logistics:
        return Icons.local_shipping;
    }
  }
}