import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learning/bloc/auth_bloc.dart';
import 'package:flutter_bloc_learning/widgets/gradient_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //context.watch(); will continusly listen changes in the given bloc
    final authState = context.watch<AuthBloc>().state as AuthSuccess;
    return Scaffold(
      appBar: AppBar(
        title: Text(authState.uid),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GradientButton(
              onTap: () {},
              title: "Log Out",
            )
          ],
        ),
      ),
    );
  }
}
