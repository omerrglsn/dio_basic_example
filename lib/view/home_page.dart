import 'package:dio_example/viewModel/user_view_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel viewModel = UserViewModel();
    viewModel.fetch();

    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: ValueListenableBuilder(
        valueListenable: viewModel.users,
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: viewModel.users.value.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(viewModel.users.value[index].firstName ?? ''),
                  subtitle: Text(viewModel.users.value[index].lastName ?? ''),
                  leading: Image.network(viewModel.users.value[index].avatar!),
                  trailing: Text(viewModel.users.value[index].id!.toString()),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
