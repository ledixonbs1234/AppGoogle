import 'package:app_google/blocs/bloc_login/bloc_login.dart';
import 'package:app_google/repos/repo_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final RepoUser _repoUser ;

  LoginScreen({Key key, @required RepoUser repoUser}):assert(repoUser!= null),_repoUser = repoUser,super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('Login'),),
      body:BlocProvider<BlocLogin>( 
        create: (context) =>BlocLogin(repoUser :_repoUser),
        child : LoginForm(repoUser : _repoUser)
      )
    );
  }
  

}