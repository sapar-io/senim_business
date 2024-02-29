part of auth;

class _SignUpScreen extends ConsumerStatefulWidget {
  const _SignUpScreen({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<_SignUpScreen> {
  // -- Variables --
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;
  bool _isLoading = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // -- LifeCycle --
  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // -- Methods --
  void _onRememberMeChanged(bool? newValue) => setState(() {
        _rememberMe = newValue ?? false;

        if (_rememberMe) {
          // : Here goes your functionality that remembers the user.
        } else {
          // : Forget the user
        }
      });

  void _signUp() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      setState(() {
        _isLoading = true;
      });

      String response = await ref.watch(authRepositoryProvider).signUp(
            name: _nameController.text.trim(),
            phoneNumber: _phoneController.text.trim(),
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );

      if (response == 'success') {
        Utils.showSnackBar("sign up success");
        Navigator.of(context).pop();
      } else {
        setState(() {
          _isLoading = false;
        });
        Utils.showSnackBar(response);
      }
    } else {
      Utils.showSnackBar("Заполните форму!");
    }
  }

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
            const HeaderTitle(title: "Создай аккаунт Senim"),
            const SizedBox(height: 40),

            /// Имя
            SMTextField(
              type: SMTextFieldType.name,
              controller: _nameController,
              focus: true,
            ),
            const SizedBox(height: 24),

            /// Телефон
            SMPhoneTextField(controller: _phoneController),
            const SizedBox(height: 24),

            /// Почта
            SMTextField(
              type: SMTextFieldType.email,
              controller: _emailController,
              focus: true,
            ),
            const SizedBox(height: 24),

            /// Пароль
            SMTextField(
              type: SMTextFieldType.password,
              controller: _passwordController,
            ),
            const SizedBox(height: 24),

            /// Согласиться с политикой
            _acceptTerms(),
            const SizedBox(height: 32),

            /// Кнопка создать аккаунт
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : SMButton(
                    style: SMButtonStyle.primary,
                    title: "Создать аккаунт",
                    onPressed: _signUp,
                  ),
            const SizedBox(height: 32),
            const AuthToggle(isLogin: false),
          ],
        ),
      ),
    );
  }

  // -- Widgets
  Widget _acceptTerms() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          activeColor: Theme.of(context).primaryColor,
          value: _rememberMe,
          onChanged: _onRememberMeChanged,
        ),
        Expanded(
          child: GestureDetector(
            child: const Text("Регистрируясь, вы соглашаетесь с Условиями"),
            onTap: () {
              _onRememberMeChanged(!_rememberMe);
            },
          ),
        )
      ],
    );
  }
}
