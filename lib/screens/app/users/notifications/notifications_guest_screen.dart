part of notifications;

class NotificationsGuestScreen extends StatefulWidget {
  const NotificationsGuestScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsGuestScreen> createState() =>
      _NotificationsGuestScreenState();
}

class _NotificationsGuestScreenState extends State<NotificationsGuestScreen> {
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
