import fs from 'fs';

/** @type string */
var data;

try {  
    data = fs.readFileSync('input.txt', 'utf8').toString();
    //console.log(data.toString());
} catch(e) {
    console.log('Error:', e.stack);
}
let nums = ['1','2','3','4','5','6','7','8','9'];

let lines = data.split("\n").map(line => {
    let first="";
    for (let i = 0; i < line.length; i++) {
        if (nums.includes(line[i])) {
            first=line[i];
            break;
        }
    };
    let last="";
    for (let j = line.length; j > 0; j--) {
        if (nums.includes(line[j])) {
            last=line[j];
            break;
        }
    };
    return +(first+last);
}).reduce((a, c) => a + c);

console.log(lines);