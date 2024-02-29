part of logistics;

class _DesktopScaffold extends StatefulWidget {
  final String title;
  final TabBarView tabBarView;

  const _DesktopScaffold({
    Key? key,
    required this.title,
    required this.tabBarView,
  }) : super(key: key);

  @override
  State<_DesktopScaffold> createState() => _DesktopTabsScaffoldState();
}

class _DesktopTabsScaffoldState extends State<_DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: const [
              Tab(
                text: "Грузы Казахстан",
                icon: Icon(Icons.local_shipping),
              ),
              Tab(
                text: "Международные Грузы",
                icon: Icon(Icons.flight),
              ),
              Tab(
                text: "Транспорт Казахстан",
                icon: Icon(Icons.local_shipping),
              ),
              Tab(
                text: "Международный Транспорт",
                icon: Icon(Icons.flight),
              ),
            ],
            labelColor: SMColors.primary,
            unselectedLabelColor: SMColors.greyscale.shade500,
          ),
          title: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Страница",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.normal,
                        color: SMColors.greyscale.shade500,
                      ),
                ),
                const SizedBox(height: 8.0),
                Text(widget.title),
              ],
            ),
          ),
          actions: const [PopupAvatar(isMobile: false)],
          toolbarHeight: 96.0,
        ),
        body: Container(
          color: Theme.of(context).own().dashboardBackground,
          child: widget.tabBarView,
          // Stack(
          //   children: [
          //     Container(
          //       color: Theme.of(context).own().dashboardBackground,
          //     ),
          //     Container(
          //       padding: const EdgeInsets.all(32.0),
          //       width: double.infinity,
          //       margin: const EdgeInsets.all(32.0),
                // decoration: BoxDecoration(
                //   color: Theme.of(context).own().dashboardSidebarBackground,
                //   borderRadius: const BorderRadius.all(
                //     Radius.circular(16.0),
                //   ),
                // ),
          //       child: widget.tabBarView,
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
