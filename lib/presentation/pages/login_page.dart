import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app_ui/data/models/user.dart';
import 'package:shop_app_ui/data/utils/const.dart';
import 'package:shop_app_ui/data/utils/styles/color_scheme.dart';
import 'package:shop_app_ui/data/utils/user_preferences.dart';
import 'package:shop_app_ui/presentation/pages/main_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String _name;
  late String _password;

  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _name = "";
    _password = "";
    _nameController = TextEditingController();
    _passwordController = TextEditingController();

    _nameController.addListener(() => setState(() {}));
    _passwordController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _nameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: <Widget>[
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(
                    "assets/svg/pattern.svg",
                    alignment: Alignment.topLeft,
                    fit: BoxFit.fitWidth,
                  ),
                  Positioned(
                    bottom: -32,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: [
                                buildTextSpan(
                                  text: "Hello",
                                  color: primaryTextColor,
                                ),
                                buildTextSpan(
                                  text: "There!",
                                  color: primaryTextColor,
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            'Please fill in the following form to continue.',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 60, 16, 24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      buildTextField(
                        labelText: "Name",
                        hintText: 'Your Name',
                        controller: _nameController,
                        prefixIcon: const Icon(Icons.person_outlined),
                        onSaveValue: _name,
                      ),
                      const SizedBox(height: 20),
                      buildTextField(
                        labelText: "Password",
                        hintText: 'Your password',
                        controller: _passwordController,
                        textInputAction: TextInputAction.done,
                        prefixIcon: const Icon(Icons.lock),
                        onSaveValue: _password,
                        isPassword: true,
                      ),
                      const SizedBox(height: 20),
                      buildSubmitButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextSpan buildTextSpan({required String text, required Color color}) {
    return TextSpan(
      text: text,
      style: TextStyle(
        fontFamily: "Poppins",
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }

  TextFormField buildTextField(
      {required String labelText,
      required String hintText,
      Widget? prefixIcon,
      bool isPassword = false,
      TextInputAction? textInputAction,
      required String onSaveValue,
      required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      textInputAction: textInputAction ?? TextInputAction.next,
      keyboardType: TextInputType.name,
      obscureText: isPassword,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        labelStyle: TextStyle(color: secondaryTextColor),
        hintText: hintText,
        floatingLabelStyle: TextStyle(color: primaryColor),
        prefixIcon: prefixIcon ?? Container(),
        suffixIcon: controller.text.isEmpty
            ? const SizedBox()
            : IconButton(
                onPressed: () => controller.clear(),
                icon: const Icon(Icons.close),
              ),
      ),
      validator: (value) {
        if (value!.trim().isEmpty) return "Field cannot be empty.";

        return null;
      },
      onSaved: (value) => setState(() => onSaveValue = value!),
    );
  }

  ElevatedButton buildSubmitButton() {
    return ElevatedButton(
      onPressed: () async {
        // remove the focus of keybooard
        FocusScope.of(context).unfocus();

        if (_formKey.currentState!.validate()) {
          // save form field
          _formKey.currentState!.save();

          // initialize new user object
          final user = User(
            id: Const.userId,
            name: _name,
            password: _password,
            imagePath: Const.profilePath,
          );

          // set user
          UserPreferences.setUser(user).then((_) {
            // navigate and replace this screen with main screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: ((context) => MainScreen(user: user)),
              ),
            );
          });
        }
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        shape: const CircleBorder(),
      ),
      child: const Icon(Icons.arrow_forward_rounded),
    );
  }
}
