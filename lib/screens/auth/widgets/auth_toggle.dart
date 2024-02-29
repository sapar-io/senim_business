part of auth;

class AuthToggle extends ConsumerWidget {
  final bool isLogin;

  const AuthToggle({Key? key, required this.isLogin}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isLogin ? "Нет аккаунта?" : "Уже есть аккаунт?",
          style: TextStyle(color: SMColors.greyscale.shade600),
        ),
        TextButton(
          child: Text(isLogin ? "Создать аккаунт" : "Войти"),
          onPressed: () {
            ref.watch(authViewModelProvider.notifier).toggle();
          },
        ),
      ],
    );
  }
}
