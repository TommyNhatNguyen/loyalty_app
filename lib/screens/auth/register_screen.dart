import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loyalty_app/blocs/member/member_register/member_register_bloc.dart';
import 'package:loyalty_app/blocs/member/member_register/member_register_event.dart';
import 'package:loyalty_app/blocs/member/member_register/member_register_state.dart';
import 'package:loyalty_app/constants/enums.dart';
import 'package:loyalty_app/dto/member_dto.dart';
import 'package:loyalty_app/dto/user_dto.dart';
import 'package:loyalty_app/themes/app_colors.dart';
import 'package:loyalty_app/widgets/single_selector.dart';
import 'package:toastification/toastification.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int _selectedRole = 0;
  int _selectedGender = 0;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    final payload = MemberCreateDTO(
      user: UserDTO(
        username: _usernameController.text,
        password: _passwordController.text,
      ),
      first_name: _firstNameController.text.isNotEmpty
          ? _firstNameController.text
          : null,
      last_name: _lastNameController.text,
      email: _emailController.text,
      phone: _phoneController.text,
      gender: _selectedGender,
      is_owner: _selectedRole == 0,
    );
    context.read<MemberRegisterBloc>().add(
      MemberRegisterSubmitEvent(payload: payload),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MemberRegisterBloc, MemberRegisterState>(
      listener: (context, state) {
        if (state.status == RequestStatus.success) {
          toastification.show(
            title: Text(state.message ?? 'Account created successfully'),
            type: ToastificationType.success,
          );
          context.go('/sign-in');
        } else if (state.status == RequestStatus.failure) {
          toastification.show(
            title: Text(state.message ?? 'Registration failed'),
            type: ToastificationType.error,
          );
        }
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRoleSelection(),
            const SizedBox(height: 16),
            _buildNameInput(),
            const SizedBox(height: 16),
            _buildGenderSelection(),
            const SizedBox(height: 16),
            _buildEmailPhone(),
            const SizedBox(height: 16),
            _buildUserForm(),
            const SizedBox(height: 24),
            _buildAction(),
            const SizedBox(height: 16),
            _buildSignInButton(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'I AM A',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.mutedText,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        SingleSelector(
          selectedIndex: _selectedRole,
          onChanged: (index) => setState(() => _selectedRole = index),
          items: const [
            SingleSelectorItem(
              icon: CupertinoIcons.star,
              title: "Owner",
              subtitle: "Manage stores & staff",
            ),
            SingleSelectorItem(
              icon: CupertinoIcons.person,
              title: "Staff",
              subtitle: "Needs invite code",
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNameInput() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'First name',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  hintText: 'Optional',
                  hintStyle: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: AppColors.mutedText),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.border),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.border),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: 'Last name ',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: '*',
                      style: TextStyle(color: AppColors.error),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  hintText: 'Enter last name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.border),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.border),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGenderSelection() {
    final genders = ['Male', 'Female', 'Other'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gender',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Row(
          children: List.generate(genders.length, (index) {
            final isSelected = _selectedGender == index;
            return Padding(
              padding: EdgeInsets.only(
                right: index < genders.length - 1 ? 8 : 0,
              ),
              child: GestureDetector(
                onTap: () => setState(() => _selectedGender = index),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.deepNavy : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected ? AppColors.deepNavy : AppColors.border,
                    ),
                  ),
                  child: Text(
                    genders[index],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isSelected
                          ? AppColors.lightSurface
                          : AppColors.deepNavy,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildEmailPhone() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: 'Email ',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: '*',
                      style: TextStyle(color: AppColors.error),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter email',
                  hintStyle: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: AppColors.mutedText),
                  prefixIcon: Icon(
                    CupertinoIcons.mail,
                    color: AppColors.mutedText,
                    size: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.border),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.border),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: 'Phone ',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: '*',
                      style: TextStyle(color: AppColors.error),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Enter phone',
                  hintStyle: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: AppColors.mutedText),
                  prefixIcon: Icon(
                    CupertinoIcons.phone,
                    color: AppColors.mutedText,
                    size: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.border),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.border),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUserForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Username
        Text.rich(
          TextSpan(
            text: 'Username ',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: '*',
                style: TextStyle(color: AppColors.error),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(
            hintText: 'Enter username',
            prefixIcon: Icon(
              CupertinoIcons.person,
              color: AppColors.mutedText,
              size: 20,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.border),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Password
        Text.rich(
          TextSpan(
            text: 'Password ',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: '*',
                style: TextStyle(color: AppColors.error),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        TextField(
          controller: _passwordController,
          obscureText: _obscurePassword,
          onChanged: (_) => setState(() {}),
          decoration: InputDecoration(
            hintText: 'Enter password',
            prefixIcon: Icon(
              CupertinoIcons.lock,
              color: AppColors.mutedText,
              size: 20,
            ),
            suffixIcon: GestureDetector(
              onTap: () => setState(() => _obscurePassword = !_obscurePassword),
              child: Icon(
                _obscurePassword
                    ? CupertinoIcons.eye
                    : CupertinoIcons.eye_slash,
                color: AppColors.mutedText,
                size: 20,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.border),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
        const SizedBox(height: 8),
        _buildPasswordStrength(),
        const SizedBox(height: 16),

        // Confirm Password
        Text.rich(
          TextSpan(
            text: 'Confirm password ',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: '*',
                style: TextStyle(color: AppColors.error),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        TextField(
          controller: _confirmPasswordController,
          obscureText: _obscureConfirmPassword,
          decoration: InputDecoration(
            hintText: 'Enter password',
            hintStyle: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.mutedText),
            prefixIcon: Icon(
              CupertinoIcons.lock,
              color: AppColors.mutedText,
              size: 20,
            ),
            suffixIcon: GestureDetector(
              onTap: () => setState(
                () => _obscureConfirmPassword = !_obscureConfirmPassword,
              ),
              child: Icon(
                _obscureConfirmPassword
                    ? CupertinoIcons.eye
                    : CupertinoIcons.eye_slash,
                color: AppColors.mutedText,
                size: 20,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.border),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordStrength() {
    final password = _passwordController.text;
    if (password.isEmpty) return const SizedBox.shrink();

    int score = 0;
    if (password.length >= 6) score++;
    if (password.contains(RegExp(r'[A-Z]'))) score++;
    if (password.contains(RegExp(r'[0-9]'))) score++;
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) score++;

    final labels = ['Weak', 'Fair', 'Medium', 'Strong'];
    final colors = [
      AppColors.error,
      AppColors.warning,
      AppColors.brandGold,
      AppColors.success,
    ];
    final hints = [
      'add uppercase, numbers and symbols',
      'add numbers and a symbol',
      'add a symbol to make it stronger',
      '',
    ];

    final level = score.clamp(0, 3);
    final color = colors[level];
    final label = labels[level];
    final hint = hints[level];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: List.generate(4, (index) {
            return Expanded(
              child: Container(
                height: 4,
                margin: EdgeInsets.only(right: index < 3 ? 4 : 0),
                decoration: BoxDecoration(
                  color: index <= level ? color : AppColors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 4),
        Text(
          '$label strength${hint.isNotEmpty ? ' — $hint' : ''}',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: color),
        ),
      ],
    );
  }

  Widget _buildAction() {
    return BlocBuilder<MemberRegisterBloc, MemberRegisterState>(
      builder: (context, state) {
        final isLoading = state.status == RequestStatus.loading;
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isLoading ? null : _onSubmit,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.brandGold,
              foregroundColor: AppColors.deepNavy,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              elevation: 0,
            ),
            child: isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(
                    'Create account',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.deepNavy,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        );
      },
    );
  }

  Widget _buildSignInButton() {
    return Center(
      child: Text.rich(
        TextSpan(
          text: 'Already have an account? ',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.mutedText),
          children: [
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: GestureDetector(
                onTap: () => context.go('/sign-in'),
                child: Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.deepNavy,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
