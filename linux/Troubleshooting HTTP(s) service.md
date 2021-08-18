
# Troubleshooting HTTPS(s) service

1.    Verify systemd service is running. 

    ```systemctl status <service_name>`** (for example nginx, jenkins)```
1.1.    If not part of systemd or a sub-process, verify it is running, using ps
    ```ps -aux | grep process_name```

2.    Verify internal connectivity 
    
    ```sudo netstat -tnlp | grep <port_number>```

3.    In case of a HTTP service, examine it can be accessed internally
    
    ```curl localhost:<port_number>```
    
    or

    ```ncat -v -n 127.0.0.1 <port_number>```

4.     Check Linux box firewall. In case of Ubuntu and ufw:

    ```ufw status
       ufw app list```
4.1.    Verify connectivity throughout the routing chain.

5.    In case of a service accessed by its DNS, verify DNS is resolving to the correct address:

    ```nslookup <domain_name>```

6.    Examine service response accessed from the public domain:

    ```curl <domain_name>```
