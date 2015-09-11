
## ansible-demo
#### For what?
> Simple test for ansible remote copy and execute script
> Simple test for proftp server upload and download
> Simple test for ansible data sync

#### Result
> Proftp server install
[proftp.png](proftp install and start)

> Remote copy and execute script result
[ansible-task.png](Remote copy and execute script)

> Copy task
[cop.png](copy the remote file)
#### Demo code
> Execute backup(Copy file to remote node and execute script)
```shell
   ansible-playbook doremote.yml
```

> Upload file via ftp
```shell
   ftp -v -n <your host> << EOF
   user <username> <password>
   <todo>
   bye
   EOF
```

#### More
Clone and modify if you needed
