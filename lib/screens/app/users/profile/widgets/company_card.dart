part of profile;

class _CompanyCard extends ConsumerStatefulWidget {
  final Company company;
  const _CompanyCard({
    Key? key,
    required this.company,
  }) : super(key: key);

  @override
  ConsumerState<_CompanyCard> createState() => _CompanyCardState();
}

class _CompanyCardState extends ConsumerState<_CompanyCard> {
  // -- Methods
  void _showAlertDialog() {
    Widget cancelButton = TextButton(
      child: const Text("Отменить"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget banButton = TextButton(
      onPressed: _delete,
      child: const Text("Да, удалить"),
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Вы уверены"),
      content: Text(
          "Что точно хотите удалить компанию ${companyNameType()} ${widget.company.name}?"),
      actions: [
        cancelButton,
        banButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _delete() async {
    Navigator.of(context).pop();
    await ref.read(companiesRepositoryProvider).delete(id: widget.company.id);
    Utils.showSnackBar('Success');
  }

  // -- Methods For Widgets --
  String companyNameType() {
    switch (widget.company.type) {
      case 0:
        return "ИП";
      case 1:
        return "ТОО";
      default:
        return "АО";
    }
  }

  Icon companyIcon() {
    switch (widget.company.type) {
      case 0:
        return const Icon(
          Icons.business_center,
          size: 18,
          color: Colors.white,
        );
      case 1:
        return const Icon(
          Icons.business_outlined,
          size: 18,
          color: Colors.white,
        );
      default:
        return const Icon(
          Icons.location_city,
          size: 18,
          color: Colors.white,
        );
    }
  }

  bool isIP() => widget.company.type == 0;

  String idName() => isIP() ? 'ИП' : 'ТОО';

  // -- Build --
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          child: companyIcon(),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${companyNameType()} ${widget.company.name}",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              "${idName()}: ${widget.company.iin}",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
            ),
          ],
        ),
        const Spacer(),
        SMButton(
          title: "Удалить",
          width: SMButtonWidth.content,
          height: SMButtonHeight.small,
          style: SMButtonStyle.secondary,
          onPressed: _showAlertDialog,
        )
      ],
    );
  }
}
