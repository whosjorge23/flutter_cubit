import 'package:cubit_freezed/counter/cubit/counter_cubit.dart';
import 'package:cubit_freezed/counter/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Otteniamo l'istanza del Cubit
    final CounterCubit cubit = BlocProvider.of<CounterCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Count:',
              style: TextStyle(fontSize: 24),
            ),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(
                  state.count.toString(),
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              // Chiamiamo il metodo increment del Cubit
              cubit.increment();
            },
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              // Chiamiamo il metodo decrement del Cubit
              cubit.decrement();
            },
          ),
        ],
      ),
    );
  }
}