import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takrorlashim/screens/home_cubit.dart';
import 'package:takrorlashim/screens/home_state.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountCubit(),
      child: BlocConsumer<CountCubit, CountState>(builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 380,
                    child: Center(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: InkWell(
                              child: CircleAvatar(
                                backgroundColor:
                                    context.watch<CountCubit>().colores[index],
                                radius: 25,
                                child: Text(
                                  context
                                      .watch<CountCubit>()
                                      .sonlar[index]
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: context.watch<CountCubit>().color,
                                  ),
                                ),
                              ),
                              onTap: () {
                                context.read<CountCubit>().tekshir(index);
                              },
                            ),
                          );
                        },
                        itemCount: context.watch<CountCubit>().sonlar.length,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  context.read<CountCubit>().toldir();
                  context.read<CountCubit>().rang();
                },
                child: const Icon(Icons.add),
              ),
            ],
          ),
        );
      }, listener: (context, state) {
        if (state is ChangeError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Oyin tugadi"),
            ),
          );
        }
      }),
    );
  }
}
