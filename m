From: skhan@linuxfoundation.org (Shuah Khan)
Date: Thu, 27 Jun 2019 11:08:51 -0600
Subject: [Linux-kernel-mentees] [PATCH v2] packet: Fix undefined
 behavior in bit shift
In-Reply-To: <CAADnVQLxrwkgHY6sg98NVfAsG3EYeJLxAevskOUdB=gNQugfSg@mail.gmail.com>
References: <20190627010137.5612-1-c0d1n61at3@gmail.com>
	<20190627032532.18374-2-c0d1n61at3@gmail.com>
	<7f6f44b2-3fe4-85f6-df3c-ad59f2eadba2@linuxfoundation.org>
	<20190627.092253.1878691006683087825.davem@davemloft.net>
	<9687ddc6-3bdb-5b2a-2934-ed9c6921551d@linuxfoundation.org>
	<CAADnVQLxrwkgHY6sg98NVfAsG3EYeJLxAevskOUdB=gNQugfSg@mail.gmail.com>
Message-ID: <7c3d7390-caff-ca2f-760e-9bb72ada90dd@linuxfoundation.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190627170851.zDaDjj9M7Q3MipWuaOYFmJNm90wNKpay6Tkns_1CqSk@z>

On 6/27/19 11:05 AM, Alexei Starovoitov wrote:
> On Thu, Jun 27, 2019 at 9:54 AM Shuah Khan <skhan at linuxfoundation.org> wrote:
>>
>> On 6/27/19 10:22 AM, David Miller wrote:
>>> From: Shuah Khan <skhan at linuxfoundation.org>
>>> Date: Wed, 26 Jun 2019 21:32:52 -0600
>>>
>>>> On 6/26/19 9:25 PM, Jiunn Chang wrote:
>>>>> Shifting signed 32-bit value by 31 bits is undefined.  Changing most
>>>>> significant bit to unsigned.
>>>>> Changes included in v2:
>>>>>      - use subsystem specific subject lines
>>>>>      - CC required mailing lists
>>>>>
>>>>
>>>> These version change lines don't belong in the change log.
>>>
>>> For networking changes I actually like the change lines to be in the
>>> commit log.  So please don't stray people this way, thanks.
>>>
>>
>> As a general rule, please don't include change lines in the commit log.
>> For networking changes that get sent to David and netdev, as David
>> points out here, he likes them in the commit log, please include them
>> in the commit log.
>>
>> I am working on FAQ (Frequently Answered Questions) section for mentees.
>> I will add this to it.
> 
> Same for bpf trees.
> We prefer developers put as much as info as possible into commit logs
> and cover letters.
> Explanation of v1->v2->v3 differences is invaluable not only at
> the point of code review, but in the future.
> 

Thanks Alex. I will add that to the FAQ.

-- Shuah
