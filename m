From: khalid.aziz at oracle.com (Khalid Aziz)
Date: Thu, 15 Aug 2019 14:51:04 -0600
Subject: [Linux-kernel-mentees] [RFC PATCH 0/2] Add predictive memory
	reclamation and compaction
In-Reply-To: <20190815170215.GQ9477@dhcp22.suse.cz>
References: <20190813014012.30232-1-khalid.aziz@oracle.com>
	<20190813140553.GK17933@dhcp22.suse.cz>
	<3cb0af00-f091-2f3e-d6cc-73a5171e6eda@oracle.com>
	<20190814085831.GS17933@dhcp22.suse.cz>
	<d3895804-7340-a7ae-d611-62913303e9c5@oracle.com>
	<20190815170215.GQ9477@dhcp22.suse.cz>
Message-ID: <2668ad2e-ee52-8c88-22c0-1952243af5a1@oracle.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On 8/15/19 11:02 AM, Michal Hocko wrote:
> On Thu 15-08-19 10:27:26, Khalid Aziz wrote:
>> On 8/14/19 2:58 AM, Michal Hocko wrote:
>>> On Tue 13-08-19 09:20:51, Khalid Aziz wrote:
>>>> On 8/13/19 8:05 AM, Michal Hocko wrote:
>>>>> On Mon 12-08-19 19:40:10, Khalid Aziz wrote:
>>>>> [...]
>>>>>> Patch 1 adds code to maintain a sliding lookback window of (time, number
>>>>>> of free pages) points which can be updated continuously and adds code to
>>>>>> compute best fit line across these points. It also adds code to use the
>>>>>> best fit lines to determine if kernel must start reclamation or
>>>>>> compaction.
>>>>>>
>>>>>> Patch 2 adds code to collect data points on free pages of various orders
>>>>>> at different points in time, uses code in patch 1 to update sliding
>>>>>> lookback window with these points and kicks off reclamation or
>>>>>> compaction based upon the results it gets.
>>>>>
>>>>> An important piece of information missing in your description is why
>>>>> do we need to keep that logic in the kernel. In other words, we have
>>>>> the background reclaim that acts on a wmark range and those are tunable
>>>>> from the userspace. The primary point of this background reclaim is to
>>>>> keep balance and prevent from direct reclaim. Why cannot you implement
>>>>> this or any other dynamic trend watching watchdog and tune watermarks
>>>>> accordingly? Something similar applies to kcompactd although we might be
>>>>> lacking a good interface.
>>>>>
>>>>
>>>> Hi Michal,
>>>>
>>>> That is a very good question. As a matter of fact the initial prototype
>>>> to assess the feasibility of this approach was written in userspace for
>>>> a very limited application. We wrote the initial prototype to monitor
>>>> fragmentation and used /sys/devices/system/node/node*/compact to trigger
>>>> compaction. The prototype demonstrated this approach has merits.
>>>>
>>>> The primary reason to implement this logic in the kernel is to make the
>>>> kernel self-tuning.
>>>
>>> What makes this particular self-tuning an universal win? In other words
>>> there are many ways to analyze the memory pressure and feedback it back
>>> that I can think of. It is quite likely that very specific workloads
>>> would have very specific demands there. I have seen cases where are
>>> trivial increase of min_free_kbytes to normally insane value worked
>>> really great for a DB workload because the wasted memory didn't matter
>>> for example.
>>
>> Hi Michal,
>>
>> The problem is not so much as do we have enough knobs available, rather
>> how do we tweak them dynamically to avoid allocation stalls. Knobs like
>> watermarks and min_free_kbytes are set once typically and left alone.
> 
> Does anything prevent from tuning these knobs more dynamically based on
> already exported metrics?

Hi Michal,

The smarts for tuning these knobs can be implemented in userspace and
more knobs added to allow for what is missing today, but we get back to
the same issue as before. That does nothing to make kernel self-tuning
and adds possibly even more knobs to userspace. Something so fundamental
to kernel memory management as making free pages available when they are
needed really should be taken care of in the kernel itself. Moving it to
userspace just means the kernel is hobbled unless one installs and tunes
a userspace package correctly.

> 
>> Allocation stalls show up even on much smaller scale than large DB or
>> cloud platforms. I have seen it on a desktop class machine running a few
>> services in the background. Desktop is running gnome3, I would lock the
>> screen and come back to unlock it a day or two later. In that time most
>> of memory has been consumed by buffer/page cache. Just unlocking the
>> screen can take 30+ seconds while system reclaims pages to be able swap
>> back in all the processes that were inactive so far.
> 
> This sounds like a bug to me.

Quite possibly. I had seen that behavior with 4.17, 4.18 and 4.19
kernels. I then just moved enough tasks off of my machine to other
machines to make the problem go away. So I can't say if the problem has
persisted past 4.19.

> 
>> It is true different workloads will have different requirements and that
>> is what I am attempting to address here. Instead of tweaking the knobs
>> statically based upon one workload requirements, I am looking at the
>> trend of memory consumption instead. A best fit line showing recent
>> trend can be quite indicative of what the workload is doing in terms of
>> memory.
> 
> Is there anything preventing from following that trend from the
> userspace and trigger background reclaim earlier to not even get to the
> direct reclaim though?

It is possible to do that in userspace for compaction. We will need a
smaller hammer than drop_cache to do the same for reclamation. This
still makes kernel dependent upon a properly configured userspace
program for it to do something as fundamental as free page management.
That does not sound like a good situation. Allocation stalls have been a
problem for many years (I could find patch from as far back as 2002
attempting to address allocation stalls). More tuning knobs have been
temporary solution at best since workloads and storage technology keep
changing and processors keep getting faster overall.

> 
>> For instance, a cloud server might be running a certain number
>> of instances for a few days and it can end up using any memory not used
>> up by tasks, for buffer/page cache. Now the sys admin gets a request to
>> launch another instance and when they try to to do that, system starts
>> to allocate pages and soon runs out of free pages. We are now in direct
>> reclaim path and it can take significant amount of time to find all free
>> pages the new task needs. If the kernel were watching the memory
>> consumption trend instead, it could see that the trend line shows a
>> complete exhaustion of free pages or 100% fragmentation in near future,
>> irrespective of what the workload is.
> 
> I am confused now. How can an unpredictable action (like sys admin
> starting a new workload) be handled by watching a memory consumption
> history trend? From the above description I would expect that the system
> would be in a balanced state for few days when a new instance is
> launched. The only reasonable thing to do then is to trigger the reclaim
> before the workload is spawned but then what is the actual difference
> between direct reclaim and an early reclaim?

If kernel watches trend far ahead enough, it can start
reclaiming/compacting well in advance and keep direct reclamation at bay
even if there is sudden surge of memory demand. A pathological case of
userspace suddenly demanding 100's of GB of memory in one request is
always difficult to tackle. For such cases, triggering
reclamation/compaction and waiting to launch new process until enough
free pages are available might be the only solution. A more normal case
will be a continuous stream of page allocations until a database is
fully populated or a new server instance is launched. It is like a
bucket with a hole. We can wait to start filling it until water gets
very low in it or notice that the hole at the bottom has been unplugged
and water is draining fast, so we start filling it before water gets too
low. If we have been observing how fast the bucket fills up with no leak
and how fast is the current drain, we can start filling in advance
enough that water never gets too low. That is what I referred to as
improvements to current patch, i.e. track current reclamation/compaction
rate in kswapd and kcompactd and use those rates to determine how far in
advance do we start reclaiming/compacting.

> 
> [...]
>>> I agree on this point. Is the current set of tunning sufficient? What
>>> would be missing if not?
>>>
>>
>> We have knob available to force compaction immediately. That is helpful
>> and in some case, sys admins have resorted to forcing compaction on all
>> zones before launching a new cloud instance or loading a new database.
>> Some admins have resorted to using /proc/sys/vm/drop_caches to force
>> buffer/page cache pages to be freed up. Either of these solutions causes
>> system load to go up immediately while kswapd/kcompactd run to free up
>> and compact pages. This is far from ideal. Other knobs available seem to
>> be hard to set correctly especially on servers that run mixed workloads
>> which results in a regular stream of customer complaints coming in about
>> system stalling at most inopportune times.
> 
> Then let's talk about what is missing in the existing tuning we already
> provide. I do agree that compaction needs some love but I am under
> impression that min_free_kbytes and watermark_*_factor should give a
> decent abstraction to control the background reclaim. If that is not the
> case then I am really interested on examples because I might be easily
> missing something there.

Just last week an email crossed my mailbox where an order 4 allocation
failed on a server that has 768 GB memory and had 355,000 free pages of
order 2 and lower available at the time. That allocation failure brought
down an important service and was a significant disruption.

These knobs do give some control to userspace but their values depend
upon workload and it is easy enough to set them wrong. Finding the right
value is not easy for servers that run mixed workloads. So it is not
that there are not enough knobs or we can not add more knobs. The
question is is that the right direction to go or do we make kernel
self-tuning and give it the capability to deal with these issues without
requiring sys admins to be able to determine correct values for these
knobs for every new workload.

Thanks,
Khalid
