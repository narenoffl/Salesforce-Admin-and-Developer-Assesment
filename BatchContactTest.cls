@isTest
private class BatchContactTest {
    
    @isTest
    private static void testBatchClass() {
        
        // Load test data
        List<Contact> test = new List<Contact>();
        for (Contact c:test) {
            test.add(new Contact(LastName='Connock'));
             if(String.isBlank(c.Email))
           {
               c.Email='system@gmail.com';
               System.debug(c.Email);
           }
            
        }
        List<Contact> test2 = new List<Contact>();
        for (Contact c:test2) {
            test.add(new Contact(LastName='Connock',Email='testing@gmail.com'));
             if(String.isBlank(c.Email))
           {
               c.Email='system@gmail.com';
               System.debug(c.Email);
           }
            
        }
        insert test;
        
        // Perform the test
       System.Test.startTest();
       ContactBatchClass cb = new ContactBatchClass();
        Id batchId = Database.executeBatch(cb,10);
         System.Test.stopTest();
        
        // Check the result
        List<Contact> updatedLeads = [SELECT Id FROM Contact ];
        System.assertEquals(10, updatedLeads.size(), 'ERROR: At least 1 Contact record not updated correctly');
    }
}