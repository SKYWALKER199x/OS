const fs = require('fs');

const jsonObject = {
  name: 'Raj',
  age: 19,
  Department : 'CSE',
};

const jsonString = JSON.stringify(jsonObject, null, 2);


const filePath = 'p1.json';

fs.writeFile(filePath, jsonString, 'utf-8', (err) => {
  if (err) {
    console.error('Error writing to file:', err);
  } else {
    console.log('JSON object has been stored in', filePath);
  }
});
