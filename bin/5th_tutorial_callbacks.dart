/** Welcome the Learning Dart tutorial this lesson is  
 * all about callbacks in the dart programming language
 * @author  Huseyin Uslu
 * @since   29.10.2021 */

import 'dart:io';

//if you carefully view this project , you can see that DeepClass sends mainClass sort of strings
// and these are read in the main class syncrhonously.

void main() {
  DeepClass deepClass = DeepClass(callback: ({required String reply}) {
    print(reply);
  });
  deepClass.main();
}

class DeepClass {
  final Function callback;
  final _list = [
    "Hello",
    "GoodMorning",
    "How are you today?",
    "I'm great too.",
    "What are you doin'?",
    "just nothing!",
    "see you later.."
  ];

  DeepClass({required this.callback});

  void main() {
    for (int i = 0; i < _list.length; i++) {
      sleep(Duration(seconds: 2));
      callback(reply: _list[i]);
    }
  }
}
