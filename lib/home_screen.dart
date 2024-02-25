import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learning/bloc/auth_bloc.dart';
import 'package:flutter_bloc_learning/login_screen.dart';
import 'package:flutter_bloc_learning/widgets/gradient_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial) {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) {
            return const LoginScreen();
          }), (route) => false);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Scaffold(
          appBar: AppBar(
            title: Text((state as AuthSuccess).uid),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GradientButton(
                  onTap: () {
                    context.read<AuthBloc>().add(AuthLogOutRequested());
                  },
                  title: "Log Out",
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
