// ignore: unused_import
import 'dart:ffi';
import 'dart:math';
import 'dart:io';

void main() => Game();

//oob -> create your own data type with class
// how to create a constructor in the class.
class Book {
  Book(String name, String author, int numPages, bool isThick,
      String whatKindOf) {
    this.name = name;
    this.author = author;
    this.numPages = numPages;
    this.isThick = isThick;
    this.whatKindOf = whatKindOf;
  }
  String? name;
  String? author;
  int? numPages;
  bool? isThick;
  String? whatKindOf;
}

void objectOrientedTraining(int howMuchPrinting) {
  Book hp = Book("Harry Potter - Sorcerrer's Stone", "JK Rowling", 450, true,
      "Fantastic Novel");
  Book oms = Book(
      "The Old Man and The Sea", //its name
      "Ernest Hemingway", //author
      187, //numPages
      false, //thick or thin?
      "Classic Novel"); //what kind of book

  List<Book> books = [hp, oms];

  for (int i = 0; i < howMuchPrinting; i++) {
    int randomInt = Random().nextInt(2);
    print(books[randomInt].name.toString());
  }

  /*Book OMS = Book();
  OMS.name = "The Old Man and The Sea";
  OMS.author = "Ernest Hemingway";
  OMS.numPages = 187;
  OMS.isThick = false;
  OMS.whatKindOf = "Novel";

  print(OMS.name! +
      OMS.author.toString() +
      " " +
      OMS.numPages.toString() +
      " " +
      "isTheBookThick? = " +
      " " +
      OMS.isThick!.toString() +
      " " +
      "What kind of book is it? = " +
      OMS.whatKindOf!); */
}

void whileLoop(String string, int num) {
  //how to use while loop?
  List<String> stringList = [];
  int i = 0;
  while (i < num) {
    stringList.add(string + i.toString());
    i++;
  }
  print("there are " + stringList.length.toString() + "objects in the list.");
  //how to use for loop?
  for (i = 0; i < num; i++) {
    print(stringList[i].toString());
  }
}

void runSmartCalculater() {
  double num1 = promptDouble();
  double num2 = promptDouble();
  String operator = prompt("enter an operation {+,-,*,/}");
  if (operator == "+") {
    print(num1 + num2);
    runSmartCalculater();
  } else if (operator == "-") {
    print(num1 - num2);
    runSmartCalculater();
  } else if (operator == "*") {
    print(num1 * num2);
    runSmartCalculater();
  } else if (operator == "/") {
    print(num1 / num2);
    runSmartCalculater();
  } else {
    print("Invalid Operation");
    runSmartCalculater();
  }
}

double promptDouble() {
  print('enter a number');
  String? sign = stdin.readLineSync();
  sign ??= "0.0"; //bind a default value.
  return double.parse(sign);
}

String prompt(String question) {
  print(question);
  String? answer = stdin.readLineSync();
  answer ??= "";
  return answer;
}

void pyramidMaker(int numb) {
  //for statement and function
  for (var i = numb; i > 0; i--) {
    print(' /|');
    print('/||');
    print('\||');
    print(' \|');
  }
}

void inputOutput() {
  print("enter first number?");
  int? numb1 = int.tryParse(stdin.readLineSync()!);
  print("enter second number?");
}

void realMethod() {
  print("Enter first number");
  String? num1 = stdin.readLineSync();
  print("Enter second number");
  String? num2 = stdin.readLineSync();

  int? n1 = int.tryParse(num1!);
  int? n2 = int.tryParse(num2!);
  if (n1 != null && n2 != null) {
    print("My number is ${n1.toString()}");
    print("${n1 + n2}");
  } else {
    n1 ??= 1;
    n2 ??= 2;
    print(n1 + n2);
  }
}

void toplama() {
  String? foo = 'a string';
  String? bar; //null
  bar ??= 'burhan';
  String? baz = foo + '   ' + bar;
  print("baz matched with foo" + baz);
  print("bar matched with foo" + bar);
  print(baz);
}

void repeating1() {
  print('what is your name ?');
  String? name = stdin.readLineSync();
  print('Hello $name');
}

int add(int? numb1, int? numb2) {
  numb1 ??= 0;
  numb2 ??= 0;
  return numb1 + numb2;
}

void codinAdd() {
  print('enter first number');
  String? numb1 = stdin.readLineSync();
  print('enter second number');
  String? numb2 = stdin.readLineSync();
  int? i1 = int.tryParse(numb1!);
  int? i2 = int.tryParse(numb2!);
  i1 ??= 0;
  i2 ??= 0;
  String result = "${add(i1, i2)}";
  print("result =  " + result);
}

void nullSafetyWithQuestionMark() {
  //exclamation mark (!) is used to swear that I'm really sure that it's not a null.
  int? myObject = null;
  dynamic resOrgin =
      myObject?.compareTo(2); //the one above and the one belove are the same.
  dynamic result = (myObject != null) ? myObject.compareTo(2) : null;
  print(resOrgin);
}

int? nullFunction(int arg1, int arg2) {
  //try calling this method , writing nullFunction?.call(arg1,arg2);
  return null;
}

/*late int numberOne; Bu şekilde birden fazla komut çalıştırabilirsin.
    numberOne.compareTo(2)
    ..isOdd
    ..sign
    ..hashCode
    ..isInfinite
    ..remainder(5)
    ..toInt()
    ..truncate()
    ..isEven; */

void PoemTraining() {
  print('Siir olusturucuya hosgeldin...');
  print('               🌼 ');
  print('             🌼   ');
  print('           🌼     ');
  print('         🌼       ');
  print('       🌼         ');
  print('     🌼           ');
  print('Bir çoğul cins ismi yaz(orn : agaclar,cicekler..etc)');
  String? cinsIsim = stdin.readLineSync();
  cinsIsim ??= "Agaclar"; //default
  print('Bir mevsim yaz.');
  String? mevsim = stdin.readLineSync();
  mevsim ??= "sonbahar";
  print('Bir sehir yaz.');
  String? sehir = stdin.readLineSync();
  sehir ??= "Istanbul";
  print(
      'Bir seyin nerede oldugunu söyle(orn: mezarda,kutahyada,kulubede..etc)');
  String? nerede = stdin.readLineSync();
  nerede ??= "Karanlıkta";
  print('Neye ne oluyor?(orn: yanıyor,kanıyor,yarılıyor...etc)');
  String? nelerOluyor = stdin.readLineSync();
  nelerOluyor ??= "yaniyor";
  print('Bir kisi ismi alabilir miyim?');
  String? kisiAdi = stdin.readLineSync();
  kisiAdi ??= "Murat";
  print('Bir cogul kisi ismi daha alabilir miyim?');
  String? kisiAdi2 = stdin.readLineSync();
  kisiAdi2 ??= "Huseyin";
  print('');
  print('');
  print('');
  print('');
  print('');
  print('');
  print('');
  print('');
  print('');
  print('');
  print('');
  print('');
  print('');
  print('');
  print('         🌸🌸  ${kisiAdi.toUpperCase()} SiiRi   🌸🌸');
  print('');
  print('');
  print("     $cinsIsim ${mevsim}а hаzırlаnıyor...    💐");
  print("     Bu sehir o eski $sehir midir..?         💐");
  print("     $nerede bulutlar parcalanıyor...        💐");
  print("     Sokаk lаmbаlаrı birden ${nelerOluyor}...💐");
  print("     Ben sаnа mecburken $kisiAdi...         💐");
  print('     Sen ise ${kisiAdi2} ile birliktesin...   💐');

  /* 
      
      #Ağаçlаr #sonbаhаr/а hаzırlаnıyor 
      Bu şehir o eski #İstаnbul mudur 
      #Kаrаnlıktа bulutlаr pаrçаlаnıyor 
      Sokаk lаmbаlаrı birden #yаnıyor 
      Kаldırımlаrdа #yаğmur kokusu 
      Ben sаnа mecburum # sen yoksun.


       */
}

//MY OWN MATH QUIZ PROGRAM
class Game {
  int? challangeLevel;
  Player? player;

  Game() {
    print("Welcome to the math quiz game..");
    startGame();
  }

  void startGame() {
    String? userName = player?.userName;

    if (player == null) {
      print("What is your name?");
      userName = stdin.readLineSync();
    }

    if (userName != null && userName.length > 3 && userName.length < 15) {
      player = Player(userName);
      print("What is your math level ? (0,1,2,3)");
      String? userLevel = stdin.readLineSync();
      if (userLevel != null) {
        int? level = int.tryParse(userLevel);
        if (level != null && level < 4 && level >= 0) {
          int? health = player?.health;
          for (health; health! > 0; health) {
            Question question = newQuestion(level);
            print(question.question);
            String? userAnswer = stdin.readLineSync();
            double? ans = double.tryParse(userAnswer!);
            if (ans != null) {
              if (question.checkQuestion(ans)) {
                player!.correctAnswer();
              } else {
                health = player!.madeMistake();
                print("your health $health left");
              }
            }
          }
          int score = player!.correctAnswer() - 1;
          print("your score = $score //");
          print("Do you wanna try again $userName?");
          String? check = stdin.readLineSync();
          if (check != null && check == "yes") {
            print("okey, I am making the game run.! , Good game $userName");
            startGame();
          } else {
            print("good bye $userName");
          }
        } else {
          print("invalid level");
          startGame();
        }
      }
    } else {
      print("your name must be between 3 - 13 characters.");
      startGame(); //start again.
    }
  }

  Question newQuestion(int level) {
    int? score = player?.score;
    score ??= 0;
    int? first;
    int? second;
    List<String> operators = [
      "+",
      "-",
      "*",
      "/",
    ];
    double? answer;

    if (level == 0) {
      first = Random().nextInt(10 + score * 5);
      second = Random().nextInt(10 + score * 5);
    } else if (level == 1) {
      first = Random().nextInt(100 + score * 50);
      second = Random().nextInt(100 + score * 50);
    } else if (level == 2) {
      first = Random().nextInt(1000 + score * 500);
      second = Random().nextInt(1000 + score * 500);
    } else if (level == 3) {
      first = Random().nextInt(10000 + score * 5000);
      second = Random().nextInt(10000 + score * 5000);
    }
    int i = Random().nextInt(4);
    if (operators[i] == "+") {
      answer = first!.toDouble() + second!.toDouble();
    } else if (operators[i] == "-") {
      answer = first!.toDouble() - second!.toDouble();
    } else if (operators[i] == "*") {
      answer = first!.toDouble() * second!.toDouble();
    } else if (operators[i] == "/") {
      answer = first! / second!;
    }
    if (first! > second!) {
      String question =
          first.toString() + " " + operators[i] + " " + second.toString();
      Question QUE = Question(question, answer!);
      return QUE;
    } else {
      return newQuestion(level);
    }
  }
}

class Player {
  String userName = "";
  int? score;
  int? health;

  Player(String userName) {
    this.userName = userName;
    health = 3;
    score = 0;
  }

  int madeMistake() {
    health = health! - 1;
    print("this is incorrect.. unfortunately..");
    return health!;
  }

  int correctAnswer() {
    score = score! + 1;
    print("this is correct , other one is coming...");
    return score!;
  }
}

class Question {
  String? question;
  double? answer;

  Question(String question, double answer) {
    this.question = question;
    this.answer = answer;
  }

  bool checkQuestion(double answer) {
    return this.answer == answer;
  }
}
