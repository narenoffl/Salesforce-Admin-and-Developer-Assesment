public class AccountTriggerHandler {
    public static void updatess(list<Account> listacc){
       list<Opportunity> listopp = new  list<Opportunity>();
        listopp=[select id,Name,Opportunity_Status__c,Account.Account_Status__c from Opportunity where AccountId =:listacc];
       
        List<Opportunity> listop = new List<Opportunity>(); 
        Opportunity op=new Opportunity();
        for(Opportunity opp:listopp){
            op=new Opportunity();
            op.Id=opp.Id;
           op.Opportunity_Status__c = opp.Account.Account_Status__c;
            listop.add(op);
        }
        update listop; 
    }
}