import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  String result = '';

  List<dynamic> list2;

  Search(this.list2);


  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, result);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // final suggestions = names2.where((name2) {
    //   return name2.toLowerCase().contains(query.toLowerCase());
    // });
    //
    // return ListView.builder(
    //   itemCount: suggestions.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return ListTile(
    //       title: Text(
    //         suggestions.elementAt(index),
    //       ),
    //       onTap: () {
    //         result = suggestions.elementAt(index);
    //         close(context, result);
    //       },
    //     );
    //   },
    // );
    return Text('ddd');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // final suggestions = list2.where((name) {
    //   return name.toLowerCase().contains(query.toLowerCase());
    // }
    //
    // );

    final suggestions = [];
    for(var list in list2){
      for(var tmp in list['Name']){
        //print(tmp);
        //print(query);
        if(tmp.toString().toLowerCase().contains(query.toLowerCase())){
          suggestions.add(list['Name2'].toString().toLowerCase());
          break;
        }

      }
      // if(list['Name3'].toString().toLowerCase().contains(query.toLowerCase())){
      //   suggestions.add(list['Name2'].toString().toLowerCase());
      // }
    }


    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            suggestions.elementAt(index),
          ),
          onTap: () {
            
            query = suggestions.elementAt(index);
          },
        );
      },
    );
  }
}
