FROM centos 

RUN yum -y install openssh
RUN yum -y install openssh-clients


# Install powershell
RUN yum -y install curl

# Register the Microsoft RedHat repository
RUN curl https://packages.microsoft.com/config/rhel/7/prod.repo | tee /etc/yum.repos.d/microsoft.repo
RUN yum install -y powershell


# Install azure powerhsell tools
#RUN Install-Module -Name AzureRM.Netcore -AllowClobber -Force 
#RUN powershell "Install-Module PowerShellGet -Force"
#RUN powershell "Install-Module -Name AzureRM -AllowClobber"

COPY ./scripts /root/scripts

ENTRYPOINT [ "tail -f /dev/null" ]
