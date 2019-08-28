From: linux.bhar at gmail.com (Bharath Vedartham)
Date: Wed, 28 Aug 2019 18:39:22 +0530
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
Message-ID: <20190828130922.GA10127@bharath12345-Inspiron-5559>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Hi Michal, Thank you for spending your time on this.
On Tue, Aug 27, 2019 at 08:16:06AM +0200, Michal Hocko wrote:
> On Tue 27-08-19 02:14:20, Bharath Vedartham wrote:
> > Hi Michal,
> > 
> > Here are some of my thoughts,
> > On Wed, Aug 21, 2019 at 04:06:32PM +0200, Michal Hocko wrote:
> > > On Thu 15-08-19 14:51:04, Khalid Aziz wrote:
> > > > Hi Michal,
> > > > 
> > > > The smarts for tuning these knobs can be implemented in userspace and
> > > > more knobs added to allow for what is missing today, but we get back to
> > > > the same issue as before. That does nothing to make kernel self-tuning
> > > > and adds possibly even more knobs to userspace. Something so fundamental
> > > > to kernel memory management as making free pages available when they are
> > > > needed really should be taken care of in the kernel itself. Moving it to
> > > > userspace just means the kernel is hobbled unless one installs and tunes
> > > > a userspace package correctly.
> > > 
> > > From my past experience the existing autotunig works mostly ok for a
> > > vast variety of workloads. A more clever tuning is possible and people
> > > are doing that already. Especially for cases when the machine is heavily
> > > overcommited. There are different ways to achieve that. Your new
> > > in-kernel auto tuning would have to be tested on a large variety of
> > > workloads to be proven and riskless. So I am quite skeptical to be
> > > honest.
> > Could you give some references to such works regarding tuning the kernel? 
> 
> Talk to Facebook guys and their usage of PSI to control the memory
> distribution and OOM situations.
Yup. Thanks for the pointer.
> > Essentially, Our idea here is to foresee potential memory exhaustion.
> > This foreseeing is done by observing the workload, observing the memory
> > usage of the workload. Based on this observations, we make a prediction
> > whether or not memory exhaustion could occur.
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
I understand your concern here. Just confirming, by APIs you are
referring to sysctls, sysfs files and stuff like that right?
> > If memory exhaustion
> > occurs, we reclaim some more memory. kswapd stops reclaim when
> > hwmark is reached. hwmark is usually set to a fairly low percentage of
> > total memory, in my system for zone Normal hwmark is 13% of total pages.
> > So there is scope for reclaiming more pages to make sure system does not
> > suffer from a lack of pages. 
> 
> Yes and we have ways to control those watermarks that your monitoring
> tool can use to alter the reclaim behavior.
Just to confirm here, I am aware of one way which is to alter
min_kfree_bytes values. What other ways are there to alter watermarks
from user space? 
> [...]
> > > Therefore I would really focus on discussing whether we have sufficient
> > > APIs to tune the kernel to do the right thing when needed. That requires
> > > to identify gaps in that area. 
> > One thing that comes to my mind is based on the issue Khalid mentioned
> > earlier on how his desktop took more than 30secs to boot up because of
> > the caches using up a lot of memory.
> > Rather than allowing any unused memory to be the page cache, would it be
> > a good idea to fix a size for the caches and elastically change the size
> > based on the workload?
> 
> I do not think so. Limiting the pagecache is unlikely to help as it is
> really cheap to reclaim most of the time. In those cases when this is
> not the case (e.g. the underlying FS needs to flush and/or metadata)
> then the same would be possible in a restricted page cache situation
> and you could easily end up stalled waiting for pagecache (e.g. any
> executable/library) while there is a lot of memory.
That makes sense to me.
> I cannot comment on the Khalid's example because there were no details
> there but I would be really surprised if the primary source of stall was
> the pagecache.
Should have done more research before talking :) Sorry about that.
> -- 
> Michal Hocko
> SUSE Labs
