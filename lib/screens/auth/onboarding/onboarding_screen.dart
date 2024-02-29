import 'package:flutter/material.dart';
import 'package:senim/screens/auth/onboarding/widgets/onboarding_page.dart';
import 'package:senim/screens/auth/onboarding/models/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  final bool hideButtons;

  const OnboardingScreen({
    Key? key,
    required this.hideButtons,
  }) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // MARK: - Variables
  final PageController _controller = PageController();
  bool onLastPage = false;

  // MARK: - Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pageView(),
          _buttonsWithDotIndicator(context),
        ],
      ),
    );
  }

  // MARK: - Widgets
  PageView _pageView() {
    return PageView(
      controller: _controller,
      onPageChanged: (index) {
        setState(() {
          onLastPage = index == OnboardingModels.all.length - 1;
        });
      },
      children: OnboardingModels.all
          .map((model) => OnboardingPage(model: model))
          .toList(),
    );
  }

  Widget _buttonsWithDotIndicator(BuildContext context) {
    return Container(
      alignment: const Alignment(0, 0.95),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: GestureDetector(
              onTap: () {
                onLastPage
                    ? Navigator.pushReplacementNamed(context, '/')
                    : _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
              },
              child: widget.hideButtons
                  ? Container()
                  : Text(
                      onLastPage ? "Войти" : "Дальше",
                      style: const TextStyle(color: Colors.white),
                    ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const WormEffect(
                  dotColor: Colors.black26,
                  activeDotColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
