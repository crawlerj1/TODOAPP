import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TODO",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  List<String> todos = [];

  TextEditingController todoController = TextEditingController();
  // ignore: unused_field
  Color _color = Colors.black;
  void colorchange() {
    setState(() {
      _color = Colors.green;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("TO-DOs "),
        ),
        body: Column(children: [
          Expanded(
              child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                leading: IconButton(
                    icon: const Icon(
                      Icons.check_circle,
                      color: Colors.white10,
                    ),
                    onPressed: () {
                      colorchange();
                    }),
                title: Text(todos[index]),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Color.fromARGB(255, 246, 85, 57),
                  ),
                  onPressed: () {
                    setState(() {
                      todos.removeAt(index);
                    });
                  },
                ),
              ));
            },
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                controller: todoController,
                decoration: const InputDecoration(
                    labelText: 'Add Todo',
                    suffixIcon: Icon(Icons.text_snippet),
                    suffixIconColor: Color.fromARGB(255, 64, 104, 114),
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 255, 252, 252)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 90, 88, 88)))),
                onSubmitted: (title) {
                  setState(() {
                    todos.add(title);
                    todoController.clear();
                  });
                }),
          ),
        ]));
  }
}
