// Phase 1 - JS Fundamentals

function mysteryScoping1() {
    var x = 'out of block';
    if (true) {
        var x = 'in block';
        console.log(x);
    }
    console.log(x);
};

function mysteryScoping2() {
    const x = 'out of block';
    if (true) {
        const x = 'in block';
        console.log(x);
    }
    console.log(x);
};

function mysteryScoping3() {
    const x = 'out of block';
    if (true) {
        var x = 'in block';
        console.log(x);
    }
    console.log(x);
}

function mysteryScoping4() {
    let x = 'out of block';
    if (true) {
        let x = 'in block'
        console.log(x);
    }
    console.log(x);
}

function mysteryScoping5() {
    let x = 'out of block';
    if (true) {
        let x = 'in block';
        console.log(x);
    }
    let x = 'out of block again';
    console.log(x);
}

function madlib(verb, adjective, noun) {
    console.log(`We shall ${verb} the ${adjective} ${noun}`);
}

function isSubstring(searchString, subString) {
    if (searchString.includes(subString)) {
        return true;
    }
    return false;
}



// Phase II - JS Looping Constructs

function fizzBuzz(array) {
    const new_array = [];
    array.forEach(function(ele) {
        if ((ele % 3 === 0) && !(ele % 5 === 0)) {
            new_array.push(ele);
        } else if (!(ele % 3 === 0) && (ele % 5 === 0)) {
            new_array.push(ele);
        }
    });
    return new_array;
}

function isPrime(number) {
    if (number < 2) {
        return false;
    }

    for (let i = 2; i < number; i++) {
        if (number % i === 0) {
            return false;
        }
    }

    return true;
}

function sumOfNPrimes(n) {
    let count = 0;
    let sum = 0;
    let i = 0;

    while (count < n) {
        if (isPrime(i)) {
            sum += i;
            count++;
        }
        i++;
    }

    return sum;
}

