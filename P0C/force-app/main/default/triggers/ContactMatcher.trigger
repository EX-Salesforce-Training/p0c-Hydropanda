trigger ContactMatcher on Contact (before insert) {
    if (Trigger.isBefore && Trigger.isInsert) {
        ContactHandler.associateAccounts(Trigger.new);
    }
}