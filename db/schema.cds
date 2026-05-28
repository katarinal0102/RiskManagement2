namespace RiskManagement2;

using{cuid} from '@sap/cds/common';

entity Risks: cuid{
    title: String(100);
    prio:String(5);
    descr: String(100);
    impact: Integer;
    criticality: Integer;
    miti: Association to Mitigations;
    supplier_BusinessPartner: String(100);
}

entity Mitigations:cuid{
    createdAt: String(100);
    createdBy: String(100);
    description:String(100);
    owner: String(100);
    timeline: String(100);
    risks: Association to many Risks on risks.miti=$self;
}


