import 'package:flutter/material.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left:21.0,right: 8.0),
          child: Column(
           // mainAxisAlignment:MainAxisAlignment.center ,
            children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Welcome to Contact Manager',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Colors.indigo[900] ),),
          ),

           const SizedBox(height: 100),
            Text(
                '-This application simplifies the process of organizing   and managing your contacts.',style: TextStyle(color: Colors.indigo[300],fontWeight: FontWeight.w600),),
            const SizedBox(height: 25),
            Column(
              children: [
                Text(
                    '-It allows you to add new contacts, view, edit, search    and remove contacts.',style: TextStyle(color: Colors.indigo[300],fontWeight: FontWeight.w600),),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Text('-Also you can make calls ',style: TextStyle(color: Colors.indigo[300],fontWeight: FontWeight.w600),),
                    const Icon(
                      Icons.phone,
                      color: Colors.green,
                    ),
                    Text('and emails  ',style: TextStyle(color: Colors.indigo[300],fontWeight: FontWeight.w600),),
                    const Icon(
                      Icons.email,
                      color: Colors.blue,
                    ),
               //     Text('directly',style: TextStyle(color: Colors.indigo[300],fontWeight: FontWeight.w600),),
                  ],
                ),
                Row(
                  children: [
                    Text(' directly from the app.',style: TextStyle(color: Colors.indigo[300],fontWeight: FontWeight.w600),),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Text(' -Effortlessly add new contacts by pressing the ',style: TextStyle(color: Colors.indigo[300],fontWeight: FontWeight.w600),),
                    CircleAvatar(backgroundColor: Colors.indigo[100],
                    child: const Icon(Icons.add,color:Colors.white),
                    ),

                  ],
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
