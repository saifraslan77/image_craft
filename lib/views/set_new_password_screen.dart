import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubits/auth_cubits/new_password_cubit/set_new_password_cubit.dart';
import '../cubits/auth_cubits/new_password_cubit/set_new_password_state.dart';
import '../repos/auth_repo.dart';

class SetNewPasswordScreen extends StatefulWidget {
  static const String routeName = "set_new_password_screen";

  const SetNewPasswordScreen({super.key});

  @override
  _SetNewPasswordScreenState createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SetNewPasswordCubit(AuthRepo()),
    child: Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
    backgroundColor: Colors.white,
    leading: IconButton(
    icon: const Icon(
    Icons.arrow_back_ios_new_sharp,
    size: 18,
    ),
    onPressed: () {
    Navigator.pop(context);
    },
    ),
    centerTitle: true,
    title: Image.asset(
    'assets/flutter-project.png',
    height: 21.3.h,
    width: 140.6.w,
    alignment: Alignment.bottomCenter,
    ),
    ),
    body: BlocConsumer<SetNewPasswordCubit, SetNewPasswordState>(
    listener: (context, state) {
    if (state.status == SetNewPasswordStatus.success) {
    ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Password updated successfully')),
    );
    // Navigate to login screen or any other screen
    } else if (state.status == SetNewPasswordStatus.failure) {
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(state.errorMessage ?? 'Password update failed')),
    );
    }
    },
    builder: (context, state) {
    final cubit = context.read<SetNewPasswordCubit>();

    return SingleChildScrollView(
    padding: EdgeInsets.all(20.w),
    child: Form(
    key: _formKey,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Set a new password',
    style: TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.w700,
    color: const Color(0xff987854),
    ),
    ),
    SizedBox(height: 10.h),
    Text(
    'Create a new password. Ensure it differs from previous ones for security',
    style: TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xff987854),
    ),
    ),
    SizedBox(height: 20.h),
    const Padding(
    padding: EdgeInsets.symmetric(horizontal: 5),
    child: Text(
    "Password",
    style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Color(0xff6C563B),
    ),
    ),
    ),
    SizedBox(height: 10.h),
    Padding(
    padding: EdgeInsets.all(5.w),
    child: TextFormField(
    controller: newPasswordController,
    obscureText: !_showPassword,
    decoration: InputDecoration(
    filled: true,
    fillColor: const Color(0xffDCC7AD),
    isDense: true,
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: Colors.transparent),
    ),
    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: Colors.transparent),
    ),
    hintText: "your password",
    hintStyle: TextStyle(
    color: const Color(0xff6C563B),
    fontSize: 16.sp,
    ),
    contentPadding: EdgeInsets.all(18.w),
    suffixIcon: IconButton(
    icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
    onPressed: () {
    setState(() {
    _showPassword = !_showPassword;
    });
    },
    ),
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter your password';
    }
    if (value.length < 8) {
    return 'Password must be at least 8 characters long';
    }
    return null;
    },
    ),
    ),
    SizedBox(height: 20.h),
    const Padding(
    padding: EdgeInsets.symmetric(horizontal: 5),
    child: Text(
    "Confirm Password",
    style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Color(0xff6C563B),
    ),
    ),
    ),
    SizedBox(height: 10.h),
    Padding(
    padding: EdgeInsets.all(5.w),
    child: TextFormField(
    controller: confirmPasswordController,

      obscureText: !_showConfirmPassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffDCC7AD),
        isDense: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        hintText: "your password",
        hintStyle: TextStyle(
          color: const Color(0xff6C563B),
          fontSize: 16.sp,
        ),
        contentPadding: EdgeInsets.all(18.w),
        suffixIcon: IconButton(
          icon: Icon(_showConfirmPassword ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _showConfirmPassword = !_showConfirmPassword;
            });
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please confirm your password';
        }
        if (value != newPasswordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
    ),
    ),
      SizedBox(height: 20.h),
      ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState?.validate() ?? false) {
            await cubit.setNewPassword(newPasswordController.text);
          }
        },
        style: ElevatedButton.styleFrom(
          fixedSize: Size(
            MediaQuery.of(context).size.width * 0.9,
            MediaQuery.of(context).size.height * 0.075,
          ),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.red, width: 2.w),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: state.status == SetNewPasswordStatus.loading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(
          'Update Password',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18.sp,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF987854),
            height: 21.78 / 18, // line-height / font-size
          ),
        ),
      ),
    ],
    ),
    ),
    );
    },
    ),
    ),
    );
  }
}
