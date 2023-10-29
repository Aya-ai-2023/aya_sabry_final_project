
import 'package:flutter/material.dart';



class EditDataPage extends StatefulWidget {
  final int index;
  final List<Map<String, String>> dataList;
  final Function(Map<String, String>, int) editData;

   const EditDataPage({Key? key, required this.index, required this.dataList, required this.editData,}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EditDataPageState createState() => _EditDataPageState();
}

class _EditDataPageState extends State<EditDataPage> {
  late TextEditingController _nameController;
  late TextEditingController _mobileNumberController;
  late TextEditingController _emailController;
  late TextEditingController _lastNameController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.dataList[widget.index]['name']);
    _mobileNumberController = TextEditingController(text: widget.dataList[widget.index]['mobileNumber']);
    _emailController = TextEditingController(text: widget.dataList[widget.index]['email']);
    _lastNameController = TextEditingController(text: widget.dataList[widget.index]['lastName']);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _mobileNumberController.dispose();
    _emailController.dispose();
    _lastNameController.dispose();
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
        'lastName': _lastNameController.text,
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
                 ),),
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
                decoration: const InputDecoration(
                  labelText: 'Mobile Number',
                    hintText: 'Enter your mobile number',
                  prefixIcon: Icon(
                    Icons.call,
                    color: Colors.indigo,
                  
                  )
                ),
                validator: (value) => _validateInputMobile(value, 'mobile number'),
              ),
              
                  
              
      
                const SizedBox(height: 10,),
                  TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                  prefixIcon: Icon(
                    Icons.email_sharp,
                    color: Colors.indigo,
                  ),
                  labelText: 'Email',
                ),
                validator: (value) => _validateInputEmail(value, 'email'),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _editData,
                  child: const Text('Update'),
                ),
              ),
            ],
              ))));
  }
}

/*


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
                   SizedBox(height: 10,),
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
                SizedBox(height: 10,),
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
              SizedBox(height: 10,),
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
                SizedBox(height: 10,),
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
    );*/