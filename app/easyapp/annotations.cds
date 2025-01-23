using FullStackService as service from '../../srv/service';
annotate service.Employee with @(
    UI : {
        LineItem  : [
            {
                $Type: 'UI.DataField',
                Value: NAME
            },
            {
                $Type: 'UI.DataField',
                Value: EMAIL
            },
            {
                $Type: 'UI.DataField',
                Value: DESIGNATION_code
            },
                        {
                $Type: 'UI.DataField',
                Value: ROLE_code
            },
            {
                $Type: 'UI.DataField',
                Value: createdBy
            },
            {
                $Type: 'UI.DataField',
                Value: createdAt
            },
        ],
        //fieldgroup
        FieldGroup #GeneralData : {
            $Type : 'UI.FieldGroupType',
            Data : [
            {
                $Type: 'UI.DataField',
                Value: NAME
            },
            {
                $Type: 'UI.DataField',
                Value: EMAIL
            },
            {
                $Type: 'UI.DataField',
                Value: DESIGNATION_code
            },
                        {
                $Type: 'UI.DataField',
                Value: ROLE_code
            },
            {
                $Type: 'UI.DataField',
                Value: createdBy
            },
            {
                $Type: 'UI.DataField',
                Value: createdAt
            },
            {
                $Type: 'UI.DataField',
                Value: modifiedBy
            },
            {
                $Type: 'UI.DataField',
                Value: modifiedAt
            },
            ],
        },
        //Facets
        Facets  : [
            {
                $Type: 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup#GeneralData',
                Label : 'General Information',
                ID : 'idGeneralInformation'
            },
            {
                $Type: 'UI.ReferenceFacet',
                Target : 'Address/@UI.LineItem',
                Label : 'Address',
                ID : 'idAddressData'
            },
                        {
                $Type: 'UI.ReferenceFacet',
                Target : 'Projects/@UI.LineItem',
                Label : 'Project',
                ID : 'idProjectData'
            },
        ],
    }
) {
    ID @UI: {Hidden};
    NAME @title : 'Name';
    EMAIL @title : 'Email';
    DESIGNATION @title : 'Designation';
    ROLE @title : 'Role';
};

annotate service.Address with @(
    UI: {
        LineItem  : [
            {
                $Type: 'UI.DataField',
                Value: STREET
            },
            {
                $Type: 'UI.DataField',
                Value: NUMBER
            },
            {
                $Type: 'UI.DataField',
                Value: CITY
            },
            {
                $Type: 'UI.DataField',
                Value: COUNTRY
            },
            {
                $Type: 'UI.DataField',
                Value: createdBy
            },
            {
                $Type: 'UI.DataField',
                Value: createdAt
            },
        ],

        FieldGroup #BasicDataAddress : {
            $Type : 'UI.FieldGroupType',
            Data: [
            {
                $Type: 'UI.DataField',
                Value: STREET
            },
            {
                $Type: 'UI.DataField',
                Value: NUMBER
            },
            {
                $Type: 'UI.DataField',
                Value: CITY
            },
            {
                $Type: 'UI.DataField',
                Value: COUNTRY
            },
            {
                $Type: 'UI.DataField',
                Value: createdBy
            },
            {
                $Type: 'UI.DataField',
                Value: createdAt
            },   
        ],
    },

    Facets  : [
        {
            $Type: 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#BasicDataAddress',
            Label: 'Address Data',
            ID : 'idAddressBasicData'
        },
    ],
    }
) {
    ID @UI: {Hidden};
    STREET @title : 'Street';
    NUMBER @title : 'Number';
    CITY @title : 'City';
    COUNTRY @title : 'Country';
};

annotate service.Project with @(
    UI: {
        LineItem  : [
            {
                $Type: 'UI.DataField',
                Value: TITLE
            },
            {
                $Type: 'UI.DataField',
                Value: START_DATE
            },
            {
                $Type: 'UI.DataField',
                Value: END_DATE
            },
            {
                $Type: 'UI.DataField',
                Value: ROLE_code
            },
            {
                $Type: 'UI.DataField',
                Value: createdBy
            },
            {
                $Type: 'UI.DataField',
                Value: createdAt
            },
        ],
        FieldGroup #BasicDataProject : {
            $Type : 'UI.FieldGroupType',
            Data: [
            {
                $Type: 'UI.DataField',
                Value: TITLE
            },
            {
                $Type: 'UI.DataField',
                Value: START_DATE
            },
            {
                $Type: 'UI.DataField',
                Value: END_DATE
            },
            {
                $Type: 'UI.DataField',
                Value: ROLE_code
            },
            {
                $Type: 'UI.DataField',
                Value: createdBy
            },
            {
                $Type: 'UI.DataField',
                Value: createdAt
            },
            {
                $Type: 'UI.DataField',
                Value: modifiedBy
            },
            {
                $Type: 'UI.DataField',
                Value: modifiedAt
            },
        ],
    },
    Facets  : [
        {
            $Type: 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#BasicDataProject',
            Label: 'Project Data',
            ID : 'idProjectBasicData'
        },
    ],
    }
) {
    ID @UI: {Hidden};
    TITLE @title : 'Title';
    START_DATE @title : 'Start Date';
    END_DATE @title : 'End Date';
    ROLE @title : 'Role';
};

// Add UI annotations for EMPLOYEE
annotate service.Employee with {
    DESIGNATION @Common.ValueListWithFixedValues : true @Common.Text: DESIGNATION.name @Common.TextArrangement: #TextOnly;
    ROLE @Common.ValueListWithFixedValues : true @Common.Text: ROLE.name @Common.TextArrangement: #TextOnly;
}

// Add UI annotations for PROJECT
annotate service.Project with {
    ROLE @Common.ValueListWithFixedValues : true @Common.Text: ROLE.name @Common.TextArrangement: #TextOnly;
}