variable "key_name" {
  description = "The name for the SSH key pair."
  type        = string
  default     = "ubuntu-aws-test1"
}

variable "private_key_path" {
  description = "The path to the SSH public key file."
  type        = string
  default     = "/home/ubuntu/ubuntu-aws-test1.pem"
}


variable "security_group_name" {
  description = "The name of the security group for EC2 instances."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "instance_type" {
  description = "The type of instance to use."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet in which to launch the instance."
  type        = string
}

variable "user_data" {
  description = "The user data script to use for the instance."
  type        = string
  default=""
}

variable "instance_name" {
  description = "The name tag for the EC2 instance."
  type        = string
  default="mongodb"
}

variable "mongo_setup_script" {
  default =<<-EOF
                echo "debut script install" > /var/tmp/deb.log
                # Update your system
                sudo apt update -y
                sudo apt-get install gnupg curl
                # To import the MongoDB public GPG key:
                sudo curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
                sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor
                # Add the MongoDB repository
                sudo echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" \
                | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list 
                sudo apt update -y
                # Install Mongodb package
                sudo apt install -y mongodb-org
                # Start the MongoDB service
                sudo systemctl start mongod
                # Enable MongoDB to start on boot
                sudo systemctl enable mongod
                # MongoDB Shell installation for testing
                if ! systemctl is-active --quiet mongod; then
                  echo "MongoDB service not running. Starting..."
                  sudo systemctl start mongod
                else
                  echo "MongoDB service is already running."
                fi
                exit 0
EOF    
}
