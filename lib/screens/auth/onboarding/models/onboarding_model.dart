import 'package:flutter/material.dart';
import 'package:senim/constants/sm_colors.dart';

class OnboardingModel {
  final String lottieURL;
  final String title;
  final String description;
  final Color backgroundColor;

  OnboardingModel(
      {required this.lottieURL,
      required this.title,
      required this.description,
      required this.backgroundColor});
}

class OnboardingModels {
  static List<OnboardingModel> all = [
    OnboardingModel(
        lottieURL:
            "https://assets9.lottiefiles.com/packages/lf20_fo0grcos.json",
        title: "Ведение таможенного документооборота",
        description:
            "Таможенный брокер это организация или индивидуальное юридическое лицо, основная задача которого - урегулирование таможенных вопросов.",
        backgroundColor: SMColors.primary),
    OnboardingModel(
        lottieURL:
            "https://assets9.lottiefiles.com/packages/lf20_fo0grcos.json",
        title: "Работа с таможенными платежами",
        description:
            "Таможенный брокер это организация или индивидуальное юридическое лицо, основная задача которого - урегулирование таможенных вопросов.",
        backgroundColor: SMColors.primary),
    OnboardingModel(
        lottieURL:
            "https://assets9.lottiefiles.com/packages/lf20_fo0grcos.json",
        title: "Решение нестандартных вопросов, возникающих при прохождении таможни",
        description:
            "Таможенный брокер это организация или индивидуальное юридическое лицо, основная задача которого - урегулирование таможенных вопросов.",
        backgroundColor: SMColors.primary),
  ];
}
