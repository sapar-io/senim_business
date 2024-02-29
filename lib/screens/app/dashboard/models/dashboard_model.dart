import 'package:flutter/material.dart';
import 'package:senim/screens/additional/logistics/logistics_screen.dart';
import 'package:senim/screens/app/dashboard/models/dashboard_item_models.dart';

// Pages | Guest - 0 | User - 1
import 'package:senim/screens/app/users/certification/certification_screen.dart';
import 'package:senim/screens/app/users/chats/chats_screen.dart';
import 'package:senim/screens/app/users/notifications/notifications_screen.dart';
import 'package:senim/screens/app/users/profile/profile_screen.dart';

// Pages | Expert - 2
// import 'package:checkauto/screens/app/expert/home/home_screen.dart'
//     as home_expert;
// import 'package:checkauto/screens/app/expert/orders/orders_screen.dart'
//     as orders_expert;
// import 'package:checkauto/screens/app/expert/notifications/notifications_screen.dart'
//     as notifications_expert;
// import 'package:checkauto/screens/app/expert/profile/profile_screen.dart'
//     as profile_expert;

// Pages | Admin - 3
// import 'package:checkauto/screens/app/admin/experts/experts_screen.dart';
// import 'package:checkauto/screens/app/admin/billings/billings_screen.dart';
// import 'package:checkauto/screens/app/admin/check_inspection/check_inspection_screen.dart';

enum DashboardItemType {
  // Guest - 0
  certificationsGuest, 
  chatsGuest,
  notificationsGuest,
  profileGuest,

  // User - 1
  certificationsUser, 
  chatsUser,
  notificationsUser,
  profileUser,
  logistics,

  // Manager - 2
  // homeUser, 
  // logisticsUser,
  // brokerUser,
  // certificationUser,
  // notificationUser,

  // Admin - 3
  // homeUser, 
  // logisticsUser,
  // brokerUser,
  // certificationUser,
  // notificationUser,
}

class DashboardModel {
  static Map<DashboardItemModel, Widget> _getMenu(int userRole) {
    switch (userRole) {
      // Guest - 0
      case 0:
        return {
          DashboardItemModel(type: DashboardItemType.certificationsGuest):
              const CertificationGuestScreen(),
          DashboardItemModel(type: DashboardItemType.chatsGuest):
              const ChatsGuestScreen(),
          DashboardItemModel(type: DashboardItemType.notificationsGuest):
              const NotificationsGuestScreen(),
          DashboardItemModel(type: DashboardItemType.profileGuest):
              const ProfileGuestScreen(),
        };
      // User - 1
      case 1:
        return {
          DashboardItemModel(type: DashboardItemType.certificationsUser):
              const CertificationScreen(),
          DashboardItemModel(type: DashboardItemType.chatsUser):
              const ChatsScreen(),
          DashboardItemModel(type: DashboardItemType.notificationsUser):
              const NotificationsScreen(),
          DashboardItemModel(type: DashboardItemType.profileUser):
              const ProfileScreen(),
          DashboardItemModel(type: DashboardItemType.logistics):
              const LogisticsScreen(),
        };
      // Admin - 2
      default:
        return {
          DashboardItemModel(type: DashboardItemType.certificationsUser):
              const CertificationScreen(),
          DashboardItemModel(type: DashboardItemType.chatsUser):
              const ChatsScreen(),
          DashboardItemModel(type: DashboardItemType.notificationsUser):
              const NotificationsScreen(),
          DashboardItemModel(type: DashboardItemType.profileUser):
              const ProfileScreen(),
        };
    }
  }

  static List<DashboardItemModel> getMenuItems(int userRole) {
    return _getMenu(userRole).keys.toList();
  }

  static List<Widget> getMenuWidgets(int userRole) {
    return _getMenu(userRole).values.toList();
  }
}
