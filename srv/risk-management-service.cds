using RiskManagement2 as my from '../db/schema';

using{API_BUSINESS_PARTNER as BusinessPartnerA2X} from './external/API_BUSINESS_PARTNER';

@requires: 'authenticated-user'
service RiskManagementService{
    @odata.draft.enabled
    @restrict:[
        {
            grant:['*'],
            to: 'RiskManager'
        },
        {
            grant:['READ'],
            to:'RiskViewer'
        }
    ]
    entity Risks as projection on my.Risks{
        *,
        supplier: Association to BusinessPartnerA2X.A_BusinessPartner on supplier.BusinessPartner = supplier_BusinessPartner
    };
    @odata.draftenabled
    @restrict:[
        {
            grant:['*'],
            to: 'RiskManager'
        },
        {
            grant:['READ'],
            to:'RiskViewer'
        }
    ]
    entity Mitigations as projection on my.Mitigations;

    entity A_BusinessPartner as projection on BusinessPartnerA2X.A_BusinessPartner{
        BusinessPartner,
        Customer,
        Supplier,
        BusinessPartnerCategory,
        BusinessPartnerFullName,
        BusinessPartnerIsBlocked
    };

}