# install awscli
pip3 install awscli --upgrade
aws configure # enter keys

aws configure list

# create cluster
eksctl create cluster --name simple-jwt-api

# set up IAM cluster role
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
TRUST="{ \"Version\": \"2012-10-17\", \"Statement\": [ { \"Effect\": \"Allow\", \"Principal\": { \"AWS\": \"arn:aws:iam::${ACCOUNT_ID}:root\" }, \"Action\": \"sts:AssumeRole\" } ] }"
aws iam create-role --role-name UdacityFlaskDeployCBKubectlRole --assume-role-policy-document "$TRUST" --output text --query 'Role.Arn'
echo '{ "Version": "2012-10-17", "Statement": [ { "Effect": "Allow", "Action": [ "eks:Describe*", "ssm:GetParameters" ], "Resource": "*" } ] }' > /tmp/iam-role-policy
aws iam put-role-policy --role-name UdacityFlaskDeployCBKubectlRole --policy-name eks-describe --policy-document file:///tmp/iam-role-policy

# grant role
kubectl get -n kube-system configmap/aws-auth -o yaml > aws-auth-patch.yml
# update the file
kubectl patch configmap/aws-auth -n kube-system --patch "$(cat aws-auth-patch.yml)"