// presentation/form_validation_page.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FormValidationPage extends StatelessWidget {
  final Function(Map<String, String>) addData;
  FormValidationPage({super.key, required this.addData});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final RegExp nameRegex = RegExp(r'^[a-zA-Z]+[ a-zA-Z]*$');

  final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:.[a-zA-Z0-9-]+)*$");

  final RegExp mobileNumberRegex = RegExp(r'^(?:[+0][1-9])?[0-9]{3,15}$');
  bool validateName(String name) {
    return nameRegex.hasMatch(name);
  }

  bool validateEmail(String email) {
    return emailRegex.hasMatch(email);
  }

  bool validateMobileNumber(String mobileNumber) {
    return mobileNumberRegex.hasMatch(mobileNumber);
  }

  String? _validateInputMobile(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter a  $fieldName.';
    }
    if (!validateMobileNumber(value)) {
      return 'Please enter a valid  mobile number.';
    }
    return null;
  }

  String? _validateInputName(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter contact $fieldName.';
    }
    if (!validateName(value)) {
      return 'Please enter a valid $fieldName.';
    }
    return null;
  }

  String? _validateInputEmail(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter an $fieldName.';
    }
    if (!validateEmail(value)) {
      return 'Please enter a valid $fieldName.';
    }
    return null;
  }

  void _call() async {
    var url = "tel:${_mobileNumberController.text}"; //tel:
    String val = _mobileNumberController.text;
    if (validateMobileNumber(val)) {
      // ignore: deprecated_member_use
      if (await canLaunch(url)) {
        // ignore: deprecated_member_use
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  void _sendEmail(TextEditingController mail) async {
    // var url = "mailto:${_emailController.text}";

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: mail.text,
      query: <String, String>{
        'subject': 'Example Subject ',
      }
          .entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&'),
    );
 
    if (validateEmail(mail.text)) {
      if (await launchUrl(emailLaunchUri)) {
        // ignore: deprecated_member_use
        await launchUrl(emailLaunchUri);
      } else {
        throw 'Could not launch $emailLaunchUri';
      }
    } else {
      _validateInputEmail(mail.text, 'email');
    }
  }

  void _submitForm(BuildContext context) {
    if ((_formKey.currentState!.validate()) &&
        (validateName(_nameController.text) &&
            validateEmail(_emailController.text) &&
            validateMobileNumber(_mobileNumberController.text))) {
      final data = {
        'name': _nameController.text,
        'lastName': _lastNameController.text,
        'mobileNumber': _mobileNumberController.text,
        'email': _emailController.text,
      };
      addData(data);
      Navigator.pop(context);
    }
  }

  Widget buildSettingsElement(IconData icon) {
    return Icon(
      icon,
      color: Colors.indigo,
      size: 15,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Data'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
          //  crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

               SizedBox(
                 child: Center(
                   child: CircleAvatar(
                    radius: 35,
                    child: Center(
                      child: Icon(
                        
                      Icons.camera_alt,
                      color: Colors.grey.shade300,
                      size: 25,
                      
                      
                                     
                                 
                      ),
                    ),
                                ),
                 )),
                   const SizedBox(height: 10,),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.indigo,
                  ),
                ),
                validator: (value) => _validateInputName(value, 'name'),
              ),
                const SizedBox(height: 10,),
               TextFormField(
                controller: _lastNameController,
               
                  decoration: const InputDecoration(
                  labelText: 'Last Name',
                  hintText: 'Enter your last name',
                  prefixIcon: Icon(
                    Icons.person_2,
                    color: Colors.indigo,
                  ),
                ),
            
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: _mobileNumberController,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  hintText: 'Enter your mobile number',
                  prefixIcon: InkWell(
                    child: buildSettingsElement(
                      Icons.call,
                    ),
                    onTap: () {
                      _call();
                    },
                  ),
                ),
                validator: (value) =>
                    _validateInputMobile(value, 'mobile number'),
              ),
                const SizedBox(height: 10,),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: InkWell(
                    child: buildSettingsElement(
                      Icons.email_sharp,
                    ),
                    onTap: () {
                      _sendEmail(_emailController);
                    },
                  ),
                ),
                validator: (value) => _validateInputEmail(value, 'email'),
              ),
              const SizedBox(height: 20),
              SizedBox(
                child: Center(
                  child: ElevatedButton(
                    onPressed: () => _submitForm(context),
                    child: const Text('Submit'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

