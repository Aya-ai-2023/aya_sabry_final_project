
import 'package:flutter/material.dart';



class EditDataPage extends StatefulWidget {
  final int index;
  final List<Map<String, String>> dataList;
  final Function(Map<String, String>, int) editData;

  const EditDataPage({Key? key, required this.index, required this.dataList, required this.editData}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EditDataPageState createState() => _EditDataPageState();
}

class _EditDataPageState extends State<EditDataPage> {
  late TextEditingController _nameController;
  late TextEditingController _mobileNumberController;
  late TextEditingController _emailController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.dataList[widget.index]['name']);
    _mobileNumberController = TextEditingController(text: widget.dataList[widget.index]['mobileNumber']);
    _emailController = TextEditingController(text: widget.dataList[widget.index]['email']);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _mobileNumberController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  bool validateName(String name) {
    final nameRegex = RegExp(r'^[a-zA-Z]+[ a-zA-Z]*$');
    return nameRegex.hasMatch(name);
  }

  bool validateEmail(String email) {
    final emailRegex = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:.[a-zA-Z0-9-]+)*$");
    return emailRegex.hasMatch(email);
  }

  bool validateMobileNumber(String mobileNumber) {
    final mobileNumberRegex = RegExp(r'^(?:[+0][1-9])?[0-9]{3,15}$');
    return mobileNumberRegex.hasMatch(mobileNumber);
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

  String? _validateInputMobile(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter a $fieldName.';
    }
    if (!validateMobileNumber(value)) {
      return 'Please enter a valid $fieldName.';
    }
    return null;
  }

  void _editData() {
    if (_formKey.currentState!.validate()) {
      final data = {
        'name': _nameController.text,
        'mobileNumber': _mobileNumberController.text,
        'email': _emailController.text,
      };
      widget.editData(data, widget.index);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Data'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) => _validateInputName(value, 'name'),
              ),
              TextFormField(
                controller: _mobileNumberController,
                decoration: const InputDecoration(
                  labelText: 'Mobile Number',
                ),
                validator: (value) => _validateInputMobile(value, 'mobile number'),
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) => _validateInputEmail(value, 'email'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _editData,
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
