import 'package:final_project/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/cart_state.dart';
import 'modules/bottombar/bottom_nav_bar.dart';
import 'modules/cart/cart_screen.dart';
import 'modules/login/login_screen.dart';
import 'modules/signup/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return BlocProvider<CartBloc>(
      create: (context)=> CartBloc(InitialState()),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red
        ),
        debugShowCheckedModeBanner: false,
        home: Loginscreen(),
      ),

    );
  }
}
