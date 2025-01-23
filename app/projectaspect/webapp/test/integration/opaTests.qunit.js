sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'projectaspect/test/integration/FirstJourney',
		'projectaspect/test/integration/pages/ProjectList',
		'projectaspect/test/integration/pages/ProjectObjectPage'
    ],
    function(JourneyRunner, opaJourney, ProjectList, ProjectObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('projectaspect') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheProjectList: ProjectList,
					onTheProjectObjectPage: ProjectObjectPage
                }
            },
            opaJourney.run
        );
    }
);