From: davem at davemloft.net (David Miller)
Date: Thu, 27 Jun 2019 10:34:24 -0700 (PDT)
Subject: [Linux-kernel-mentees] [PATCH v2] packet: Fix undefined
 behavior in bit shift
In-Reply-To: <20190627165726.p6k3tugjs2gzgnjh@rYz3n>
References: <7f6f44b2-3fe4-85f6-df3c-ad59f2eadba2@linuxfoundation.org>
	<20190627.092253.1878691006683087825.davem@davemloft.net>
	<20190627165726.p6k3tugjs2gzgnjh@rYz3n>
Message-ID: <20190627.103424.2376390104509352.davem@davemloft.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

From: Jiunn Chang <c0d1n61at3 at gmail.com>
Date: Thu, 27 Jun 2019 11:57:28 -0500

> On Thu, Jun 27, 2019 at 09:22:53AM -0700, David Miller wrote:
>> From: Shuah Khan <skhan at linuxfoundation.org>
>> Date: Wed, 26 Jun 2019 21:32:52 -0600
>> 
>> > On 6/26/19 9:25 PM, Jiunn Chang wrote:
>> >> Shifting signed 32-bit value by 31 bits is undefined.  Changing most
>> >> significant bit to unsigned.
>> >> Changes included in v2:
>> >>    - use subsystem specific subject lines
>> >>    - CC required mailing lists
>> >> 
>> > 
>> > These version change lines don't belong in the change log.
>> 
>> For networking changes I actually like the change lines to be in the
>> commit log.  So please don't stray people this way, thanks.
> 
> Hello David,
> 
> Would you like me to send v3 with the change log in the patch description?

I'll use v2 which had this done correctly.
