# CodeTest
This is the README file
Copy the following code to the Developer Console and run the code. The parameters that are passed to the code can be changed accordingly as per requirement.
///Code snipppet///
batchAccountUpdate bau = new batchAccountUpdate('Enterprise_Account_Status__c', 'Bronze');
database.executeBatch(bau);
