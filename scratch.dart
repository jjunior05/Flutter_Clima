import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String result = await task2();
  task3(result);
}

void task1() {
  String result = 'Task 1 data';
  print('Task 1 complete');
}

Future task2() async {
  String result;
  Duration threeSeconds = Duration(seconds: 3);
  await Future.delayed(threeSeconds, () {
    result = 'Task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String dataTask2) {
  String result = 'Task 3 data';
  print('Task 3 complete with $dataTask2');
}
