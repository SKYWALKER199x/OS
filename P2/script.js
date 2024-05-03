const fs = require('fs');

const filepath = 'D:/ITNU/Sem - 4/FSWD/Lab/P2/data.json';

fs.readFile(filepath, 'utf8', (err,data)=>{
    if (err) {
        console.error('Error reading the JSON file:', err);
        return;
    }
    try {
        // Parse the JSON data
        const jsonObject = JSON.parse(data);
    
        // Display the content
        console.log('JSON object content:', jsonObject);
    
        // If you want formatted output
        console.log('Formatted JSON object content:', JSON.stringify(jsonObject, null, 2));
      } catch (parseError) {
        console.error('Error parsing JSON:', parseError);
      }
});