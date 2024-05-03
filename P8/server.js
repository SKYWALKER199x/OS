const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');

const app = express();
const port = 3000;

// Create MySQL connection
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '', // Enter your MySQL password here if you have set any
    database: 'task_management'
});

// Connect to MySQL
connection.connect((err) => {
    if (err) throw err;
    console.log('Connected to MySQL database');

    // Create 'tasks' table if it doesn't exist
    const createTableQuery = `
        CREATE TABLE IF NOT EXISTS tasks (
            id INT AUTO_INCREMENT PRIMARY KEY,
            title VARCHAR(255) NOT NULL,
            description TEXT,
            dueDate DATE,
            status ENUM('todo', 'in_progress', 'completed') DEFAULT 'todo'
        )
    `;
    connection.query(createTableQuery, (err, result) => {
        if (err) throw err;
        console.log('Table created or already exists');
    });
});

// Middleware to parse JSON bodies
app.use(bodyParser.json());

// Handle GET request to fetch all tasks
app.get('/tasks', (req, res) => {
    connection.query('SELECT * FROM tasks', (err, rows) => {
        if (err) {
            console.error('Error fetching tasks:', err.message);
            res.status(500).send('Error fetching tasks');
            return;
        }
        res.json(rows);
    });
});

// Handle GET request to fetch a single task by ID
app.get('/tasks/:id', (req, res) => {
    const taskId = req.params.id;

    // Retrieve the task with the specified ID from the 'tasks' table
    const getQuery = 'SELECT * FROM tasks WHERE id = ?';
    connection.query(getQuery, [taskId], (err, rows) => {
        if (err) {
            console.error('Error fetching task:', err.message);
            res.status(500).send('Error fetching task');
            return;
        }
        if (rows.length === 0) {
            res.status(404).send('Task not found');
            return;
        }
        res.json(rows[0]);
    });
});

// Handle POST request to add a task
app.post('/tasks', (req, res) => {
    const { title, description, dueDate, status } = req.body;

    // Check if all required fields are present
    if (!title || !dueDate || !status) {
        return res.status(400).send('Title, due date, and status are required');
    }

    // Insert the new task into the 'tasks' table
    const insertQuery = `
        INSERT INTO tasks (title, description, dueDate, status)
        VALUES (?, ?, ?, ?)
    `;
    connection.query(insertQuery, [title, description, dueDate, status], (err, result) => {
        if (err) {
            console.error('Error adding task:', err.message);
            res.status(500).send('Error adding task');
            return;
        }
        res.status(201).send('Task added successfully');
    });
});

// Handle DELETE request to delete a task
app.delete('/tasks/:id', (req, res) => {
    const taskId = req.params.id;

    // Delete the task with the specified ID from the 'tasks' table
    const deleteQuery = 'DELETE FROM tasks WHERE id = ?';
    connection.query(deleteQuery, [taskId], (err, result) => {
        if (err) {
            console.error('Error deleting task:', err.message);
            res.status(500).send('Error deleting task');
            return;
        }
        res.status(200).send('Task deleted successfully');
    });
});

// Serve static files
app.use(express.static('public'));

// Start the server
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});