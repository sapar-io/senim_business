part of certifications;

class _OrderCard extends ConsumerStatefulWidget {
  final Order order;
  const _OrderCard({Key? key, required this.order}) : super(key: key);

  @override
  ConsumerState<_OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends ConsumerState<_OrderCard> {
  Company? _company;

  void getCompany() async {
    final company = await ref
        .read(companiesRepositoryProvider)
        .getCompany(widget.order.companyID);

    setState(() {
      _company = company;
    });
  }

  @override
  void initState() {
    super.initState();
    getCompany();
  }

  @override
  Widget build(BuildContext context) {
    final date = DateFormat('yyyy-MMMM-dd – kk:mm')
        .format(widget.order.createdData.toDate());
    final counter = widget.order.products.length;

    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check,
            size: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Создан: $date",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
            ),
            const SizedBox(height: 4),
            _company == null
                ? const Text("Загрузка")
                : Text(
                    _company!.name,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
            const SizedBox(height: 4),
            Text(
              "Кол-во наименования: $counter",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
