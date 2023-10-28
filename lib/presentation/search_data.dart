import 'package:aya_s_final_project/presentation/contact_details.dart';
import 'package:aya_s_final_project/presentation/edit_data_page.dart';

import 'package:flutter/material.dart';

class DataSearchDelegate extends SearchDelegate<String> {
  final List<Map<String, String>> dataList;
  final Function(Map<String, String>, int)? editDataCallback;
    final Function(int)? removeCallback;
  DataSearchDelegate(this.dataList, this.editDataCallback, this.removeCallback);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, '');
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // You can implement your detailed contact screen here.
    return Center(
      child: Text('Display the detailed contact screen here for $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? dataList
        : dataList
            .where((data) =>
                data['name']!.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]['name']!),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContactDetailPage(
                  index: dataList.indexOf(suggestionList[index]),
                     dataListe: dataList[index],
                    editDataCallback: (data, index) {
                      editDataCallback!(data, index);
                    },
                    removeCallback: ( index) {
                      removeCallback!( index);
                    },  
                 

                
                ),
              ),
            );
          },
        );
      },
    );
  }
}