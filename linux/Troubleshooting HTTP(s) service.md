
# Troubleshooting HTTPS(s) service

Verify systemd service is running. 

    systemctl status <service_name>

If not part of systemd or a sub-process, verify it is running, using ps

    ps -aux | grep process_name


Verify internal connectivity 
    

    netstat -tnlp | grep <port_number>


In case of a HTTP service, examine it can be accessed internally
    

    curl localhost:<port_number>
    ncat -v -n 127.0.0.1 <port_number>


Check Linux box firewall. In case of Ubuntu and ufw:

    ufw status
    ufw app list

Verify connectivity throughout the routing chain.

In case of a service accessed by its domain name, verify DNS is resolving to the correct address:

    nslookup <domain_name>`

Examine service response accessed from the public domain:

    curl <domain_name>
