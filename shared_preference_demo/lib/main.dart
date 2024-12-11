import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var nameController = TextEditingController();
  static const String KEYNAME = 'name';
  var nameValue = 'No Value Saved';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preference'),
      ),
      body: Container(
        margin: const EdgeInsetsDirectional.symmetric(horizontal: 20),
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'name',
                label: const Text('name'),
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(15)
                )
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue),
              ),
              onPressed: () async {
                var name = nameController.text.toString();

                var prefs = await SharedPreferences.getInstance();

                prefs.setString(KEYNAME, name);
              },
              child: const Text('Save'),
            ),
            const SizedBox(height: 15),
            Text(nameValue),
            // Image.asset()
          ],
        ),
      ),
    );
  }

  void getValue() async {

    var prefs = await SharedPreferences.getInstance() ;

    var getName = prefs.getString(KEYNAME);
    
    nameValue = getName ?? 'No value Saved';

    setState(() {

    });

  }
}
