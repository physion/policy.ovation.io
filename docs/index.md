# Introduction

Ovation.io, Inc. ("Ovation") is committed to ensuring the confidentiality, privacy, integrity, and availability of all electronic protected health information (ePHI) it receives, maintains, processes and/or transmits on behalf of its Customers. As providers of compliant, hosted infrastructure used by health technology vendors, developers, designers, agencies, custom development shops, and enterprises, Ovation strives to maintain compliance, proactively address information security, mitigate risk for its Customers, and assure known breaches are completely and effectively communicated in a timely manner. The following documents address core policies used by Ovation to maintain compliance and assure the proper protections of infrastructure used to store, process, and transmit ePHI for Ovation Customers.

## Compliance Inheritance

Ovation provides compliant hosted software infrastructure for its Customers. Ovation's deployment infrastructure is provided by Catalyze. Catalyze has been through a HIPAA compliance audit by a national, 3rd party compliance firm, to validate and map organizational policies and technical settings to HIPAA rules. Ovation is currently undergoing a HITRUST audit to achieve HITRUST Certification.

Ovation signs business associate agreements (BAAs) with its Customers. These BAAs outline Ovation obligations and Customer obligations, as well as liability in the case of a breach.

Certain aspects of compliance cannot be inherited. Because of this, Ovation Customers, in order to achieve full compliance or HITRUST Certification, must implement certain organizational policies. These policies and aspects of compliance fall outside of the services and obligations of Ovation.

Below are mappings of HIPAA Rules to Ovation controls.

## Ovation Organizational Concepts

The physical infrastructure environment is hosted at [Rackspace](http://broadcast.rackspace.com/downloads/pdfs/RackspaceSecurityApproach.pdf) and [Amazon Web Services](http://aws.amazon.com) (AWS). The network components and supporting network infrastructure is contained within AWS and Rackspace infrastructure and managed by Rackspace and AWS. Ovation does not have physical access into the network components. The Ovation environment consists of Cisco firewalls, Apache web servers, Dropwizard Java application servers, Percona and Riak database servers, Logstash logging servers, Linux Ubuntu monitoring servers, Puppet access control server, OSSEC IDS services, Docker containers, Linux CentOS bastion host, and developer tools servers running on Linux Ubuntu.

Within the Ovation Platform, both on Rackspace and AWS, all data transmission is encrypted and all hard drives are encrypted so data at rest is also encrypted; this applies to all servers - those hosting Docker containers, databases, APIs, log servers, etc. Ovation assumes all data *may* contain ePHI, even though our Risk Assessment does not indicate this is the case, and provides appropriate protections based on that assumption.

<!-- There is data and network segmentation in place but differently implemented on Rackspace and AWS versions of the Ovation Platform.

* With Rackspace, hosted load balancers segment data and traffic while Cisco firewalls route traffic to private subnets for each PaaS Customer and for Platform Add-ons.
* With AWS, hosted load balancers segment data across dedicated Virtual Private Clouds for each Customer and for Platform Add-ons. -->

<!-- The result of segmentation strategies employed by Ovation effectively create RFC 1918, or dedicated, private segmented and separated networks and IP spaces, for each PaaS Customer and for Platform Add-ons.  -->

Additionally, IPtables is used on each each server for logical segmentation. The IPtables are configured to restrict access to only justified ports and protocols. Ovation has implemented strict logical access controls so that only authorized personnel are given access to the internal management servers. The environment is configured so that data is transmitted from the load balancers to the application servers over an SSL encrypted session.

<!-- In the case of Platform Add-ons, once the data is received from the application server, a series of Application Programming Interface (API) calls is made to the database servers where the ePHI resides. The ePHI is separated into Riak and Percona databases through programming logic built, so that access to one database server will not present you with the full ePHI spectrum.  -->

The bastion host, Apache web server, Dropwizard application servers are externally facing and accessible via the Internet. The database servers, where the ePHI resides, are located on the internal Ovation network and can only be accessed directly over an SSH connection through the bastion host. The access to the internal database is restricted to a limited number of personnel and strictly controlled to only those personnel with a business justified reason. Remote access to the internal servers is not accessible except through the load balancers and bastion host.

All Platform Add-ons and operating systems are tested end-to-end for usability, security and impact prior to deployment to production.

## Version Control

Policies were last updated April 17th, 2014.
