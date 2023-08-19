import 'package:adviceapp/application/pages/advice_page/cubit/advicer_cubit.dart';
import 'package:adviceapp/application/pages/advice_page/widgets/advice_button.dart';
import 'package:adviceapp/application/pages/advice_page/widgets/advice_field.dart';
import 'package:adviceapp/application/pages/advice_page/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdvicePageWrapper extends StatelessWidget {
  const AdvicePageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdvicerCubit(),
      child: const AdvicePage(),
    );
  }
}

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Advice Page"),
        backgroundColor: Colors.deepPurple[100],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(child: Center(
              child: BlocBuilder<AdvicerCubit, AdvicerState>(
                builder: (context, state) {
                  if (state is AdvicerInitial) {
                    return const Text(
                      'Your Advice is Waiting For You !',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    );
                  } else if (state is AdvicerStateLoading) {
                    return CircularProgressIndicator(
                        color: Colors.deepPurple[200]);
                  } else if (state is AdvicerStateLoaded) {
                    return AdviceField(adviceText: state.advice);
                  } else if (state is AdvicerStateError) {
                    return ErrorMessage(message: state.errorMsg);
                  }
                  return const SizedBox();
                },
              ),
            )),
            const SizedBox(
                height: 100,
                child: Center(
                  child: AdviceButton(),
                )),
          ],
        ),
      ),
    );
  }
}
