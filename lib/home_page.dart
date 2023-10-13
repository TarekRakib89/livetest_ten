import 'package:flutter/material.dart';

class HomaPage extends StatefulWidget {
  const HomaPage({super.key});

  @override
  State<HomaPage> createState() => _HomaPageState();
}

class _HomaPageState extends State<HomaPage> {
  bool selctedItem = false;
  int count = 0;
  List item = [
    {'item': 'item 1', 'flag': 0},
    {'item': 'item 2', 'flag': 0},
    {'item': 'item 3', 'flag': 0},
    {'item': 'item 4', 'flag': 0},
    {'item': 'item 5', 'flag': 0},
  ];
  selected(int index) {
    if (item[index]['flag'] == 0) {
      item[index]['flag'] = 1;
      count++;
    } else {
      item[index]['flag'] = 0;
      count--;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: item.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: item[index]['flag'] == 1 ? Colors.blue : null,
                onTap: () {
                  selected(index);
                },
                title: Text(item[index]['item']),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              content: Text('Number of selected items $count'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'close'),
                  child: const Text('close'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
