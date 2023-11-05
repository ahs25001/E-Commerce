import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/featuers/sinUp/presentation/bloc/sign_up_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.screenStatus == ScreenStatus.loading) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Center(child: CircularProgressIndicator())),
            );
          }
          else if (state.screenStatus==ScreenStatus.successfully){
            showDialog(context: context, builder: (context) => AlertDialog(content: Row(children: [
              Icon(Icons.done),

            ],)),);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.blue,
            appBar: AppBar(title: Text("Login")),
            floatingActionButton: FloatingActionButton(
              onPressed: () => LoginBloc.get(context).add(LoginButtonEvent()),
            ),
          );
        },
      ),
    );
  }
}
