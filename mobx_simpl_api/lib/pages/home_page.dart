import 'package:flutter/material.dart';
import 'package:mobx_simpl_api/widgets/user_list.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePaheState();
}

class _HomePaheState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rest Api"),
      ),
      body: UserList(),
    );
  }
}
