library notifications;

import 'package:senim/constants/sm_colors.dart';
import 'package:senim/screens/app/dashboard/widgets/general_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:senim/screens/app/dashboard/widgets/rounded_container.dart';

part 'notifications_guest_screen.dart';
part 'widgets/notification_card.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      title: "Уведомление",
      child: _scrollable(),
    );
  }

  // -- Widgets --
  Widget _scrollable() {
    return ListView(
      primary: true,
      children: [
        RoundedContainer(
          child: _content(),
        ),
      ],
    );
  }

  Widget _content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Будьте в курсе ваших работ",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16.0),
        const Divider(),
        const SizedBox(height: 16.0),
        ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return const NotificationCard();
          },
          itemCount: 100,
        ),
      ],
    );
  }
}
