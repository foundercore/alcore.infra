
fix.ssh:
	sudo chmod 600 -R ./local/*.pem

clean.demo:
	ssh-keygen -f "/home/$(USER)/.ssh/known_hosts" -R "ec2-54-145-33-149.compute-1.amazonaws.com"

ssh.demo:
	ssh -i ./local/alcore-us-east-1-bitnami-key.pem bitnami@ec2-54-145-33-149.compute-1.amazonaws.com

clean.endeavor:
	ssh-keygen -f "/Users/$(USER)/.ssh/known_hosts" -R "ec2-35-174-190-84.compute-1.amazonaws.com"

ssh.dev:
	ssh -i ./local/alcore-us-east-1-bitnami-key.pem bitnami@ec2-54-160-60-161.compute-1.amazonaws.com

ssh.endeavor:
	ssh -i ./local/alcore-us-east-1-bitnami-key.pem bitnami@ec2-35-174-190-84.compute-1.amazonaws.com

tunnel.demo:
	ssh -N -L 8888:127.0.0.1:80 -i ./local/alcore-us-east-1-bitnami-key.pem bitnami@ec2-54-145-33-149.compute-1.amazonaws.com

tunnel.endeavor:
	ssh -N -L 8888:127.0.0.1:80 -i ./local/alcore-us-east-1-bitnami-key.pem bitnami@ec2-35-174-190-84.compute-1.amazonaws.com

tunnel.dev:
	ssh -N -L 8888:127.0.0.1:80 -i ./tmp/alcore-us-east-1-bitnami-key.pem bitnami@ec2-54-160-60-161.compute-1.amazonaws.com
