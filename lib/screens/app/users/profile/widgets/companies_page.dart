part of profile;

class _CompaniesPage extends ConsumerStatefulWidget {
  const _CompaniesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<_CompaniesPage> createState() => _CompaniesPageState();
}

class _CompaniesPageState extends ConsumerState<_CompaniesPage> {
  // -- Build --
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ref.read(companiesRepositoryProvider).listenMyCompanies(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Company>> snapshot,
      ) {
        return _scrollable(snapshot.data);
      },
    );
  }

  // -- Widgets --
  Widget _scrollable(List<Company>? companies) {
    return ListView(
      primary: true,
      children: [
        RoundedContainer(
          child: _content(companies),
        ),
      ],
    );
  }

  Widget _content(List<Company>? companies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
              "Компании",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Spacer(),
            SMButton(
              title: "Добавить",
              width: SMButtonWidth.content,
              height: SMButtonHeight.small,
              onPressed: () {
                Navigator.of(context).pushNamed(router.AppRoutes.addCompany);
              },
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        const Divider(),
        const SizedBox(height: 16.0),
        ListView.separated(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return _CompanyCard(company: companies![index]);
          },
          separatorBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Divider(),
            );
          },
          itemCount: companies?.length ?? 0,
        )
      ],
    );
  }
}
