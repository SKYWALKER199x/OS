const fs = require('fs');
const path = require('path');
const document = require('document');

const name = document.getElementById("name").value;
const age = document.getElementById("age").value;
const department = document.getElementById("department").value;

const jsonObject = {
  name: name,
  age: age,
  department: department
};
console.log(jsonObject);

const jsonString = JSON.stringify(jsonObject);

const filePath = path.join(__dirname,'p1.json');

fs.writeFileSync(filePath, jsonString, 'utf-8', (err) => {
  if (err) {
    console.error('Error writing to file:', err);
  } else {
    console.log('JSON object has been stored in', filePath);
  }
});