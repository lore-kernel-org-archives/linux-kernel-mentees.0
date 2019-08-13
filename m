From: mhocko@kernel.org (Michal Hocko)
Date: Tue, 13 Aug 2019 16:05:53 +0200
Subject: [Linux-kernel-mentees] [RFC PATCH 0/2] Add predictive memory
	reclamation and compaction
In-Reply-To: <20190813014012.30232-1-khalid.aziz@oracle.com>
References: <20190813014012.30232-1-khalid.aziz@oracle.com>
Message-ID: <20190813140553.GK17933@dhcp22.suse.cz>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190813140553._DuB1QmqYsZvacODeEkHazPwbWuDEc2jGO233RjErLY@z>

On Mon 12-08-19 19:40:10, Khalid Aziz wrote:
[...]
> Patch 1 adds code to maintain a sliding lookback window of (time, number
> of free pages) points which can be updated continuously and adds code to
> compute best fit line across these points. It also adds code to use the
> best fit lines to determine if kernel must start reclamation or
> compaction.
> 
> Patch 2 adds code to collect data points on free pages of various orders
> at different points in time, uses code in patch 1 to update sliding
> lookback window with these points and kicks off reclamation or
> compaction based upon the results it gets.

An important piece of information missing in your description is why
do we need to keep that logic in the kernel. In other words, we have
the background reclaim that acts on a wmark range and those are tunable
from the userspace. The primary point of this background reclaim is to
keep balance and prevent from direct reclaim. Why cannot you implement
this or any other dynamic trend watching watchdog and tune watermarks
accordingly? Something similar applies to kcompactd although we might be
lacking a good interface.
-- 
Michal Hocko
SUSE Labs
