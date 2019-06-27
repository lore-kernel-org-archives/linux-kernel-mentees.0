From: davem at davemloft.net (David Miller)
Date: Thu, 27 Jun 2019 09:22:53 -0700 (PDT)
Subject: [Linux-kernel-mentees] [PATCH v2] packet: Fix undefined
 behavior in bit shift
In-Reply-To: <7f6f44b2-3fe4-85f6-df3c-ad59f2eadba2@linuxfoundation.org>
References: <20190627010137.5612-1-c0d1n61at3@gmail.com>
	<20190627032532.18374-2-c0d1n61at3@gmail.com>
	<7f6f44b2-3fe4-85f6-df3c-ad59f2eadba2@linuxfoundation.org>
Message-ID: <20190627.092253.1878691006683087825.davem@davemloft.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

From: Shuah Khan <skhan at linuxfoundation.org>
Date: Wed, 26 Jun 2019 21:32:52 -0600

> On 6/26/19 9:25 PM, Jiunn Chang wrote:
>> Shifting signed 32-bit value by 31 bits is undefined.  Changing most
>> significant bit to unsigned.
>> Changes included in v2:
>>    - use subsystem specific subject lines
>>    - CC required mailing lists
>> 
> 
> These version change lines don't belong in the change log.

For networking changes I actually like the change lines to be in the
commit log.  So please don't stray people this way, thanks.
