
(
var a, b, c;
a = { [100, 200, 300].choose }; // a function is enclosed within curly brackets
b = { 10.rand + 1 }; // another Function
c = a + b; // c is a Function.
c.value.postln; // evaluate c and print the result
)
