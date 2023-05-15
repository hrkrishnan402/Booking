import 'package:bookingapp/presentation/blocs/login/login_bloc.dart';
import 'package:bookingapp/presentation/blocs/signup/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AuthPage extends StatefulWidget {
  int? index;

  AuthPage({super.key, this.index = 0});

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  final _registrationFormKey = GlobalKey<FormState>();
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _loginPhoneController = TextEditingController();
  final TextEditingController _loginPasswordController =
      TextEditingController();
  DateTime _dob = DateTime.now();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.animateTo(widget.index as int);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close)),
        title: const Text('Register / Login'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Register'),
            Tab(text: 'Login'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildRegistrationForm(),
          _buildLoginForm(),
        ],
      ),
    );
  }

  Widget _buildLoginForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            TextFormField(
              controller: _loginPhoneController,
              decoration: const InputDecoration(
                labelText: 'Phone',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a phone number';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _loginPasswordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            BlocConsumer<LoginBloc, LoginState>(
              listener: (context, loginState) {
                if (loginState is LoginSuccessState) {
                  Navigator.pop(context);
                }
              },
              builder: (context, loginState) {
                if (loginState is LoginLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (loginState is LoginFailedState) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Login Failed."),
                  ));
                }
                return ElevatedButton(
                  onPressed: () {
                    if (_loginFormKey.currentState!.validate()) {
                      BlocProvider.of<LoginBloc>(context).add(FetchLoginEvent(
                        phone: _loginPhoneController.text,
                        password: _loginPasswordController.text,
                      ));
                    }
                  },
                  child: const Text('Login'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegistrationForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _registrationFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a phone number';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            const Text('Date of Birth:'),
            const SizedBox(height: 8.0),
            InkWell(
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: _dob,
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                ).then((value) {
                  if (value != null) {
                    setState(() {
                      _dob = value;
                    });
                  }
                });
              },
              child: Row(
                children: [
                  const Icon(Icons.calendar_today),
                  const SizedBox(width: 8.0),
                  Text(
                    DateFormat.yMd().format(_dob),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            BlocConsumer<SignupBloc, SignupState>(
              listener: (context, state) {
                if (state is SignupSuccessState) {
                  _tabController.animateTo(1);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Registeration Successfull.Please Login"),
                  ));
                } else if (state is SignupFailedState) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Registeration Failed."),
                  ));
                }
              },
              builder: (context, signupState) {
                if (signupState is SignupLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ElevatedButton(
                  onPressed: () {
                    final dateFormat = DateFormat('dd-MM-yyyy');
                    if (_registrationFormKey.currentState!.validate()) {
                      BlocProvider.of<SignupBloc>(context).add(FetchSignupEvent(
                          customerName: _nameController.text,
                          phone: _phoneController.text,
                          password: _passwordController.text,
                          dob: dateFormat.format(_dob)));
                    }
                  },
                  child: const Text('Submit'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
