sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"riskmanagement2/risks/test/integration/pages/RisksList",
	"riskmanagement2/risks/test/integration/pages/RisksObjectPage"
], function (JourneyRunner, RisksList, RisksObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('riskmanagement2/risks') + '/test/flpSandbox.html#riskmanagement2risks-tile',
        pages: {
			onTheRisksList: RisksList,
			onTheRisksObjectPage: RisksObjectPage
        },
        async: true
    });

    return runner;
});

