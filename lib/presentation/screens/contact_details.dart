

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// class ContactDetailPage extends StatelessWidget {
//   final Contact contact;

//   const ContactDetailPage({Key? key, required this.contact}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Contact Detail'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Name: ${contact.name}',
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             Text('Mobile Number: ${contact.mobileNumber}', style: const TextStyle(fontSize: 16)),
//             const SizedBox(height: 10),
//             Text('Email: ${contact.email}', style: const TextStyle(fontSize: 16)),
//           ],
//         ),
//       ),
//     );
//   }
// }





// class ContactDetailPage extends StatelessWidget {
//   final Contact contact;
//   final Function? deleteContact;
//   final Function? editContact;

//   const ContactDetailPage({
//     Key? key,
//     required this.contact, this.deleteContact, this.editContact,

//   }) : super(key: key);


//    void _call(String val) async {
    
  
//     String url = "tel:$val";
//     // ignore: deprecated_member_use
//     if (await canLaunch(url)) {
//       // ignore: deprecated_member_use
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }}
   
  
  

//   // void _sendEmail(String email) async {
//   //   final Uri emailLaunchUri = Uri(
//   //     scheme: 'mailto',
//   //     path: email,
//   //     query: 'subject=Example Subject',
//   //   );
//   //   if (await canLaunchUrl(emailLaunchUri.toString() as Uri)) {
//   //     await launchUrl(emailLaunchUri.toString() as Uri);
//   //   } else {
//   //     throw 'Could not launch $emailLaunchUri';
//   //   }
//   // }

//    void _sendEmail(String mail) async {
//    // var url = "mailto:${_emailController.text}"; 
  
//     final Uri emailLaunchUri = Uri(
//     scheme: 'mailto',
//     path: mail,
//     query: <String, String>{
//       'subject': 'Example Subject ',
//     }.entries
//       .map((MapEntry<String, String> e) =>
//           '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
//       .join('&'),
//   );
//     //mailto:
//     // ignore: deprecated_member_use
   
//     if (await launchUrl(emailLaunchUri)) {
//       // ignore: deprecated_member_use
//       await launchUrl(emailLaunchUri);
//     } else {
//       throw 'Could not launch $emailLaunchUri';
//     }
//     }
   


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Contact Detail'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               CircleAvatar(
//                 radius: 50,
//                 child: Text(
//                   contact.name.substring(0, 1),
//                   style: const TextStyle(fontSize: 40),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 'Name: ${contact.name}',
//                 style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               Text('Mobile Number: ${contact.mobileNumber}', style: const TextStyle(fontSize: 16)),
//               const SizedBox(height: 10),
//               Text('Email: ${contact.email}', style: const TextStyle(fontSize: 16)),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     onPressed: () => _call(contact.mobileNumber),
//                     icon: const Icon(Icons.phone),
//                     color: Colors.green,
//                   ),
//                   IconButton(
//                     onPressed: () => _sendEmail(contact.email),
//                     icon: const Icon(Icons.email),
//                     color: Colors.blue,
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       editContact!(context, contact);
//                     },
//                     child: const Text('Update'),
//                   ),
//                   const SizedBox(width: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       deleteContact!(context, contact);
//                     },
//                     style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                     child: const Text('Delete'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// ignore: must_be_immutable
class ContactDetailPage extends StatelessWidget {
  final Map<String, String> dataListe;
  final Function(Map<String, String>, int)? editDataCallback;
  final Function(int)? removeCallback;
  final int index;

  // ignore: prefer_const_constructors_in_immutables
  ContactDetailPage({super.key, 
    required this.dataListe,
    required this.editDataCallback,
    required this.removeCallback,
    required this.index,
  });
  





   void _call(String val) async {
    
  
    String url = "tel:$val";
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }}


  // void _sendEmail(String email) async {
   void _sendEmail(String mail) async {
   // var url = "mailto:${_emailController.text}"; 
  
    final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: mail,
    query: <String, String>{
      'subject': 'Example Subject ',
    }.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&'),
  );
    //mailto:
    // ignore: deprecated_member_use
   
    if (await launchUrl(emailLaunchUri)) {
      // ignore: deprecated_member_use
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
    }
    String getfullname_1(){
return dataListe['lastName'] ==null?'${dataListe['name']![0].toUpperCase()}${dataListe['name']!.substring(1)}' : '${dataListe['name']![0].toUpperCase()}${dataListe['name']!.substring(1)} ${dataListe['lastName']}';

    }

  @override
  Widget build(BuildContext context) {
   // dataListe['lastName'] ?? (dataListe['lastName']='');
   // String fullName = '${dataListe['name']![0].toUpperCase()}${dataListe['name']!.substring(1)} ${dataListe['lastName']}';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Details'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top:95.0,left: 20,right: 20),
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                child: Text(
                  dataListe['name']!.substring(0, 1),
                  style: const TextStyle(fontSize: 40),
                ),
              ),
              const SizedBox(height: 20),

              Text(
                ' ${getfullname_1()}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 10),
                  Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  IconButton(
                    onPressed: () => _call(dataListe['mobileNumber']!),
                    icon: const Icon(Icons.call),
                    color: Colors.green,
                    iconSize: 25,
                    highlightColor: Colors.lightGreenAccent,
                  ),
                  IconButton(
                    onPressed: () => _sendEmail(dataListe['email']!),
                    icon: const Icon(Icons.email),
                    color: Colors.blue,
iconSize: 25,

                  ),
                ],
                
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                   const  Text('Mobile Number: ', style:  TextStyle(fontSize: 15,color: Colors.indigo,fontWeight: FontWeight.bold)),
                Text(' ${dataListe['mobileNumber']}', style: const TextStyle(fontSize: 15)),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only( left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Email : ', style: TextStyle(fontSize: 15,color: Colors.indigo,fontWeight: FontWeight.bold)),
                    Text('${dataListe['email']}', style: const TextStyle(fontSize: 15)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
          
              const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
//                 children: [

// ElevatedButton(
//   onPressed:// editDataCallback != null
//       () {
//           Navigator.of(context).pop();
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => EditDataPage(
//                 index: index,
//                 dataList: 
// editData: (data, index) {
// editDataCallback!(data, index);
// },
                
//               ),
//             )
//           );
//         }
//       ,
//   child: const Text('Update'),
// ),

          
              
    



//                //  ElevatedButton(
// //   onPressed: editDataCallback != null
// //       ? () {
// //           Navigator.of(context).pop(); // Close the current page
// //           editDataCallback!(dataList, 0);
// //         }
// //       : null,
// //   child: const Text('Update'),
// // ),

// //                   const SizedBox(width: 20),
//               ElevatedButton(
//   onPressed: removeCallback != null ? () => removeCallback!(index) : null,
//   style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//   child: const Text('Delete'),
// ),

//                 ],
//               ),
            ],
          ),
        ),
      ),
    );
  }
}

