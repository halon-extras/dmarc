# Domain-based Message Authentication, Reporting & Conformance (DMARC) 
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

## Exported functions

These functions needs to be [imported](https://docs.halon.io/hsl/structures.html#import) from the `extras://dmarc` module path.

### dmarc(fp[, senderip, senderhelo, senderdomain])

**Params**

- fp `File` - the mail file
- senderip `string` - the sender's IP
- senderhelo `string` - the sender's HELO
- senderdomain `string` - the sender's domain

**Example (EOD)**

```
import { dmarc } from "extras://dmarc";

$result = dmarc($arguments["mail"], $connection["remoteip"], $connection["helo"]["host"], $transaction["senderaddress"]["domain"]);
```

**Returns**

The dmarc functions returns an array of values, it will always contain a ``result`` property. Depending on where the DMARC validation fail, other fields may also be populated. ``result`` property may contain the following results (with recommended actions).

* `permerror` (reject)
* `temperror` (defer)
* `policy_absent` (accept)
* `reject` (reject)
* `quarantine` (quarantine/reject)
* `none` (accept)
* `pass` (accept)

Other properties are (not always available)

* `reason` (string) textual reason why the result was given
* `spf` (array) spf_query() result object
* `dkim` (array) array of MailMessage.verifyDKIM results
* `dmarc` (array) DMARC record
* `pct-selected` (boolean) if the policy action was choose based on pct
* `spf_align` ("pass", "fail", "unaligned")
* `dkim_align` ("pass", "fail", "unaligned")
* `policy` (string) the tag-p policy used
