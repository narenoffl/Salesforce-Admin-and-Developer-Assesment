global class ContactBatchClass implements Database.Batchable<sObject>{
    global Database.QueryLocator start(Database.BatchableContext BC){
        String query = 'SELECT Id, Name,Email FROM Contact';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Contact> occlist){
        for(Contact occ: occlist){
            if(String.isBlank(occ.Email)){
                occ.Email='system@gmail.com';
                System.debug(occ.Email);
            }
        }
        
        try{
            update occlist;
        }catch(Exception e){
            System.debug(e);
        }
    }
    
    global void finish(Database.BatchableContext BC){
        //post processing operations
    }
}