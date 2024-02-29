part of certifications;

class CertificationGuestScreen extends StatefulWidget {
  const CertificationGuestScreen({Key? key}) : super(key: key);

  @override
  State<CertificationGuestScreen> createState() => _CertificationGuestScreenState();
}

class _CertificationGuestScreenState extends State<CertificationGuestScreen> {
  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      title: "Главная",
      child: _scrollable(),
    );
  }

  // -- Widgets --
  Widget _scrollable() {
    return ListView(
      primary: true,
      children: [
        const _HeaderTitle(),
        const StatCards(orders: []),
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
          "Добро пожаловать",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 20.0),
        const Divider(),
        const SizedBox(height: 20.0),
        const Text("Краткие данные"),
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed('/settings'),
          child: const Text("Настройки"),
        )
      ],
    );
  }
}
