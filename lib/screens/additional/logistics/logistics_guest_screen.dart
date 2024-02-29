part of logistics;

class LogisticsGuestScreen extends StatefulWidget {
  const LogisticsGuestScreen({Key? key}) : super(key: key);

  @override
  State<LogisticsGuestScreen> createState() => _LogisticsGuestScreenState();
}

class _LogisticsGuestScreenState extends State<LogisticsGuestScreen> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _MobileScaffold(
        title: "Логистика",
        tabBarView: _mobile(context),
      ),
      desktop: _DesktopScaffold(
        title: "Логистика",
        tabBarView: _desktop(context),
      ),
    );
  }

  TabBarView _desktop(BuildContext context) {
    return const TabBarView(children: [
      _CargoKazakhstan(),
      Icon(Icons.ads_click),
      Icon(Icons.ads_click),
      Icon(Icons.ads_click),
    ]);
  }

  TabBarView _mobile(BuildContext context) {
    return const TabBarView(children: [
      _CargoKazakhstan(),
      Icon(Icons.ads_click),
      Icon(Icons.ads_click),
      Icon(Icons.ads_click),
    ]);
  }
}