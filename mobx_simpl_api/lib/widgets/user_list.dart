import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_simpl_api/store/user_store.dart';
import '../services/user_api.dart';
import '../moduls/user.dart';

class UserList extends StatelessWidget {
  final UserStore store = UserStore();

  UserList(){
    store.theUser();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        switch (store.userList.status) {
          case FutureStatus.pending:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case FutureStatus.rejected:
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Failed to load items.',
                    style: TextStyle(color: Colors.red),
                  ),
                  ElevatedButton(
                    onPressed: _refresh,
                    child: const Text('Tap to retry'),
                  ),
                ],
              ),
            );
          case FutureStatus.fulfilled:
            final List<User> users = store.userList.result;
            print(users);
            return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: users.length,
                itemBuilder: (_, index){
                  final user = users[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('${user.userId}'),
                      ),
                      title: Text(user.title),
                      subtitle: Text(user.body),
                      trailing: Text('${user.id}'),
                    ),
                  );
                }
              ),
            );
            break;
        }
      },
    );
  }

  Future _refresh() => store.fetchData();
}
