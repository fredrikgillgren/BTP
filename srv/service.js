const cds = require('@sap/cds');
const fs = require('fs');
const path = require('path');

module.exports = (srv) => {

    // Custom handler for creating an employee
    srv.before('CREATE', 'Employee', async (req) => {

        // Fetch the name of the newly created employee
        const employeeName = req.data.NAME;

        // Check if the employee name exists
        if (!employeeName) {
            req.error(400, 'Employee name is required');
        }

        // Prepare the new entry for EmployeeList.csv
        //generate a unique code for the new employee based of the first three letters of the employee name
        const code = employeeName.substring(0, 3).toUpperCase();
        const newEmployeeEntry = `${code},${employeeName}\n`;

        // Define the path to the EmployeeList.csv file
        const filePath = path.join(__dirname, '../db/data/btp.fs-EmployeeList.csv'); // Ensure this path is correct

        // Append the new entry to the EmployeeList.csv file
        fs.appendFile(filePath, newEmployeeEntry, (err) => {
            if (err) {
                req.error(500, 'Failed to save employee to EmployeeList.csv');
            }
        });
    });
};
