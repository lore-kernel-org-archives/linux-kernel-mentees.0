From: khalid.aziz at oracle.com (Khalid Aziz)
Date: Tue, 13 Aug 2019 09:20:51 -0600
Subject: [Linux-kernel-mentees] [RFC PATCH 0/2] Add predictive memory
	reclamation and compaction
In-Reply-To: <20190813140553.GK17933@dhcp22.suse.cz>
References: <20190813014012.30232-1-khalid.aziz@oracle.com>
	<20190813140553.GK17933@dhcp22.suse.cz>
Message-ID: <3cb0af00-f091-2f3e-d6cc-73a5171e6eda@oracle.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On 8/13/19 8:05 AM, Michal Hocko wrote:
> On Mon 12-08-19 19:40:10, Khalid Aziz wrote:
> [...]
>> Patch 1 adds code to maintain a sliding lookback window of (time, number
>> of free pages) points which can be updated continuously and adds code to
>> compute best fit line across these points. It also adds code to use the
>> best fit lines to determine if kernel must start reclamation or
>> compaction.
>>
>> Patch 2 adds code to collect data points on free pages of various orders
>> at different points in time, uses code in patch 1 to update sliding
>> lookback window with these points and kicks off reclamation or
>> compaction based upon the results it gets.
> 
> An important piece of information missing in your description is why
> do we need to keep that logic in the kernel. In other words, we have
> the background reclaim that acts on a wmark range and those are tunable
> from the userspace. The primary point of this background reclaim is to
> keep balance and prevent from direct reclaim. Why cannot you implement
> this or any other dynamic trend watching watchdog and tune watermarks
> accordingly? Something similar applies to kcompactd although we might be
> lacking a good interface.
> 

Hi Michal,

That is a very good question. As a matter of fact the initial prototype
to assess the feasibility of this approach was written in userspace for
a very limited application. We wrote the initial prototype to monitor
fragmentation and used /sys/devices/system/node/node*/compact to trigger
compaction. The prototype demonstrated this approach has merits.

The primary reason to implement this logic in the kernel is to make the
kernel self-tuning. The more knobs we have externally, the more complex
it becomes to tune the kernel externally. If we can make the kernel
self-tuning, we can actually eliminate external knobs and simplify
kernel admin. Inspite of availability of tuning knobs and large number
of tuning guides for databases and cloud platforms, allocation stalls is
a routinely occurring problem on customer deployments. A best fit line
algorithm shows immeasurable impact on system performance yet provides
measurable improvement and room for further refinement. Makes sense?

Thanks,
Khalid
