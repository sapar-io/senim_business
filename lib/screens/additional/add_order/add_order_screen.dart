library add_order;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:senim/logic/firestore/references.dart';
import 'package:senim/logic/general_providers.dart';
import 'package:senim/logic/models/company.dart';
import 'package:senim/logic/models/order.dart' as orderModel;
import 'package:senim/logic/models/order_product.dart';
import 'package:senim/screens/app/dashboard/widgets/general_scaffold.dart';
import 'package:senim/screens/app/dashboard/widgets/rounded_container.dart';
import 'package:senim/utils/utils.dart';
import 'package:senim/widgets/sm_button.dart';
import 'package:senim/widgets/sm_textfield.dart';

class AddOrderScreen extends ConsumerStatefulWidget {
  const AddOrderScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends ConsumerState<AddOrderScreen> {
  // -- Variables --
  List<Company> _companies = [];
  String? _selectedCompanyValue;
  bool _isLoading = false;

  final List<TextEditingController> _codeControllers = [];
  final List<SMTextField> _codeFields = [];
  final List<TextEditingController> _nameControllers = [];
  final List<SMTextField> _nameFields = [];

  // -- Methods --
  void getCompanies() async {
    final companies =
        await ref.read(companiesRepositoryProvider).getCompanies();
    setState(() {
      _companies = companies;
      _selectedCompanyValue = companies.first.id;
    });
  }

  void _addOrder() async {
    setState(() {
      _isLoading = true;
    });

    final List<OrderProduct> products = [];

    for (var i = 0; i < _codeControllers.length; i++) {
      final code = _codeControllers[i].text.trim();
      final name = _nameControllers[i].text.trim();

      final OrderProduct product =
          OrderProduct(index: i, code: code, name: name);
      products.add(product);
    }

    String uid = ref.read(authRepositoryProvider).getCurrentUser()!.uid;

    final docRef = FirestoreRef.orders.doc();

    final orderModel.Order order = orderModel.Order(
      id: docRef.id,
      companyID: _selectedCompanyValue!,
      uid: uid,
      products: products,
      createdData: Timestamp.now(),
      status: orderModel.OrderStatus(),
    );

    await docRef.set(order.toFirestore());

    setState(() {
      _isLoading = false;
    });

    Utils.showSnackBar("success");

    Navigator.of(context).pop();
  }

  // -- Methods For Widgets --
  String companyNameType(Company model) {
    switch (model.type) {
      case 0:
        return "ИП";
      case 1:
        return "ТОО";
      default:
        return "АО";
    }
  }

  void _addControllers() {
    final codeController = TextEditingController();
    final codeField = SMTextField(
      controller: codeController,
      placeholder: "Код ТНВ",
    );

    final nameController = TextEditingController();
    final nameField = SMTextField(
      controller: nameController,
      placeholder: "Наименование",
    );

    setState(() {
      _codeControllers.add(codeController);
      _codeFields.add(codeField);

      _nameControllers.add(nameController);
      _nameFields.add(nameField);
    });
  }

  void _removeControllers() {
    setState(() {
      _codeControllers.removeLast();
      _codeFields.removeLast();

      _nameControllers.removeLast();
      _nameFields.removeLast();
    });
  }

  // -- Init --
  @override
  void initState() {
    super.initState();
    getCompanies();
    _addControllers();
  }

  @override
  void dispose() {
    for (final controller in _codeControllers) {
      controller.dispose();
    }
    for (final controller in _nameControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  // -- Build --
  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      title: "Создать заявку",
      child: _scrollable(),
    );
  }

  // -- Widgets --
  Widget _scrollable() {
    return ListView(
      primary: true,
      children: [
        RoundedContainer(
          child: _companies.isEmpty ? _empty() : _content(),
        ),
      ],
    );
  }

  Widget _empty() {
    return const Text(
        "У вас нет добавленных компании, пожалуйста добавьте компанию на странице профиля.");
  }

  Widget _content() {
    return Form(
      child: Column(
        children: [
          Text(
            "Выберите компанию",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          _city(),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: _codeFields.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Text("# ${index + 1}"),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _codeFields[index],
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _nameFields[index],
                    ),
                  ],
                ),
              );
            },
          ),
          Row(
            children: [
              _codeControllers.length > 1
                  ? Expanded(
                      child: ListTile(
                        title: const Icon(Icons.remove),
                        onTap: _removeControllers,
                      ),
                    )
                  : Container(),
              Expanded(
                child: ListTile(
                  title: const Icon(Icons.add),
                  onTap: _addControllers,
                ),
              ),
            ],
          ),
          _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SMButton(
                  title: "Отправить",
                  onPressed: _addOrder,
                ),
        ],
      ),
    );
  }

  Widget _city() {
    final list = _companies
        .map((model) => DropdownMenuItem(
              value: model.id,
              child: Text("${companyNameType(model)} «${model.name}»"),
            ))
        .toList();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton(
        isExpanded: true,
        underline: const SizedBox(),
        value: _selectedCompanyValue,
        items: list,
        onChanged: (value) {
          setState(() {
            _selectedCompanyValue = value as String;
          });
        },
      ),
    );
  }
}
