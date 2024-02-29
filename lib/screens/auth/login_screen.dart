part of auth;

class _LoginScreen extends ConsumerStatefulWidget {
  const _LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<_LoginScreen> {
  // -- Variables --
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _rememberMe = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // -- LifeCycle --
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // -- Methods --
  void _login() async {
    if (_formKey.currentState?.validate() ?? false) {
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      setState(() {
        _isLoading = true;
      });

      String response =
          await ref.read(authRepositoryProvider).signIn(email, password);

      setState(() {
        _isLoading = false;
      });
      if (response == 'success') {
        Utils.showSnackBar("success");
        Navigator.pop(context);
      } else {
        Utils.showSnackBar(response);
      }
    } else {
      Utils.showSnackBar("Заполните форму!");
    }
  }

  void _onRememberMeChanged(bool? newValue) => setState(() {
        _rememberMe = newValue ?? false;
      });

  // -- Build --
  @override
  Widget build(BuildContext context) {
    bool isSmallScreen =
        Responsive.isTablet(context) || Responsive.isMobile(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment:
                    isSmallScreen ? Alignment.topCenter : Alignment.center,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 24.0),
                    child: SizedBox(
                      width: 450,
                      child: _form(),
                    ),
                  ),
                ),
              ),
            ),
            isSmallScreen
                ? Container()
                : Expanded(
                    child: Container(
                      color: Theme.of(context).primaryColor,
                      child: const OnboardingScreen(hideButtons: true),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  // -- Widgets --
  Widget _form() {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderTitle(title: "Вход в свой аккаунт"),
            const SizedBox(height: 40),

            // Email
            SMTextField(
              type: SMTextFieldType.email,
              controller: _emailController,
              focus: true,
            ),
            const SizedBox(height: 24),

            // Пароль
            SMTextField(
              type: SMTextFieldType.password,
              controller: _passwordController,
            ),
            const SizedBox(height: 24),

            // Запомнить меня
            _rememberMeCheckBox(),
            const SizedBox(height: 32),

            // Войти
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : SMButton(
                    style: SMButtonStyle.primary,
                    title: "Войти",
                    onPressed: () => _login(),
                  ),
            const SizedBox(height: 32),
            const AuthToggle(isLogin: true),
          ],
        ),
      ),
    );
  }

  Widget _rememberMeCheckBox() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          activeColor: Theme.of(context).primaryColor,
          value: _rememberMe,
          onChanged: _onRememberMeChanged,
        ),
        GestureDetector(
          child: const Text("Запомнить меня"),
          onTap: () {
            _onRememberMeChanged(!_rememberMe);
          },
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: Text(
            "Забыли пароль?",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        )
      ],
    );
  }
}
