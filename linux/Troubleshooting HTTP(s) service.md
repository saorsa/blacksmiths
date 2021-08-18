
# Troubleshooting HTTPS(s) service

1. First we need to check if the service is running. We can use the following command: 

    **`sudo systemctl status <service_name>`** (for example nginx, jenkins)

2. Next we have to check if the port is open and which process is using it. Use the following command:
    
    **`sudo netstat -tnlp | grep <port_number>`**

3. Then we must check the result when accessing the port locally. The following commands can be used:
    
    **`curl localhost:<port_number>`** 
    
    or

    **`ncat -v -n 127.0.0.1 <port_number>`** 

4. We continue by checking if we have added a firewall rule for the port. We can achieve this by:

    **`sudo ufw status`**

5. Next step is to check for an existing DNS record with the following command:

    **`nslookup <domain_name>`**

6. Finally we check if the service is accessible from external clients. We can use the following command:

    **`curl <domain_name>`**
