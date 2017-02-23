
function madLib(verb, adjective, noun) {
  console.log (`We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}.`);
}

// madLib('make', 'best', 'guac');


function isSubstring(sentance,  word) {
  let words = sentance.split(' ');
  for(let i = 0 ; i< words.length; i++){
    if (words[i] === word){
      return true;
    }
  }
  return false;
}

// console.log(isSubstring("time to program", "time")); // true
// console.log(isSubstring("Jump for joy", "joys"));  // false


function fizzBuzz(array) {
    let ret_array = [];
    for(let i=0;i < array.length; i++ ){
      if ((array[i] % 3 === 0 && array[i] % 5 !== 0)
          || (array[i] % 3 !== 0 && array[i] % 5 === 0) ){
        ret_array.push(array[i]);
      }
    }
    return ret_array;
}


// console.log(fizzBuzz([1,2,3,4,5,6,7]));

function isPrime(num) {

  for(let i = 2; i < num ; i++) {
    if(num % i === 0){
      return false;
    }
  }
  return true;
}

//
// console.log(isPrime(2));
// console.log(isPrime(10));
// console.log(isPrime(15485863));
// console.log(isPrime(3548563));


function sumOfNPrimes(num) {
  let retSum = 0;
  let count_primes = 0;
  let i = 2;
  while(count_primes < num){
    if(isPrime(i)){
      retSum += i;
      count_primes++;
    }
    i++;
  }
  return retSum;
}



console.log(sumOfNPrimes(0)); //0

console.log(sumOfNPrimes(1)); //2

console.log(sumOfNPrimes(4)); //17
