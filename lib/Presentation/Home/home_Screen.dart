import 'package:bloc_assign/Data/apiService.dart';
import 'package:bloc_assign/Presentation/Home/Bloc/counter_bloc.dart';
import 'package:bloc_assign/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc,CounterState>(
                builder: (context,state)  {
                  final api = locator<ApiServices>();
                  return Text(ApiServices.binary);
                }
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){counterBloc.add(const IncrementStarted());}, child: const Icon(Icons.add)),
                BlocBuilder<CounterBloc,CounterState>(
                    builder: (context,state)  {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${state.count}'),
                      );
                    }
                ),
                ElevatedButton(onPressed: (){counterBloc.add(const DecrementStarted());}, child: const Icon(Icons.remove)),

              ],
            ),
          ],
        ),
      )
       
    );
  }
}
