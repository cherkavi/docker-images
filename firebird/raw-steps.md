>>> Install Firebird
1.
	Type this command:
		 sudo apt-get install firebird2-super-server
	
2 
	Type this command:
		sudo apt-get install libstdc++5

	Download url:
		http://sourceforge.net/projects/firebird/files/firebird-linux-i386/2.1.2-Release/FirebirdCS-2.1.2.18118-0.i686.tar.gz/download

	Unpack archiv:
		tar -xvf FirebirdSS-2.0.3.12981-1.amd64.tar.gz

	Execute installer(move to the package):
		./install.sh

	Copy your UDF into:
		 /opt/firebird/UDF/*

	change rights on UDF's folder:
		chown root:root /opt/firebird/UDF/*
		chmod 444 /opt/firebird/UDF/*

	check your connection
		/opt/firebird/bin/isql -u SYSDBA -p masterkey /opt/firebird/examples/empbuild/employee.fdb
		SQL>show tables;
		SQL>select * from sales;

	do a backup on the old machine:
		<put path (include ending slash at the end) to gbak here>gbak  -b -t -v -USER SYSDBA -PASS <put SYSDBA password here> <put path and name of the database here> <put path and name of the backup file here>
	
	move the backup file from old to the new machine		
		gbak  -c -v -t -USER SYSDBA -PASS <put SYSDBA password here> <put path and name of the backup file here> <put path and name of the database here>

