# Introduction

Physion LLC ("Physion") is committed to ensuring the confidentiality, privacy, integrity, and availability of all electronic protected health information (ePHI) it receives, maintains, processes and/or transmits on behalf of its Customers. As providers of compliant, hosted infrastructure used by health technology vendors, developers, designers, agencies, custom development shops, and enterprises, Physion strives to maintain compliance, proactively address information security, mitigate risk for its Customers, and assure known breaches are completely and effectively communicated in a timely manner. The following documents address core policies used by Physion to maintain compliance and assure the proper protections of infrastructure used to store, process, and transmit ePHI for Physion Customers.

Physion provides secure and compliant cloud-based software. This hosted software falls into two broad categories: 1) **Platform as a Service (Paas)** and 2) **Platform Add-ons**. These Categories are cited throughout polices as Customers in each category inherit different policies, procedures, and obligations from Physion.

## Platform as a Service (PaaS)

PaaS Customers utilized hosted software and infrastructure from Physion to deploy, host, and scale custom developed applications and configured databases. These customers are deployed into compliant containers run on systems secured and managed by Physion. Physion does not have insight or access into application level data of PaaS Customers and, as such, does not have the ability to secure or manage risk associated with application level vulnerabilities and security weaknesses. Physion makes every effort to reduce the risk of unauthorized disclosure, access, and/or breach of PaaS Customer data through network (firewalls, dedicated IP spaces, etc) and server settings (encryption at rest and in transit, OSSEC throughout the Platform, etc).

PaaS Customers can opt for a list of Services from Physion, which include Backup Service, Logging Service, IDS Service, and Disaster Recovery Service. These services are not standard and PaaS Customers must sign up for them in order for Physion to manage these areas of security and compliance.

## Platform Add-ons

Add-ons are compliant API-driven services that are offered as part of the Physion Platform. These services currently include our Backend as a Service and secure Messaging Service. With Add-ons, Physion has access to data models and manages all application level configurations and security.

In the future there may be 3rd party Add-on services available as part of the Physion Platform. These 3rd party, or Partner, Services will be fully reviewed by Physion to assure they do not have a negative impact on Physion's information security and compliance posture.

## Compliance Inheritance

Physion provides compliant hosted software infrastructure for its Customers. Physion has been through a HIPAA compliance audit by a national, 3rd party compliance firm, to validate and map organizational policies and technical settings to HIPAA rules. Physion is currently undergoing a HITRUST audit to achieve HITRUST Certification.

Physion signs business associate agreements (BAAs) with its Customers. These BAAs outline Physion obligations and Customer obligations, as well as liability in the case of a breach. In providing infrastructure and managing security configurations that are a part of the technology requirements that exist in HIPAA and HITRUST, as well as future compliance frameworks, Physion manages various aspects of compliance for Customers. The aspects of compliance that Physion manages for Customers are inherited by Customers, and Physion assumes the risk associated with those aspects of compliance. In doing so, Physion helps Customers achieve and maintain compliance, as well as mitigates Customers risk.

Certain aspects of compliance cannot be inherited. Because of this, Physion Customers, in order to achieve full compliance or HITRUST Certification, must implement certain organizational policies. These policies and aspects of compliance fall outside of the services and obligations of Physion.

Below are mappings of HIPAA Rules to Physion controls and a mapping of what Rules are inherited by Customers, both PaaS Customers and Add-on Customers.

## Physion Organizational Concepts

The physical infrastructure environment is hosted at [Rackspace](http://broadcast.rackspace.com/downloads/pdfs/RackspaceSecurityApproach.pdf) and Amazon Web Services (AWS). The network components and supporting network infrastructure is contained within AWS and Rackspace infrastructure and managed by Rackspace and AWS. Physion does not have physical access into the network components. The Physion environment consists of Cisco firewalls, Apache web servers, Dropwizard Java application servers, Percona and Riak database servers, Logstash logging servers, Linux Ubuntu monitoring servers, Puppet access control server, OSSEC IDS services, Docker containers, Linux CentOS bastion host, and developer tools servers running on Linux Ubuntu.

Within the Physion Platform, both on Rackspace and AWS, all data transmission is encrypted and all hard drives are encrypted so data at rest is also encrypted; this applies to all servers - those hosting Docker containers, databases, APIs, log servers, etc. Physion assumes all data *may* contain ePHI, even though our Risk Assessment does not indicate this is the case, and provides appropriate protections based on that assumption.

In the case of PaaS Customers, it is the responsibility of the Customer to restrict, secure, and assure the privacy of all ePHI data at the Application Level, as this is not under the control or purview of Physion.

There is data and network segmentation in place but differently implemented on Rackspace and AWS versions of the Physion Platform.

* With Rackspace, hosted load balancers segment data and traffic while Cisco firewalls route traffic to private subnets for each PaaS Customer and for Platform Add-ons.
* With AWS, hosted load balancers segment data across dedicated Virtual Private Clouds for each PaaS Customer and for Platform Add-ons.

The result of segmentation strategies employed by Physion effectively create RFC 1918, or dedicated, private segmented and separated networks and IP spaces, for each PaaS Customer and for Platform Add-ons. 

Additionally, IPtables is used on each each server for logical segmentation. The IPtables are configured to restrict access to only justified ports and protocols. Physion has implemented strict logical access controls so that only authorized personnel are given access to the internal management servers. The environment is configured so that data is transmitted from the load balancers to the application servers over an SSL encrypted session.

In the case of Platform Add-ons, once the data is received from the application server, a series of Application Programming Interface (API) calls is made to the database servers where the ePHI resides. The ePHI is separated into Riak and Percona databases through programming logic built, so that access to one database server will not present you with the full ePHI spectrum. 

The bastion host, Apache web server, Dropwizard application servers are externally facing and accessible via the Internet. The database servers, where the ePHI resides, are located on the internal Physion network and can only be accessed directly over an SSH connection through the bastion host. The access to the internal database is restricted to a limited number of personnel and strictly controlled to only those personnel with a business justified reason. Remote access to the internal servers is not accessible except through the load balancers and bastion host.

All Platform Add-ons and operating systems are tested end-to-endfor usability, security and impact prior to deployment to production.

## Version Control

Policies were last updated April 11th, 2014.