// Phase 1: Callbacks

function makeName(name) {
    return `Mx. ${name} Jingleheimer Schmidt`;
}

function titleize(names, callback) {
    let arr = names.map(function(name) { 
                            return `Mx. ${name} Jingleheimer Schmidt`; 
                        });
    callback(arr);
}

const names_arr = ["Mary", "Brian", "Leo"];
titleize(names_arr, function(names) {
                        names.forEach( function(name) {
                            console.log(name);
                        });
                    });

console.log("");
console.log("");
// Phase II: Constructors, Prototypes, and this

function Elephant(name, height, tricks) {
    this.name = name;
    this.height = height;
    this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
    console.log(`${this.name} the elephant goes "phrRRRRRRRRR!!!!!"`);
}

Elephant.prototype.grow = function() {
    this.height += 12;
}

Elephant.prototype.addTrick = function(trick) {
    this.tricks.push(trick);
}

Elephant.prototype.play = function() {
    const rand_trick = Math.floor(Math.random() * this.tricks.length);
    console.log(`${this.name} is ${this.tricks[rand_trick]}!`);
}

let tony = new Elephant("Tony", 200, ["painting a picture", "riding a four wheeler", "eating a forest"]);

tony.trumpet();
tony.grow();
tony.addTrick("starting a stampede");
tony.play();
console.log("");


// Phase III: Function Invocation

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah, tony];

// Storing function as a property on Elephant
Elephant.paradeHelper = function(elephant) {
    console.log(`${elephant.name} is trotting by!`);
}

herd.forEach(Elephant.paradeHelper);


console.log("");


// Phase IV: Closures

function dinerBreakfast() {
    let orders = ["I'd like cheesy scrambled eggs"];

    return function innerFunction(food) {
        orders.push("and")
        orders.push(food);
        console.log(orders.join(" ") + " please.");
    }
    
}

let breakfastOrder = dinerBreakfast();
breakfastOrder("chocolate chip pancakes");
breakfastOrder("grits");
