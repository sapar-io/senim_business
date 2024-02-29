library dashboard;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:senim/logic/view_models/user_view_model.dart';
import 'package:senim/screens/app/dashboard/models/dashboard_model.dart';
import 'package:senim/utils/responsive.dart';
import 'package:senim/screens/app/dashboard/models/dashboard_item_models.dart';
import 'package:flutter/material.dart';
import 'package:senim/config/themes/app_custom_theme.dart';
import 'package:senim/constants/sm_colors.dart';

// Components
part 'widgets/desktop_sidebar.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  int _selectedIndex = 0;
  int _userRole = 0;

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userViewModelProvider);
    setState(() {
      _userRole = user?.role ?? 0;
    });

    return Responsive(
      mobile: _mobile(context),
      desktop: _desktop(context),
    );
  }

  Widget _desktop(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 256,
            color: Theme.of(context).own().dashboardSidebarBackground,
            child: _DesktopSidebar(
              currentIndex: _selectedIndex,
              userRole: _userRole,
              indexPressed: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
          Expanded(
            child: DashboardModel.getMenuWidgets(_userRole)[_selectedIndex],
          ),
        ],
      ),
    );
  }

  Widget _mobile(BuildContext context) {
    return Scaffold(
      body: DashboardModel.getMenuWidgets(_userRole)[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: DashboardModel.getMenuItems(_userRole)
            .map((model) => BottomNavigationBarItem(
                icon: Icon(model.iconData), label: model.title))
            .toList(),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
