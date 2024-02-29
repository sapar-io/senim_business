library certifications;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:senim/config/routes/app_router.dart';
import 'package:senim/logic/firestore/references.dart';
import 'package:senim/logic/general_providers.dart';
import 'package:senim/logic/models/company.dart';
import 'package:senim/logic/models/order.dart';
import 'package:senim/screens/app/dashboard/widgets/general_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:senim/screens/app/dashboard/widgets/rounded_container.dart';
import 'package:senim/widgets/sm_button.dart';

part 'certification_guest_screen.dart';
part 'widgets/header_title.dart';
part 'widgets/stat_cards.dart';
part 'widgets/order_card.dart';

class CertificationScreen extends ConsumerStatefulWidget {
  const CertificationScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CertificationScreen> createState() =>
      _CertificationScreenState();
}

class _CertificationScreenState extends ConsumerState<CertificationScreen> {

  // -- Variables --
  int isActive = 0;

  // -- Widgets --
  // void _countStat(List<Order>? orders) {
  //   setState(() {
  //     isActive = orders?.length ?? 0;
  //   });
  // }

  // -- Build --
  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      title: "Главная",
      child: StreamBuilder(
        stream: ref.read(ordersRepositoryProvider).listenMyOrders(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<Order>> snapshot,
        ) {
          return _scrollable(snapshot.data);
        },
      ),
    );
  }

  // -- Widgets --
  Widget _scrollable(List<Order>? orders) {
    return ListView(
      primary: true,
      children: [
        const _HeaderTitle(),
        StatCards(orders: orders ?? []),
        RoundedContainer(
          child: _content(orders),
        ),
      ],
    );
  }

  Widget _content(List<Order>? orders) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
              "Ваши заявки",
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
                Navigator.of(context).pushNamed(AppRoutes.addOrder);
              },
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Divider(),
        ),
        ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return _OrderCard(order: orders![index]);
            },
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Divider(),
              );
            },
            itemCount: orders?.length ?? 0),
      ],
    );
  }
}
