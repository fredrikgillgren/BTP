sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'projectroles/test/integration/FirstJourney',
		'projectroles/test/integration/pages/ProjectRolesList',
		'projectroles/test/integration/pages/ProjectRolesObjectPage'
    ],
    function(JourneyRunner, opaJourney, ProjectRolesList, ProjectRolesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('projectroles') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheProjectRolesList: ProjectRolesList,
					onTheProjectRolesObjectPage: ProjectRolesObjectPage
                }
            },
            opaJourney.run
        );
    }
);