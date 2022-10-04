-- My sql is runnng at secure-file-private error (in office , admin should fix it)
	/*go to programdata >mysql>mysql server 1.0> my (configuration file) -  open in notepad++
			search for secure-file-priv
			it should be secure-file-priv=""alter
			save the file
			go to services on your computer> MYSQL > restart */

-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses 
      --   a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	
         /*Solution:SET SQL_SAFE_UPDATES = 0;*/
         
-- Error Code: 2013. Lost connection to MySQL server during query /ER_NET_PACKET_TOO_LARGE 
   /* max file size allowed by default is 1MB
   1 MB is 	1,048,576 Bytes (Binary)
   solu: SET GLOBAL max_allowed_packet= xMB x 1,048,576 
   i.e for 44MB = 46137344 Bytes
   */