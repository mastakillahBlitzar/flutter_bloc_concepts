import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_concepts/logic/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('counterCubit', () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test("initial state is counterValue:0", () {
      expect(counterCubit.state, CounterState(counterValue: 0));
    });

    blocTest<CounterCubit, CounterState>(
      'the cubit should emit counterstate with counterValue: 1, wasIncremented: true when cubit.increment() function is called',
      build: () => counterCubit,
      act: (cubit) => cubit.incremet(),
      expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
    );

    blocTest<CounterCubit, CounterState>(
      'the cubit should emit counterstate with counterValue: 1, wasIncremented: true when cubit.increment() function is called',
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: () => [CounterState(counterValue: -1, wasIncremented: false)],
    );
  });
}
