part of certifications;

class StatCards extends StatefulWidget {
  final List<Order> orders;
  const StatCards({Key? key, required this.orders}) : super(key: key);

  @override
  State<StatCards> createState() => _StatCardsState();
}

class _StatCardsState extends State<StatCards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              card(widget.orders.length),
              const SizedBox(width: 16),
              card(widget.orders.length),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              card(widget.orders.length),
              const SizedBox(width: 16),
              card(widget.orders.length),
            ],
          ),
        ],
      ),
    );
  }

  Widget card(int counter) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.monetization_on,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  "Активные заявки",
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
            const Divider(),
            Text(
              "${counter} заявок",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
