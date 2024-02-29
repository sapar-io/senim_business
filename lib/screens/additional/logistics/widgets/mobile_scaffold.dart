part of logistics;

class _MobileScaffold extends StatefulWidget {
  final String title;
  final TabBarView tabBarView;

  const _MobileScaffold({
    Key? key,
    required this.title,
    required this.tabBarView,
  }) : super(key: key);

  @override
  State<_MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<_MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
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
            labelColor: SMColors.greyscale.shade500,
          ),
          title: Text(widget.title),
          actions: const [PopupAvatar(isMobile: true)],
        ),
        body: Container(
          color: Theme.of(context).own().dashboardBackground,
          child: widget.tabBarView,
          // child: Stack(
          //   children: [
          //     Container(
          //       color: Theme.of(context).own().dashboardBackground,
          //     ),
          //     Container(
          //       margin: const EdgeInsets.all(16.0),
          //       padding: const EdgeInsets.symmetric(
          //         horizontal: 16.0,
          //         vertical: 24.0,
          //       ),
          //       width: double.infinity,
          //       decoration: BoxDecoration(
          //         color: Theme.of(context).own().dashboardSidebarBackground,
          //         borderRadius: const BorderRadius.all(
          //           Radius.circular(16.0),
          //         ),
          //       ),
          //       child: widget.tabBarView,
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
