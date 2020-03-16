@isTest
public class ContactHandlerTest {
    @isTest
    public static void associateAccountsTest() {
        Contact testContact = new Contact(firstName = 'Tom', lastName = 'Jones');
        insert testContact;
        system.debug(testContact);
        testContact = null;
        
        testContact = [SELECT AccountId FROM Contact WHERE Name = 'Tom Jones' LIMIT 1];
        system.assertEquals(null, testContact.AccountId);
        system.debug(testContact);
        testContact = null;
        
        Account testAccount = new Account(Name = 'Bill Murray');
        insert testAccount;
        system.debug(testAccount);
        testAccount = null;
        
        testContact = new Contact(firstName = 'Bill', lastName = 'Murray');
        insert testContact;
        system.debug(testContact);
        testContact = null;
        
        testContact = [SELECT AccountId, Name FROM Contact WHERE Name = 'Bill Murray' LIMIT 1];
        system.debug(testContact);
		testAccount = [SELECT Name FROM Account WHERE Id =: testContact.AccountId LIMIT 1];
        system.debug(testAccount);
        
        system.assertEquals(testContact.Name, testAccount.Name);
    }
}