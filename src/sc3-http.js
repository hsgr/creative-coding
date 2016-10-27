
var sc = require('../index.js');
var http = require('http');

var s = http.createServer(function(req, res){

    sc.lang.boot({debug: false}).then(function(sclang) {

        sclang.interpret('(1..10).asString').then(function(answer){
            console.log('array = ' + answer);
            //return answer;
            res.writeHead(200, { 'content-type': 'text/plain' });
            res.end('ANSWER: ' + answer);
            console.log(answer);

        }, console.error);

    });

});

s.listen(8000);
