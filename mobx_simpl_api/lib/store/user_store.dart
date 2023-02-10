import 'package:mobx/mobx.dart';
import 'package:mobx_simpl_api/services/user_api.dart';

import '../moduls/user.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  final UserApi httpClient = UserApi();

  @observable
  ObservableFuture<List<User>> userList =
      ObservableFuture<List<User>>.value([]);

  @action
  Future fetchData() async {
    userList = ObservableFuture(
      httpClient.getData(
          'https://jsonplaceholder.typicode.com/posts/'
      ).then((users) => users),
    );
  }

  void theUser(){
    fetchData();
  }
}
