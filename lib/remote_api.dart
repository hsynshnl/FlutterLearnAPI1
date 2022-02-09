import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'model/user_model.dart';

class RemoteApi extends StatefulWidget {
  RemoteApi({Key? key}) : super(key: key);

  @override
  State<RemoteApi> createState() => _RemoteApiState();
}

class _RemoteApiState extends State<RemoteApi> {
  late Future<List<UserModel>> _userList;
  Future<List<UserModel>> _getUserList() async {
    try {
      var response =
          await Dio().get("https://jsonplaceholder.typicode.com/users");
      List<UserModel> _userList = [];
      if (response.statusCode == 200) {
        //başarılı 200 demekmiş
        _userList =
            (response.data as List).map((e) => UserModel.fromMap(e)).toList();
      }
      return _userList;
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }

  @override
  void initState() {
    super.initState();
    _userList = _getUserList();
  }

  @override
  Widget build(BuildContext context) {
    _getUserList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("remote api with dio"),
      ),
      body: Center(
        child: FutureBuilder<List<UserModel>>(
            future: _userList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var userList = snapshot.data!;
                return ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      var user = userList[index];
                      return ListTile(
                        title: Text(user.name),
                        subtitle: Text(user.address.toString()),
                        leading: CircleAvatar(
                          child: Text(user.id.toString()),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
