#!/usr/local/bin/python3
import boto3


def modify_ssh_port(security_group_name, region):
    """
    Modify the SSH port from 22 to 24 in existing AWS Security Groups identified by the same name.

    Parameters:
        security_group_name (str): The name of the security groups to modify.
        region (str): The AWS region where the security groups are located.
    """

    ec2 = boto3.client('ec2', region_name=region)

    try:
        # Fetch the security groups by their name
        response = ec2.describe_security_groups(
            Filters=[
                {'Name': 'group-name', 'Values': [security_group_name]}
            ]
        )

        for sg in response['SecurityGroups']:
            security_group_id = sg['GroupId']

            # Revoke the existing SSH inbound rule for port 22
            ec2.revoke_security_group_ingress(
                GroupId=security_group_id,
                IpProtocol='tcp',
                FromPort=22,
                ToPort=22,
                CidrIp='0.0.0.0/0'  # Assumes the rule allows all IPs; modify as needed
            )

            print(
                f"Successfully revoked SSH rule for port 22 in Security Group {security_group_name} (ID: {security_group_id}) in region {region}.")

            # Authorize a new SSH inbound rule for port 24
            ec2.authorize_security_group_ingress(
                GroupId=security_group_id,
                IpProtocol='tcp',
                FromPort=24,
                ToPort=24,
                CidrIp='0.0.0.0/0'  # Assumes the rule allows all IPs; modify as needed
            )

            print(
                f"Successfully authorized SSH rule for port 24 in Security Group {security_group_name} (ID: {security_group_id}) in region {region}.")

    except Exception as e:
        print(f"An error occurred while modifying the SSH rules in region {region}: {e}")


if __name__ == "__main__":
    security_group_name = "sc_allow_ssh"  # Replace with your Security Group name
    region = "eu-west-1"  # Replace with the AWS region where the security group is located
    modify_ssh_port(security_group_name, region)


-----------

import boto3


def modify_ssh_port(security_group_name, region):
    """
    Modify the SSH port from 22 to 24 in existing AWS Security Groups identified by the same name, while keeping the rule description intact.

    Parameters:
        security_group_name (str): The name of the security groups to modify.
        region (str): The AWS region where the security groups are located.
    """

    ec2 = boto3.client('ec2', region_name=region)

    try:
        # Fetch the security groups by their name
        response = ec2.describe_security_groups(
            Filters=[
                {'Name': 'group-name', 'Values': [security_group_name]}
            ]
        )

        for sg in response['SecurityGroups']:
            security_group_id = sg['GroupId']

            # Capture the existing rule's description
            existing_description = None
            for rule in sg['IpPermissions']:
                if rule['FromPort'] == 22 and rule['ToPort'] == 22:
                    existing_description = rule.get('IpRanges', [{}])[0].get('Description', '')
                    break

            # Revoke the existing SSH inbound rule for port 22
            ec2.revoke_security_group_ingress(
                GroupId=security_group_id,
                IpPermissions=[
                    {
                        'IpProtocol': 'tcp',
                        'FromPort': 22,
                        'ToPort': 22,
                        'IpRanges': [{'CidrIp': '0.0.0.0/0'}]
                    }
                ]
            )

            print(
                f"Successfully revoked SSH rule for port 22 in Security Group {security_group_name} (ID: {security_group_id}) in region {region}.")

            # Authorize a new SSH inbound rule for port 24
            ec2.authorize_security_group_ingress(
                GroupId=security_group_id,
                IpPermissions=[
                    {
                        'IpProtocol': 'tcp',
                        'FromPort': 24,
                        'ToPort': 24,
                        'IpRanges': [{'CidrIp': '0.0.0.0/0', 'Description': existing_description}]
                    }
                ]
            )

            print(
                f"Successfully authorized SSH rule for port 24 in Security Group {security_group_name} (ID: {security_group_id}) in region {region}.")

    except Exception as e:
        print(f"An error occurred while modifying the SSH rules in region {region}: {e}")


if __name__ == "__main__":
    security_group_name = "sc_allow_ssh"  # Replace with your Security Group name
    region = "eu-west-1"  # Replace with the AWS region where the security group is located
    modify_ssh_port(security_group_name, region)
