From: mhocko@kernel.org (Michal Hocko)
Date: Wed, 28 Aug 2019 15:15:01 +0200
Subject: [Linux-kernel-mentees] [RFC PATCH 0/2] Add predictive memory
	reclamation and compaction
In-Reply-To: <20190828130922.GA10127@bharath12345-Inspiron-5559>
References: <20190813140553.GK17933@dhcp22.suse.cz>
	<3cb0af00-f091-2f3e-d6cc-73a5171e6eda@oracle.com>
	<20190814085831.GS17933@dhcp22.suse.cz>
	<d3895804-7340-a7ae-d611-62913303e9c5@oracle.com>
	<20190815170215.GQ9477@dhcp22.suse.cz>
	<2668ad2e-ee52-8c88-22c0-1952243af5a1@oracle.com>
	<20190821140632.GI3111@dhcp22.suse.cz>
	<20190826204420.GA16800@bharath12345-Inspiron-5559>
	<20190827061606.GN7538@dhcp22.suse.cz>
	<20190828130922.GA10127@bharath12345-Inspiron-5559>
Message-ID: <20190828131501.GK28313@dhcp22.suse.cz>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190828131501.HY1hasQih-3_OFeUN2IBjZ8djY9QEosKLaen_SCnPfU@z>

On Wed 28-08-19 18:39:22, Bharath Vedartham wrote:
[...]
> > Therefore I would like to shift the discussion towards existing APIs and
> > whether they are suitable for such an advance auto-tuning. I haven't
> > heard any arguments about missing pieces.
> I understand your concern here. Just confirming, by APIs you are
> referring to sysctls, sysfs files and stuff like that right?

Yup

> > > If memory exhaustion
> > > occurs, we reclaim some more memory. kswapd stops reclaim when
> > > hwmark is reached. hwmark is usually set to a fairly low percentage of
> > > total memory, in my system for zone Normal hwmark is 13% of total pages.
> > > So there is scope for reclaiming more pages to make sure system does not
> > > suffer from a lack of pages. 
> > 
> > Yes and we have ways to control those watermarks that your monitoring
> > tool can use to alter the reclaim behavior.
> Just to confirm here, I am aware of one way which is to alter
> min_kfree_bytes values. What other ways are there to alter watermarks
> from user space? 

/proc/sys/vm/watermark_*factor
-- 
Michal Hocko
SUSE Labs
