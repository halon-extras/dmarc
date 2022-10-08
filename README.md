## Domain-based Message Authentication, Reporting & Conformance (DMARC) 
An DMARC implementation written in HSL

## Installation

Follow the [instructions](https://docs.halon.io/manual/comp_install.html#installation) in our manual to add our package repository and then run the below command.

### Ubuntu

```
apt-get install halon-extras-dmarc
```

### RHEL

```
yum install halon-extras-dmarc
```

## Usage

```
import { dmarc } from "extras://dmarc";

$result = dmarc($mail, $senderip, $senderhelo, $senderdomain);
```
