library add_company;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:senim/config/themes/app_custom_theme.dart';
import 'package:senim/logic/firestore/references.dart';
import 'package:senim/logic/general_providers.dart';
import 'package:senim/logic/models/company.dart';
import 'package:senim/screens/app/dashboard/widgets/general_scaffold.dart';
import 'package:senim/screens/app/dashboard/widgets/rounded_container.dart';
import 'package:senim/utils/utils.dart';
import 'package:senim/widgets/sm_button.dart';
import 'package:senim/widgets/sm_textfield.dart';

part 'widgets/segment_control.dart';

class AddCompanyScreen extends ConsumerStatefulWidget {
  const AddCompanyScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AddCompanyScreen> createState() => _AddCompanyScreenState();
}

class _AddCompanyScreenState extends ConsumerState<AddCompanyScreen> {
  // -- Variables --
  int _groupValue = 0;
  bool _isLoading = false;

  TextEditingController _iinController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _directorNameController = TextEditingController();
  TextEditingController _founderNameController = TextEditingController();
  TextEditingController _lawAddressController = TextEditingController();
  TextEditingController _realAddressController = TextEditingController();

  // -- Methods -- 
  void addCompany() async {
    String iin = _iinController.text;
    String name = _nameController.text;
    String directorName = _directorNameController.text;
    String founderName = _founderNameController.text;
    String lawAddress = _lawAddressController.text;
    String realAddress = _realAddressController.text;

    bool ipCorrect = iin.isNotEmpty &&
        name.isNotEmpty &&
        directorName.isNotEmpty &&
        lawAddress.isNotEmpty;
    bool tooCorrect = iin.isNotEmpty &&
        name.isNotEmpty &&
        directorName.isNotEmpty &&
        founderName.isNotEmpty &&
        lawAddress.isNotEmpty &&
        realAddress.isNotEmpty;
    bool isCorrect = isIP() ? ipCorrect : tooCorrect;

    if (!isCorrect) {
      Utils.showSnackBar("Заполните все поля");
      return;
    }

    DocumentReference docRef = FirestoreRef.companies.doc();

    String? uid = ref.read(authRepositoryProvider).getCurrentUser()?.uid;
    if (uid == null) {
      Utils.showSnackBar("Пользователь не найден.");
      return;
    }

    Company company = Company(
      id: docRef.id,
      uid: uid,
      type: _groupValue,
      iin: iin,
      name: name,
      directorName: directorName,
      founderName: founderName,
      lawAddress: lawAddress,
      realAddress: realAddress,
    );

    setState(() {
      _isLoading = true;
    });

    final result = await docRef.set(company.toFirestore());

    setState(() {
      _isLoading = false;
    });

    Navigator.of(context).pop();
  }

  // -- Build --
  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      title: "Добавить компанию",
      child: _scrollable(),
    );
  }

  // -- Widgets Content Methods --
  String companyNameType() {
    switch (_groupValue) {
      case 0:
        return "ИП";
      case 1:
        return "ТОО";
      default:
        return "АО";
    }
  }

  bool isIP() => _groupValue == 0;

  // -- Widgets --
  Widget _scrollable() {
    return ListView(
      primary: true,
      children: [
        RoundedContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Выберите тип компании",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: _SegmentControl(
                  groupValue: _groupValue,
                  groupChanged: (value) {
                    setState(() {
                      _groupValue = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 12),
              Form(
                child: Column(
                  children: [
                    SMTextField(
                      controller: _iinController,
                      placeholder: isIP() ? "ИИН" : "БИН",
                    ),
                    const SizedBox(height: 12),
                    SMTextField(
                      controller: _nameController,
                      placeholder: "Название ${companyNameType()}",
                    ),
                    const SizedBox(height: 12),
                    SMTextField(
                      controller: _directorNameController,
                      placeholder: "ФИО директора",
                    ),
                    isIP()
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: SMTextField(
                              controller: _founderNameController,
                              placeholder: "ФИО учредителя",
                            ),
                          ),
                    const SizedBox(height: 12),
                    SMTextField(
                      controller: _lawAddressController,
                      placeholder: "Юридический адрес",
                    ),
                    isIP()
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: SMTextField(
                              controller: _realAddressController,
                              placeholder: "Фактический адрес",
                            ),
                          ),
                    const SizedBox(height: 12),
                    SMButton(
                      title: "Добавить",
                      onPressed: addCompany,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
