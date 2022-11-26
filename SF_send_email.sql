----
SET emailAddress = 'learnatozaboutdata@gmail.com';

    CREATE OR REPLACE NOTIFICATION INTEGRATION 
        SF_Email_Notifications
        TYPE=EMAIL
        ENABLED=TRUE
        ALLOWED_RECIPIENTS=($emailAddress)
        COMMENT = 'Snowflake Email Notifications';
    
    -- View the new Notification Integration’s metadata
    SHOW INTEGRATIONS;



call system$send_email(
    'SF_Email_Notifications',
    'learnatozaboutdata@gmail.com',
    '[SF_Email_Notifications]:Email Alert: Task A has finished.',
    'Task A has successfully finished.\n ON:' || TO_VARCHAR(CURRENT_TIMESTAMP()) || 
    'Total Records Processed: 115678'
);

   SELECT CREATED
            ,PROCESSED
            ,MESSAGE_SOURCE
            ,INTEGRATION_NAME
            ,MESSAGE
            ,STATUS
    FROM TABLE(Snowflake.information_schema.notification_history(integration_name => 'SF_Email_Notifications'));  
   -
