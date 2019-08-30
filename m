From: khalid.aziz at oracle.com (Khalid Aziz)
Date: Fri, 30 Aug 2019 15:35:06 -0600
Subject: [Linux-kernel-mentees] [RFC PATCH 0/2] Add predictive memory
	reclamation and compaction
In-Reply-To: <20190827061606.GN7538@dhcp22.suse.cz>
References: <20190813014012.30232-1-khalid.aziz@oracle.com>
	<20190813140553.GK17933@dhcp22.suse.cz>
	<3cb0af00-f091-2f3e-d6cc-73a5171e6eda@oracle.com>
	<20190814085831.GS17933@dhcp22.suse.cz>
	<d3895804-7340-a7ae-d611-62913303e9c5@oracle.com>
	<20190815170215.GQ9477@dhcp22.suse.cz>
	<2668ad2e-ee52-8c88-22c0-1952243af5a1@oracle.com>
	<20190821140632.GI3111@dhcp22.suse.cz>
	<20190826204420.GA16800@bharath12345-Inspiron-5559>
	<20190827061606.GN7538@dhcp22.suse.cz>
Message-ID: <23eca880-d0d7-00f9-cb1b-b2998f2a1dff@oracle.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On 8/27/19 12:16 AM, Michal Hocko wrote:
> On Tue 27-08-19 02:14:20, Bharath Vedartham wrote:
>> Hi Michal,
>>
>> Here are some of my thoughts,
>> On Wed, Aug 21, 2019 at 04:06:32PM +0200, Michal Hocko wrote:
>>> On Thu 15-08-19 14:51:04, Khalid Aziz wrote:
>>>> Hi Michal,
>>>>
>>>> The smarts for tuning these knobs can be implemented in userspace and
>>>> more knobs added to allow for what is missing today, but we get back to
>>>> the same issue as before. That does nothing to make kernel self-tuning
>>>> and adds possibly even more knobs to userspace. Something so fundamental
>>>> to kernel memory management as making free pages available when they are
>>>> needed really should be taken care of in the kernel itself. Moving it to
>>>> userspace just means the kernel is hobbled unless one installs and tunes
>>>> a userspace package correctly.
>>>
>>> From my past experience the existing autotunig works mostly ok for a
>>> vast variety of workloads. A more clever tuning is possible and people
>>> are doing that already. Especially for cases when the machine is heavily
>>> overcommited. There are different ways to achieve that. Your new
>>> in-kernel auto tuning would have to be tested on a large variety of
>>> workloads to be proven and riskless. So I am quite skeptical to be
>>> honest.
>> Could you give some references to such works regarding tuning the kernel? 
> 
> Talk to Facebook guys and their usage of PSI to control the memory
> distribution and OOM situations.
> 
>> Essentially, Our idea here is to foresee potential memory exhaustion.
>> This foreseeing is done by observing the workload, observing the memory
>> usage of the workload. Based on this observations, we make a prediction
>> whether or not memory exhaustion could occur.
> 
> I understand that and I am not disputing this can be useful. All I do
> argue here is that there is unlikely a good "crystall ball" for most/all
> workloads that would justify its inclusion into the kernel and that this
> is something better done in the userspace where you can experiment and
> tune the behavior for a particular workload of your interest.
> 
> Therefore I would like to shift the discussion towards existing APIs and
> whether they are suitable for such an advance auto-tuning. I haven't
> heard any arguments about missing pieces.
> 

We seem to be in agreement that dynamic tuning is a useful tool. The
question is does that tuning belong in the kernel or in userspace. I see
your point that putting it in userspace allows for faster evolution of
such predictive algorithm than it would be for in-kernel algorithm. I
see following pros and cons with that approach:

+ Keeps complexity of predictive algorithms out of kernel and allows for
faster evolution of these algorithms in userspace.

+ Tuning algorithm can be fine-tuned to specific workloads as appropriate

- Kernel is not self-tuning and is dependent upon a userspace tool to
perform well in a fundamental area of memory management.

- More knobs get added to already crowded field of knobs to allow for
userspace to tweak mm subsystem for better performance.

As for adding predictive algorithm to kernel, I see following pros and cons:

+ Kernel becomes self-tuning and can respond to varying workloads better.

+ Allows for number of user visible tuning knobs to be reduced.

- Getting predictive algorithm right is important to ensure none of the
users see worse performance than today.

- Adds a certain level of complexity to mm subsystem

Pushing the burden of tuning kernel to userspace is no different from
where we are today and we still have allocation stall issues after years
of tuning from userspace. Adding more knobs to aid tuning from userspace
just makes the kernel look even more complex to the users. In my
opinion, a self tuning kernel should be the base for long term solution.
We can still export knobs to userspace to allow for users with specific
needs to further fine-tune but the base kernel should work well enough
for majority of users. We are not there at this point. We can discuss
what are the missing pieces to support further tuning from userspace but
is continuing to tweak from userpace the right long term strategy?

Assuming we want to continue to support tuning from userspace instead, I
can't say more knobs are needed right now. We may have enough knobs and
monitors available between /proc/buddyinfo, /sys/devices/system/node and
/proc/sys/vm. Right values for these knobs and their interaction is not
always clear. Maybe we need to simplify these knobs into something more
understandable for average user as opposed to adding more knobs.

--
Khalid
