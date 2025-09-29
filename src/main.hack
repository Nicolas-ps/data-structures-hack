use namespace App;

function main(): void {
     // $arrayStack = new App\ArrayStack(10);
     // echo $arrayStack->print();

     // $arrayStack->push('A');
     // echo $arrayStack->print();

     // $arrayStack->push('B');
     // echo $arrayStack->print();

     // $arrayStack->push('C');
     // echo $arrayStack->print();

     // $arrayStack->pop();
     // echo $arrayStack->print();

     // $arrayStack->push('D');
     // echo $arrayStack->print();

     $dictionary = new App\Dictionary();
     $dictionary->add('Nicolas', 'Jennifer');
     echo $dictionary->print();
}