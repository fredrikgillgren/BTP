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
        ],
    }
) {
    ID @UI: {Hidden};
    NAME @title : 'Name';
    EMAIL @title : 'Email';
    DESIGNATION @title : 'Designation';
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

// Add UI annotations for EMPLOYEE
annotate service.Employee with {
    DESIGNATION @Common.ValueListWithFixedValues : true @Common.Text: DESIGNATION.name @Common.TextArrangement: #TextOnly;
}