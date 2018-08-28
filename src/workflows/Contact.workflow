<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>The_Contact_was_rejected</fullName>
        <description>The Contact was rejected</description>
        <protected>false</protected>
        <recipients>
            <recipient>puchochek@gmail.com.visual</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Rejected_Case</template>
    </alerts>
    <fieldUpdates>
        <fullName>Approve</fullName>
        <field>Approval_Status__c</field>
        <literalValue>1</literalValue>
        <name>Approve</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approve_1</fullName>
        <field>Approval_Status__c</field>
        <literalValue>1</literalValue>
        <name>Approve</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
</Workflow>
