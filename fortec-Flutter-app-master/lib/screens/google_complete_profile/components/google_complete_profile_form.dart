import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import '../../../providers/users.dart';
import '../../../size_config.dart';

class GoogleCompleteProfileForm extends StatefulWidget {
  final String email;
  final String uid;

  GoogleCompleteProfileForm({
    Key key,
    this.uid,
    this.email,
  }) : super(key: key);

  @override
  _GoogleCompleteProfileFormState createState() =>
      _GoogleCompleteProfileFormState();
}

class _GoogleCompleteProfileFormState extends State<GoogleCompleteProfileForm> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<UserProvider>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Done",
            press: () async {
              await authProvider.googleAddData();
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    final authProvider = Provider.of<UserProvider>(context);
    return TextFormField(
      controller: authProvider.city,
      decoration: InputDecoration(
        labelText: "City Name",
        hintText: "Enter your City Name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    final authProvider = Provider.of<UserProvider>(context);
    return TextFormField(
      keyboardType: TextInputType.phone,
      controller: authProvider.phoneNumber,
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your Phone Name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    final authProvider = Provider.of<UserProvider>(context);
    return TextFormField(
      controller: authProvider.lastName,
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your Last Name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,

        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    final authProvider = Provider.of<UserProvider>(context);
    return TextFormField(
      controller: authProvider.firstName,
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your First Name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }
}
