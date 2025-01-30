namespace btp.fs;

using { cuid, managed, sap.common.CodeList } from '@sap/cds/common';

// Define the DesignationList entity
entity DesignationList : CodeList {
    key code : String(30) @Common.Text : name @Common.TextArrangement: #TextOnly;
}

// Define the DesignationTypes type as an association to one DesignationList
type DesignationTypes : Association to one DesignationList;

// Define the RoleList entity, only display the name
entity RoleList : CodeList {
    key code : String(30) @Common.Text : name @Common.TextArrangement: #TextOnly;
}

// Define the RoleTypes type as an association to one RoleList
type RoleTypes : Association to one RoleList;

entity EmployeeList : CodeList {
    key code : String(30) @Common.Text : name @Common.TextArrangement: #TextOnly;
}

type EmployeeTypes : Association to one EmployeeList;

// Define the EMPLOYEE entity
entity EMPLOYEE : cuid, managed {
    NAME : String(255);
    EMAIL: String(255);
    DESIGNATION: DesignationTypes;
    Address: Composition of many ADDRESS on Address.EMPLOYEE = $self;
}

// Define the ADDRESS entity
entity ADDRESS : cuid, managed {
    STREET : String(255);
    NUMBER : String(10);
    CITY : String(255);
    COUNTRY : String(255);
    EMPLOYEE : Association to one EMPLOYEE;
}

// Define the PROJECT entity
entity PROJECT : cuid, managed {
    TITLE : String(255);
    START_DATE : Date;
    END_DATE : Date;
    ProjectRoles: Composition of many PROJECTROLES on ProjectRoles.PROJECT = $self;
}

Entity PROJECTROLES : cuid, managed {
    PROJECT : Association to PROJECT;
    ROLE : RoleTypes;
    EMPLOYEE : EmployeeTypes;
    START_DATE : Date;
    END_DATE : Date;
}