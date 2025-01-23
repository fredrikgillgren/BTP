namespace btp.fs;

using { cuid, managed, sap.common.CodeList } from '@sap/cds/common';

// Define the DesignationList entity
entity DesignationList : CodeList {
    key code : String(30) @Common.Text : name @Common.TextArrangement: #TextOnly;
}

// Define the DesignationTypes type as an association to one DesignationList
type DesignationTypes : Association to one DesignationList;

// Define the EMPLOYEE entity
entity EMPLOYEE : cuid, managed {
    NAME : String(255);
    EMAIL: String(255);
    DESIGNATION: DesignationTypes;

    Address: Composition of many ADDRESS on Address.EMPLOYEE = $self;
}

// Define the ADDRESS entity
entity ADDRESS : cuid, managed {
    STREET: String(255);
    NUMBER: Integer;
    CITY: String(255);
    COUNTRY: String(255);

    EMPLOYEE : Association to one EMPLOYEE;
}
