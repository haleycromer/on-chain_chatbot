// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TaskManager {
    // Structure to define a task
    struct Task {
        uint id;
        string title;
        string description;
        address assignee;
        uint deadline;
        bool completed;
    }

    // Array to store tasks
    Task[] public tasks;

    // Event to emit when a new task is created
    event TaskCreated(uint indexed id, string title, address indexed assignee);

    // Modifier to ensure only task assignee can perform certain actions
    modifier onlyAssignee(uint taskId) {
        require(tasks[taskId].assignee == msg.sender, "Only task assignee can perform this action");
        _;
    }

    // Function to create a new task
    function createTask(string memory _title, string memory _description, address _assignee, uint _deadline) external {
        uint taskId = tasks.length;
        tasks.push(Task(taskId, _title, _description, _assignee, _deadline, false));
        emit TaskCreated(taskId, _title, _assignee);
    }

    // Function to mark task as completed
    function completeTask(uint taskId) external onlyAssignee(taskId) {
        tasks[taskId].completed = true;
    }

    // Function to get task details
    function getTask(uint taskId) external view returns (uint, string memory, string memory, address, uint, bool) {
        require(taskId < tasks.length, "Task does not exist");
        Task memory task = tasks[taskId];
        return (task.id, task.title, task.description, task.assignee, task.deadline, task.completed);
    }
}
