From: skhan at linuxfoundation.org (Shuah Khan)
Date: Thu, 27 Jun 2019 10:48:24 -0600
Subject: [Linux-kernel-mentees] [PATCH v5 1/5] Documentation: RCU:
 Convert RCU basic concepts to reST
In-Reply-To: <20190627111324.1db0f1ec@gandalf.local.home>
References: <20190626191249.21135-1-c0d1n61at3@gmail.com>
	<20190626200705.24501-2-c0d1n61at3@gmail.com>
	<20190627083443.4f4918a7@lwn.net>
	<20190627111324.1db0f1ec@gandalf.local.home>
Message-ID: <83bb7141-d291-de27-f833-6fa485b406b6@linuxfoundation.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On 6/27/19 9:13 AM, Steven Rostedt wrote:
> On Thu, 27 Jun 2019 08:34:43 -0600
> Jonathan Corbet <corbet at lwn.net> wrote:
> 
>> On Wed, 26 Jun 2019 15:07:01 -0500
>> Jiunn Chang <c0d1n61at3 at gmail.com> wrote:
>>
>>> RCU basic concepts reST markup.
>>>
>>> Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
>>> Reviewed-by: Joel Fernandes (Google) <joel at joelfernandes.org>
>>
>> So this is a little detail but ... your signoff should be the last thing
>> in the set of tags on the patch.
> 
> Note, I've been seeing this a lot lately, and then noticed, that when I
> downloaded a patch directly from patchwork, it placed all the
> Reviewed-by and Acked-by tags after the original Signed-off-by. I
> checked the original patch on the mailing list, and it had no other
> tags but the Signed-off-by. I then pulled one of my own patches, and it
> did it to that patch as well.
> 
> I too prefer the Signed-off-by be last, but our tooling needs to do
> this as well, otherwise it's a failure in our procedures.
> 

Thanks Steve for pointing this out. I am seeing some odd behavior with tags.

It appears some maintainers want the tags in chronological order, which
is Reviewed-by after Signed-off which doesn't make sense to me.

I prefer Signed-off-by last.

I am working on FAQ (Frequently Answered Questions) section for mentees.
I will add this to it.

thanks,
-- Shuah
