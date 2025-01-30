const cds = require('@sap/cds');
const fs = require('fs');
const path = require('path');

module.exports = (srv) => {
    
    const filePath = path.join(__dirname, '../db/data/btp.fs-EmployeeList.csv'); //path to file
    
    // Custom handler for creating an employee
    srv.before('CREATE', 'Employee', async (req) => {
        const employeeName = req.data.NAME;

        if (!employeeName) {
            req.error(400, 'Employee name is required');
        }

        // for now we the code is the same as the name
        const code = employeeName;
        const newEmployeeEntry = `${code},${employeeName}\n`;

        try {
            // Append the new entry to EmployeeList.csv
            fs.appendFileSync(filePath, newEmployeeEntry, 'utf8');
        } catch (err) {
            req.error(500, 'Failed to save employee to EmployeeList.csv');
        }
    });

    // Custom READ handler for EmployeeList to fetch updated data dynamically
    srv.on('READ', 'EmployeeList', async (req) => {
        try {
            // Read the file contents dynamically every time
            const data = fs.readFileSync(filePath, 'utf8');
            return data.split('\n')
                .filter(line => line.trim() !== '') // Ignore empty lines
                .map(line => {
                    const [code, name] = line.split(',');
                    return { code, name };
                });
        } catch (err) {
            req.error(500, 'Failed to read EmployeeList.csv');
        }
    });
};