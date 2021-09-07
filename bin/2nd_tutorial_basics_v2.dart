//This was updated on August the 18th. 2021


//Futball match with dart...
import 'dart:math';

  int scoreBarca = 0;
  int scoreManch = 0;

void main() {

 
  
  String memphisName = "Memphis Depay";
  PlayerTypes? memphisPosition = barcelonaPlayerList[memphisName];
  Player memphis = Player(
    name : memphisName,
    uniform : HOME_UNIFORM,
 playerType : memphisPosition,
  number : 21);
  
   String raphaelName = "Raphael Varane";
  PlayerTypes? raphaelPosition = barcelonaPlayerList[raphaelName];
  Player raphael = Player(
    name : raphaelName,
    uniform : AWAY_UNIFORM,
 playerType : raphaelPosition,
  number : 21);
  
  //The competive Representation
  print(HOME_TEAM + "vs" + AWAY_TEAM);
  print(MATCH_NAME);
  print("you can see the match by the link :$MATCH_LINK");
  print("the match got started!!!");
  
  int random = Random().nextInt(100);
  for(int i = 0;i<random;i++){
    random = Random().nextInt(100);
    switch(i%2){
      case 0:
      attack(memphis,positionChance);
        
      break;
      case 1:
      attack(raphael,positionChance);
        
      break;
    default:
  }
  }
  
  print("The match score > $HOME_TEAM = $scoreBarca || $AWAY_TEAM = $scoreManch");
  
  
  
  }





/*/________________Const_______________/
Value must be known at compile-time, const birthday  = "2008/12/25"
Can't be changed after initialized.*/
const AWAY_TEAM    = "Manchester United";
const HOME_TEAM    = "FC Barcelona";
const MATCH_NAME   = "UCL 2011 FINAL - Barcelona Vs Manchester United";
const MATCH_LINK   = "https://www.dailymotion.com/video/x2il5ip";
const HOME_UNIFORM = "PURPLE-WHITE";
const AWAY_UNIFORM = "WHITE-BLACK";


/*/_________________Final________________/
Value must be known at run-time, final birthday = getBirthDateFromDB()
Can't be changed after initialized.*/
class Player {
  
  Player({
    this.name,
    this.uniform,
    this.playerType,
    this.number
         });
  
  final String? name;
  final String? uniform;
  final PlayerTypes? playerType;
  final int? number;
}

/*/___________Data Enumaration____________/
Enums are used when we know all possible values at compile time, 
such as choices on a menu, rounding modes, command line flags, etc. 
It is not necessary that the set of constants in an enum type stay
fixed for all time.*/
enum PlayerTypes {
  Goolkeeper,
  Forward,
  Midfield,
  Defender
}

/*/________Ternanary Operation____________/
The conditional (ternary) operator is the only Dart operator that 
takes three operands: a condition followed by a question mark (?), 
then an expression to execute if the condition is truthy followed
by a colon (:), and finally the expression to execute if 
the condition is falsy.*/

//TODO: PASS HERE.

/*/_______As A First Order Functions______/
A function that takes a function as an argument or returns 
a function as a result value called a Higher-Order Function. 
Creating a higher-order function in Dart is very simple as 
functions in Dart are first-class objects.*/

Function attack = (Player player,Function attackFunction){
  return attackFunction(player);
  };


void positionChance(Player player) {
  int i = Random().nextInt(999999);
  switch(i%2){
      case 0:
      scoreGoal(player);
      i = Random().nextInt(999999);
      break;
      case 1:
      missedBall(player);
      i = Random().nextInt(999999);
      break;
    default:
  }
}
void scoreGoal (Player player) {
  String baseName = "";
  baseName = (player.uniform == HOME_UNIFORM) ? AWAY_TEAM : HOME_TEAM;
  player.uniform == HOME_UNIFORM ? scoreBarca++ : scoreManch++;
  print('${player.name} scored a goal to $baseName');
}

void missedBall (Player player) {
  print('${player.name} missed the soccer oppurtunity..!');
}

/*/______________Dart Maps________________/
Dart Map is an object that stores data in the form of 
a key-value pair. Each value is associated with its key, 
and it is used to access its corresponding value. ... 
The Map can be declared by using curly braces {} ,
and each key-value pair is separated by the commas(,).*/

Map<String,PlayerTypes> barcelonaPlayerList = {
  "Memphis Depay": PlayerTypes.Forward,
  "Iñaki Peña" : PlayerTypes.Goolkeeper
};

Map<String,PlayerTypes> manchesterPlayerList = {
  "Raphael Varane": PlayerTypes.Defender,
  "Jadon Sancho" : PlayerTypes.Midfield
};

