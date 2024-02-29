part of profile;

class _ProfilePage extends ConsumerStatefulWidget {
  const _ProfilePage({Key? key}) : super(key: key);

  @override
  ConsumerState<_ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<_ProfilePage> {
  // -- Variables --
  final _formKey = GlobalKey<FormState>();
  String? _avatarURL;
  bool _isLoading = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // -- Methods --
  void _save() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      String uid = ref.read(authRepositoryProvider).getCurrentUser()!.uid;
      setState(() {
        _isLoading = true;
      });

      final name = _nameController.text.trim();
      final surname = _surnameController.text.trim();
      final phone = _phoneController.text.trim();
      final email = _emailController.text.trim();

      Map<String, dynamic> data = {
        "name": name,
        "surname": surname,
        "phoneNumber": phone,
        "email": email,
      };

      await ref.read(userRepositoryProvider).updateUser(uid: uid, data: data);
      setState(() {
        _isLoading = false;
      });
      
      Utils.showSnackBar("Завершено");

    } else {
      Utils.showSnackBar("Заполните форму!");
    }
  }

  void _getUser() async {
    String uid = ref.read(authRepositoryProvider).getCurrentUser()!.uid;
    User? user = await ref.read(userRepositoryProvider).getUser(uid: uid);

    setState(() {
      _avatarURL = user?.avatarURL;
    });

    if (user == null) return;
    _nameController.text = user.name;
    if (user.surname != null) _surnameController.text = user.surname!;
    _phoneController.text = user.phoneNumber;
    _emailController.text = user.email;
  }

  void _chooseImage() async {
    String uid = ref.read(authRepositoryProvider).getCurrentUser()!.uid;
    Uint8List? image = await Utils.pickImage(ImageSource.gallery);

    if (image == null) {
      print("choose image error");
      return;
    }

    String avatarURL =
        await ref.read(storageRepositoryProvider).uploadAvatar(image);

    Map<String, dynamic> data = {"avatarURL": avatarURL};
    await ref.read(userRepositoryProvider).updateUser(uid: uid, data: data);

    setState(() {
      _avatarURL = avatarURL;
    });

    Utils.showSnackBar("Успех!");
  }

  // -- Init --
  @override
  void initState() {
    super.initState();
    _getUser();
  }

  // -- Build --
  @override
  Widget build(BuildContext context) {
    return _scrollable();
  }

  // -- Widgets --
  Widget _scrollable() {
    return ListView(
      primary: true,
      children: [
        RoundedContainer(
          child: _content(),
        ),
      ],
    );
  }

  Widget _content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Персональные данные",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16.0),
        const Divider(),
        const SizedBox(height: 16.0),
        _avatar(),
        const SizedBox(height: 16.0),
        _form(),
      ],
    );
  }

  Widget _avatar() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(_avatarURL ??
                'https://mandksolicitors.com/wp-content/uploads/2022/01/istockphoto-666545204-612x612-1.jpg'),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: _chooseImage,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.camera_alt_outlined,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _form() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SMTextField(
            type: SMTextFieldType.name,
            controller: _nameController,
          ),
          const SizedBox(height: 16),
          SMTextField(
            type: SMTextFieldType.surname,
            validate: false,
            controller: _surnameController,
          ),
          const SizedBox(height: 16),
          SMPhoneTextField(controller: _phoneController),
          const SizedBox(height: 16),
          SMTextField(
            type: SMTextFieldType.email,
            enabled: false,
            controller: _emailController,
          ),
          const SizedBox(height: 24),
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : SMButton(
                  style: SMButtonStyle.primary,
                  title: "Сохранить",
                  onPressed: _save,
                ),
        ],
      ),
    );
  }
}
