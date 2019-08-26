From: linux.bhar@gmail.com (Bharath Vedartham)
Date: Tue, 27 Aug 2019 02:14:20 +0530
Subject: [Linux-kernel-mentees] [RFC PATCH 0/2] Add predictive memory
	reclamation and compaction
In-Reply-To: <20190821140632.GI3111@dhcp22.suse.cz>
References: <20190813014012.30232-1-khalid.aziz@oracle.com>
	<20190813140553.GK17933@dhcp22.suse.cz>
	<3cb0af00-f091-2f3e-d6cc-73a5171e6eda@oracle.com>
	<20190814085831.GS17933@dhcp22.suse.cz>
	<d3895804-7340-a7ae-d611-62913303e9c5@oracle.com>
	<20190815170215.GQ9477@dhcp22.suse.cz>
	<2668ad2e-ee52-8c88-22c0-1952243af5a1@oracle.com>
	<20190821140632.GI3111@dhcp22.suse.cz>
Message-ID: <20190826204420.GA16800@bharath12345-Inspiron-5559>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190826204420.IrFQJEw9cKscgFqZrINJij26MJRc7oscQNRrVPuPlz4@z>

Hi Michal,

Here are some of my thoughts,
On Wed, Aug 21, 2019 at 04:06:32PM +0200, Michal Hocko wrote:
> On Thu 15-08-19 14:51:04, Khalid Aziz wrote:
> > Hi Michal,
> > 
> > The smarts for tuning these knobs can be implemented in userspace and
> > more knobs added to allow for what is missing today, but we get back to
> > the same issue as before. That does nothing to make kernel self-tuning
> > and adds possibly even more knobs to userspace. Something so fundamental
> > to kernel memory management as making free pages available when they are
> > needed really should be taken care of in the kernel itself. Moving it to
> > userspace just means the kernel is hobbled unless one installs and tunes
> > a userspace package correctly.
> 
> From my past experience the existing autotunig works mostly ok for a
> vast variety of workloads. A more clever tuning is possible and people
> are doing that already. Especially for cases when the machine is heavily
> overcommited. There are different ways to achieve that. Your new
> in-kernel auto tuning would have to be tested on a large variety of
> workloads to be proven and riskless. So I am quite skeptical to be
> honest.
Could you give some references to such works regarding tuning the kernel? 

Essentially, Our idea here is to foresee potential memory exhaustion.
This foreseeing is done by observing the workload, observing the memory
usage of the workload. Based on this observations, we make a prediction
whether or not memory exhaustion could occur. If memory exhaustion
occurs, we reclaim some more memory. kswapd stops reclaim when
hwmark is reached. hwmark is usually set to a fairly low percentage of
total memory, in my system for zone Normal hwmark is 13% of total pages.
So there is scope for reclaiming more pages to make sure system does not
suffer from a lack of pages. 

Since we are "predicting", there could be mistakes in our prediction.
The question is how bad are the mistakes? How much does a wrong
prediction cost? 

A right prediction would be a win. We rightfully predict that there could be
exhaustion, this would lead to us reclaiming more memory(than hwmark)/compacting
memory beforehand(unlike kcompactd which does it on demand).

A wrong prediction on the other hand can be categorized into 2
situations: 
(i) We foresee memory exhaustion but there is no memory exhaustion in
the future. In this case, we would be reclaiming more memory for not a lot
of use. This situation is not entirely bad but we definitly waste a few
clock cycles.
(ii) We don't foresee memory exhaustion but there is memory exhaustion
in the future. This is a bad case where we may end up going into direct
compaction/reclaim. But it could be the case that the memory exhaustion
is far in the future and even though we didnt see it, kswapd could have
reclaimed that memory or drop_cache occured.

How often we hit wrong predictions of type (ii) would really determine our
efficiency. 

Coming to your situation of provisioning vms. A situation where our work
will come to good is when there is a cloud burst. When the demand for
vms is super high, our algorithm could adapt to the increase in demand
for these vms and reclaim more memory/compact more memory to reduce
allocation stalls and improve performance.
> Therefore I would really focus on discussing whether we have sufficient
> APIs to tune the kernel to do the right thing when needed. That requires
> to identify gaps in that area. 
One thing that comes to my mind is based on the issue Khalid mentioned
earlier on how his desktop took more than 30secs to boot up because of
the caches using up a lot of memory.
Rather than allowing any unused memory to be the page cache, would it be
a good idea to fix a size for the caches and elastically change the size
based on the workload?

Thank you
Bharath

> -- 
> Michal Hocko
> SUSE Labs
> 
