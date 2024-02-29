library profile;

import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:senim/config/routes/app_router.dart' as router;
import 'package:senim/logic/general_providers.dart';
import 'package:senim/logic/models/company.dart';
import 'package:senim/logic/models/user.dart';
import 'package:senim/screens/app/dashboard/widgets/general_scaffold.dart';
import 'package:senim/screens/app/dashboard/widgets/rounded_container.dart';
import 'package:senim/utils/utils.dart';
import 'package:senim/widgets/sm_button.dart';
import 'package:flutter/material.dart';
import 'package:senim/widgets/sm_phone_textfield.dart';
import 'package:senim/widgets/sm_textfield.dart';

part 'profile_guest_screen.dart';
part 'widgets/profile_page.dart';
part 'widgets/companies_page.dart';
part 'widgets/company_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // -- Variables
  final _tabsMenu = [
    const Tab(
      text: "Профиль",
      icon: Icon(Icons.person_pin_sharp),
      iconMargin: EdgeInsets.only(bottom: 4),
    ),
    const Tab(
      text: "Ваши компании",
      icon: Icon(Icons.home_work_rounded),
      iconMargin: EdgeInsets.only(bottom: 4),
    ),
  ];

  final _tabsView = [
    const _ProfilePage(),
    const _CompaniesPage(),
  ];

  // -- Build --
  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      title: "Мой профиль",
      child: _content(),
    );
  }

  // -- Widgets --
  Widget _content() {
    return DefaultTabController(
      length: _tabsMenu.length,
      child: Column(
        children: [
          TabBar(tabs: _tabsMenu),
          Expanded(
            child: TabBarView(
              children: _tabsView,
            ),
          ),
        ],
      ),
    );
  }
}
