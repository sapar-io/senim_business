part of profile;

class ProfileGuestScreen extends StatefulWidget {
  const ProfileGuestScreen({Key? key}) : super(key: key);

  @override
  State<ProfileGuestScreen> createState() => _ProfileGuestScreenState();
}

class _ProfileGuestScreenState extends State<ProfileGuestScreen> {
  // -- Build --
  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      title: "Мой профиль",
      child: Text("Gost'"),
    );
  }
}
