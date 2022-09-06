# restart mongodb 
sudo /opt/bitnami/ctlscript.sh restart mongodb


# install/restart ssl certificates
1. Login into your server using putty 
2. Stop the Ec2 
2. Run command : `sudo /opt/bitnami/bncert-tool`
3. Enter details
    1. Domain details will be : `iendeavor.endeavorcareers.com,staff.iendeavor.endeavorcareers.com`
    2. Email used for ssl : no-reply@foundercore.org
    3. At the end it will show some partial errors, but that does not impact the update. SSL must have updated and you can verify it.


# reboot ec2
1. Go to AWS-EC2 console
2. STOP : `Select Instance State > Stop Intance` from the right hand top dropdown.
3. START : Once the instance is stopped then `Select Instance State > Stop Intance` from the right hand top dropdown.


# restarting apache
While restarting apache if you encounter issues related to port 80 not avaialable then follow the following steps:
- sudo pkill -f nginx
- sudo pkill -f apache
- sudo /opt/bitnami/ctlscript.sh start apache

# deleting course
- cd /home/bitnami/alcore.infra/scripts/cloud
- sh remove-course-v1.sh
- pass the course id 
