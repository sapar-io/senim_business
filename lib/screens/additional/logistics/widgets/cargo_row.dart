part of logistics;

class _CargoRow extends StatelessWidget {
  const _CargoRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: _desktop(context),
      mobile: _mobile(context),
    );
  }

  Widget _desktop(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(32.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "20.07",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text("15.30"),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Капчагай (KZ) — Нур-Султан (KZ)",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text("~ 1 228 км, тент, боковая"),
                ],
              ),
              const Spacer(),
              const Text(
                "стройматериалы",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Text(
                "21т",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Text(
                "120 м³",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }

  Widget _mobile(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "20.07",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text("15.30"),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Капчагай (KZ) — Нур-Султан (KZ)",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text("~ 1 228 км, тент, боковая"),
                ],
              ),
              // const Spacer(),
              // const Text(
              //   "стройматериалы",
              //   style: TextStyle(fontWeight: FontWeight.bold),
              // ),
              // const Spacer(),
              // const Text(
              //   "21т",
              //   style: TextStyle(fontWeight: FontWeight.bold),
              // ),
              // const Spacer(),
              // const Text(
              //   "120 м³",
              //   style: TextStyle(fontWeight: FontWeight.bold),
              // ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
