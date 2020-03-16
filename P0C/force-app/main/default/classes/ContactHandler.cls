public class ContactHandler {
    public static void associateAccounts(Contact[] newContacts) {
        Account[] relate;
        for (Integer i = 0; i < newContacts.size(); i++) {
            if (newContacts[i].AccountId == null) {
            	relate = [SELECT Name FROM Account WHERE Name =: newContacts[i].firstName + ' ' + newContacts[i].lastName OR (Phone != null AND Phone =: newContacts[i].Phone)
                 	OR (Fax != null AND Fax =: newContacts[i].Fax) OR ((ShippingStreet != null AND ShippingStreet =: newContacts[i].MailingStreet)
                 	AND (ShippingCity != null AND ShippingCity =: newContacts[i].MailingCity)) LIMIT 1];
                if (!relate.isEmpty()) {
                    system.debug(relate[0]);
            		newContacts[i].accountId = relate[0].Id;
                }
            	relate.clear();
            }
        }
    }
}