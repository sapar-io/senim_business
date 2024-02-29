part of scaffold;

class _MobileScaffold extends StatefulWidget {
  final String title;
  final Widget child;

  const _MobileScaffold({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  State<_MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<_MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).own().dashboardBackground,
      appBar: AppBar(
        title: Text(widget.title),
        actions: const [PopupAvatar(isMobile: true)],
      ),
      body: widget.child,
    );
  }

  // -- Widgets --
  // Widget _content() {
    // return Stack(
    //   children: [
    //     Container(
    //       color: Theme.of(context).own().dashboardBackground,
    //     ),
    //     Container(
    //       margin: const EdgeInsets.all(16.0),
    // padding: const EdgeInsets.symmetric(
    //   horizontal: 16.0,
    //   vertical: 24.0,
    // ),
    //       width: double.infinity,
    //       decoration: BoxDecoration(
    //         color: Theme.of(context).own().dashboardSidebarBackground,
    //         borderRadius: const BorderRadius.all(
    //           Radius.circular(16.0),
    //         ),
    //       ),
    //       child: widget.child,
    //     ),
    //   ],
    // );

    // return ListView(
    //   primary: true,
    //   children: [
    //     RoundedContainer(
    //       child: ListView.builder(
    //         itemCount: 100,
    //         shrinkWrap: true,
    //         physics: const NeverScrollableScrollPhysics(),
    //         itemBuilder: (context, index) {
    //           return const Text("da");
    //         },
    //       ),
    //     ),
    //   ],
    // );
  // }
}
