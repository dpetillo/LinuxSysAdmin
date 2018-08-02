FROM centos 

RUN yum -y install openssh
RUN yum -y install openssh-clients


# Install powershell
RUN yum -y install curl

# Register the Microsoft RedHat repository
RUN curl https://packages.microsoft.com/config/rhel/7/prod.repo | tee /etc/yum.repos.d/microsoft.repo
RUN yum install -y powershell

# Install azure powerhsell tools
RUN pwsh -C "Install-Module -Name AzureRM.Netcore -Force"

#Install Azure CLI 2 
RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc
RUN sh -c 'echo -e "[azure-cli]\nname=Azure CLI\nbaseurl=https://packages.microsoft.com/yumrepos/azure-cli\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/azure-cli.repo'
RUN yum -y install azure-cli

COPY ./scripts /root/scripts

ENTRYPOINT [ "tail -f /dev/null" ]
