import 'package:data_bloc_app/bloc/data_bloc.dart';
import 'package:data_bloc_app/bloc/data_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  //method which will use bloc and called by the button
  //will make the fields empty too
  void create(context) {
    final name = nameController.text;
    final price = priceController.text;

    BlocProvider.of<DataBloc>(context).add(
      Create(name, price),
    );

    nameController.text = '';
    priceController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: const Center(child: Text("Price Tracker")),
        ),
        body: Builder(builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //name field
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: "Enter Name",
                  ),
                ),
              ),
              //price field
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: priceController,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: "Enter price",
                  ),
                ),
              ),
              //button which will call create method
              TextButton(
                onPressed: () async {
                  create(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Upload"),
              ),
            ],
          );
        }),
      ),
    );
  }
}
