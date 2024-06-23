
// return type [optional] name of function '('    arguments, parameters ')' '{'  '}'
main() async{
  // function statement
}

// asynchronous function
Future<int> getData(String name, int age) async {
  // function statement

  return 10;
}


// optional return type function
sayHello(String name) {
  // function statement


  captureHashCode(name: 'Vivek');

  calculateTotal(200,second: null);
}

int get hashCode1 => 1;
set hashCode1(on) => 1;


// access a value from null variable `?`

int? tryHashCode(String? name) => name?.hashCode;

// named parameter
int? captureHashCode({String? name ='vivek'}) => name?.hashCode;

int? calculateTotal(int initial, {int? second = 100}) {
  if (second != null) {
    return initial + second;
  }
  return initial;
}




// optional, positional


int? calculateBigTotal(int initial, [int? second, int? third]) {
  return initial + (second ?? 0) + (third ?? 0);
}

void calc(){
 var sum= calculateBigTotal(100,200, 300);
  getData('Vivek ', 27).then((total){
   print(total);
 });
 print('hey ');
}