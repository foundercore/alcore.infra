
fix.ssh:
	sudo chmod 600 -R ./tmp/*.pem

clean.demo:
	ssh-keygen -f "/home/$(USER)/.ssh/known_hosts" -R "ec2-54-145-33-149.compute-1.amazonaws.com"

ssh.demo: clean.demo
	ssh -i ./tmp/alcore-us-east-1-demo.pem bitnami@ec2-54-145-33-149.compute-1.amazonaws.com

clean.learn:
	ssh-keygen -f "/home/$(USER)/.ssh/known_hosts" -R "ec2-35-174-190-84.compute-1.amazonaws.com"

ssh.learn: clean.learn
	ssh -i ./tmp/alcore-us-east-1-learn.pem bitnami@ec2-35-174-190-84.compute-1.amazonaws.com

tunnel.demo:
	ssh -N -L 8888:127.0.0.1:80 -i ./tmp/alcore-us-east-1-demo.pem bitnami@ec2-54-145-33-149.compute-1.amazonaws.com
