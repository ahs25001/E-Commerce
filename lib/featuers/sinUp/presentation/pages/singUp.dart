import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/sign_up_bloc.dart';

class SingUp extends StatelessWidget {
  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state.screenStatus == ScreenStatus.loading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const AlertDialog(
                  backgroundColor: Colors.transparent,
                  title: Center(child: CircularProgressIndicator())),
            );
          } else if (state.screenStatus == ScreenStatus.successfully) {}
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text("signUp")),
            floatingActionButton: FloatingActionButton(
              onPressed: () => SignUpBloc.get(context).add(RegisterEvent()),
            ),
          );
        },
      ),
    );
  }
}
