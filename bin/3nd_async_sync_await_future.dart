//link : https://dartpad.dev/49e5d429afe676479a4facf04d4c9b14


void main() {

  // syncronousTasksExecuter();
  asyncronousTaskExecuter();
  
  // // // // // // // // // //
  
 // waitedTaskForLongRunningProcess();
  
}


void syncronousTasksExecuter() {
  print("\n\n\n\n STARTED SYNC PROCESS \n");
  //sync
  task1();
  task2();
  task3();
}

void asyncronousTaskExecuter() {
   print("\n\n\n\n STARTED ASYNC PROCESS \n");
  //async
  task1();
  futureTask2(printing : "ASYNC's successfuly running...");
  task2();
  task3();
}

void waitedTaskForLongRunningProcess() async {
   print("\n\n\n\n AWAITED ASYNC PROCESS \n");
  task1();
  String text = await futureTask2();
  stringPrinter(text : text);
  task2();
  task3();
}


void task1 (){
  print("TASK 1st was called.");
}

void task2 (){
  print("TASK 2nd was called.");
}

Future<String> futureTask2 ({String? printing = null}) async {
  Duration fiveSeconds = Duration(seconds: 5);
  String text = "";
  await Future.delayed(fiveSeconds, (){
    text = "futureTask2";
  });
  if(printing != null){
    print(printing);
  }
  return text;
}

void task3 (){
   print("TASK 3th was called.");
}

void stringPrinter({required String text}){
  print('$text was seen!');
}