@isTest
public class TestAccountUpdate {
	
    static TestMethod void TestAccountUpdate() {
        List<Account> accts = new List<Account>();
        for(Integer i=0;i<200;i++){
            Account a = new Account(name='TestAccount'+i);
            accts.add(a);
        }
        insert accts;
        
        Test.startTest();
        	batchAccountUpdate bau = new batchAccountUpdate('Enterprise_Account_Status__c', 'Bronze');
			database.executeBatch(bau);
        
        System.assertEquals(200, accts.size());
        List<Account> actupdated = new List<Account>();
        actupdated = [Select Id, Enterprise_Account_Status__c FROM Account];
        for(Integer j=0; j<accts.size();j++){
            System.assertEquals(actupdated[j].Enterprise_Account_Status__c, 'Bronze');
        } 
        Test.stopTest();
    }
 }