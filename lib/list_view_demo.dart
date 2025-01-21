import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const DynamicListViewWithSeparatorDemo());
}

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: ListView(
        children: const [Text("Hello, World!"), Text("Item 1"), Text("Item 2")],
      ),
    ));
  }
}


Widget dynamic_separated_list(){
  return ListView.separated( itemBuilder: (context,index){
    return ListTile(
      leading: Icon(FontAwesomeIcons.circleCheck),
      title: Text("Hello"),
      subtitle: Text("This is a subtitle",
      style: TextStyle(color:Colors.grey)),
    );
  },
    separatorBuilder: (context,index) => Divider(), itemCount: 20,
  );
}

class DynamicListViewWithSeparatorDemo extends StatelessWidget{
  const DynamicListViewWithSeparatorDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        body: dynamic_separated_list()
      )
    );
  }

}


class DynamicListViewDemo extends StatelessWidget{
  const DynamicListViewDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        body: ListView.builder(
          itemCount: 30,
          itemBuilder: (context,index){
            return ListTile(
              leading:const Icon(Icons.add),
              title: Text("Item ${index+1}")
            );
          },
        )
      )
    );
  }
}