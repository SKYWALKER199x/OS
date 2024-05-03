let tasks = [];
//add a new task to the tasks array
function addTask() {
    let taskInput = document.getElementById('taskInput');
    let task = taskInput.value.trim();

    if (task) {
        tasks.push({ task: task, completed: false });
        taskInput.value = '';
        displayTasks();
    }
}
//display tasks on the webpage
function displayTasks() {
    let taskList = document.getElementById('taskList');
    taskList.innerHTML = '';

    for (let i = 0; i < tasks.length; i++) {
        let task = tasks[i];
        let taskElement = document.createElement('li');
        taskElement.innerText = task.task;

        // Create a remove button for each task
        let removeButton = document.createElement('button');
        removeButton.innerText = 'Remove';
        removeButton.onclick = function () {
            tasks.splice(i, 1);
            displayTasks();
        };

        taskElement.appendChild(removeButton);
        taskList.appendChild(taskElement);
    }
}