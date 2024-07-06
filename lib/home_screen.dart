import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/bloc/auth_bloc.dart';
import 'package:flutter_bloc_state_management/login_screen.dart';
import 'package:flutter_bloc_state_management/widgets/gradient_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Home Page"),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) {
                  return const LoginScreen();
                },
              ),
              (Route<dynamic> route) => false,
            );
          }
        },
        builder: (BuildContext context, AuthState state) {
          if (state is AuthLoading) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is AuthSuccess) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.uid),
                    const SizedBox(
                      height: 48,
                    ),
                    GradientButton(
                      text: "Log out",
                      onPressed: () =>
                          context.read<AuthBloc>().add(AuthLogOutRequested()),
                    )
                  ],
                ),
              ),
            );
          }
          if (state is AuthFailure) {
            return Center(
              child: Text(state.error),
            );
          }
          return const Center(
            child: Text("Please log in."),
          );
        },
      ),
    );
  }
}
