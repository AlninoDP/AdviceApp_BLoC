import 'package:adviceapp/application/pages/advice_page/cubit/advicer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdviceButton extends StatelessWidget {
  const AdviceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 20,
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            BlocProvider.of<AdvicerCubit>(context).adviceRequested();
          },
          borderRadius: BorderRadius.circular(10),
          child: Ink(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.deepPurple[100],
            ),
            child: const Text(
              "Get Advice",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ));
  }
}
