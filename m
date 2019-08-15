From: ddutile at redhat.com (Don Dutile)
Date: Thu, 15 Aug 2019 10:37:13 -0400
Subject: [Linux-kernel-mentees] [PATCH v2 2/3] PCI: sysfs: Change
 permissions from symbolic to octal
In-Reply-To: <20190814053846.GA253360@google.com>
References: <20190809195721.34237-1-skunberg.kelsey@gmail.com>
	<20190813204513.4790-1-skunberg.kelsey@gmail.com>
	<20190813204513.4790-3-skunberg.kelsey@gmail.com>
	<20190814053846.GA253360@google.com>
Message-ID: <b4c0d5b4-7243-ba96-96d1-041a264ac499@redhat.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On 08/14/2019 01:38 AM, Bjorn Helgaas wrote:
> [+cc Bodong, Don, Greg for permission question]
> 
> On Tue, Aug 13, 2019 at 02:45:12PM -0600, Kelsey Skunberg wrote:
>> Symbolic permissions such as "(S_IWUSR | S_IWGRP)" are not
>> preferred and octal permissions should be used instead. Change all
>> symbolic permissions to octal permissions.
>>
>> Example of old:
>>
>> "(S_IWUSR | S_IWGRP)"
>>
>> Example of new:
>>
>> "0220"
> 
> 
>>   static DEVICE_ATTR_RO(sriov_totalvfs);
>> -static DEVICE_ATTR(sriov_numvfs, (S_IRUGO | S_IWUSR | S_IWGRP),
>> -				  sriov_numvfs_show, sriov_numvfs_store);
>> +static DEVICE_ATTR(sriov_numvfs, 0664, sriov_numvfs_show, sriov_numvfs_store);
>>   static DEVICE_ATTR_RO(sriov_offset);
>>   static DEVICE_ATTR_RO(sriov_stride);
>>   static DEVICE_ATTR_RO(sriov_vf_device);
>> -static DEVICE_ATTR(sriov_drivers_autoprobe, (S_IRUGO | S_IWUSR | S_IWGRP),
>> -		   sriov_drivers_autoprobe_show, sriov_drivers_autoprobe_store);
>> +static DEVICE_ATTR(sriov_drivers_autoprobe, 0664, sriov_drivers_autoprobe_show,
>> +		   sriov_drivers_autoprobe_store);
> 
> Greg noticed that sriov_numvfs and sriov_drivers_autoprobe have
> "unusual" permissions.  These were added by:
> 
>    0e7df22401a3 ("PCI: Add sysfs sriov_drivers_autoprobe to control VF driver binding")
>    1789382a72a5 ("PCI: SRIOV control and status via sysfs")
> 
> Kelsey's patch correctly preserves the existing permissions, but we
> should double-check that they are the permissions they want, and
> possibly add a comment about why they're different from the rest.
> 
> Bjorn
> 
The rest being? ... 0644 vs 0664 ?
The file is read & written, thus the (first) 6; I'll have to dig through very old (7 yr) notes to see if the second 6 is needed for libvirt (so it doesn't have to be root to enable).

-dd
