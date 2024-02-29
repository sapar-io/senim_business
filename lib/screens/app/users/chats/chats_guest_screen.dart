part of chats;

class ChatsGuestScreen extends StatefulWidget {
  const ChatsGuestScreen({Key? key}) : super(key: key);

  @override
  State<ChatsGuestScreen> createState() => _ChatsGuestScreenState();
}

class _ChatsGuestScreenState extends State<ChatsGuestScreen> {
  @override
  Widget build(BuildContext context) {
    return const GeneralScaffold(
      title: "Чаты",
      child: Text("hi"),
    );
  }
}
