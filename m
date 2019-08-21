From: mhocko@kernel.org (Michal Hocko)
Date: Wed, 21 Aug 2019 16:06:32 +0200
Subject: [Linux-kernel-mentees] [RFC PATCH 0/2] Add predictive memory
	reclamation and compaction
In-Reply-To: <2668ad2e-ee52-8c88-22c0-1952243af5a1@oracle.com>
References: <20190813014012.30232-1-khalid.aziz@oracle.com>
	<20190813140553.GK17933@dhcp22.suse.cz>
	<3cb0af00-f091-2f3e-d6cc-73a5171e6eda@oracle.com>
	<20190814085831.GS17933@dhcp22.suse.cz>
	<d3895804-7340-a7ae-d611-62913303e9c5@oracle.com>
	<20190815170215.GQ9477@dhcp22.suse.cz>
	<2668ad2e-ee52-8c88-22c0-1952243af5a1@oracle.com>
Message-ID: <20190821140632.GI3111@dhcp22.suse.cz>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190821140632.8Cyc3X2zL5Z0MgseUkC_KZepj5hffWCHdd3P2e4MwAM@z>

On Thu 15-08-19 14:51:04, Khalid Aziz wrote:
> Hi Michal,
> 
> The smarts for tuning these knobs can be implemented in userspace and
> more knobs added to allow for what is missing today, but we get back to
> the same issue as before. That does nothing to make kernel self-tuning
> and adds possibly even more knobs to userspace. Something so fundamental
> to kernel memory management as making free pages available when they are
> needed really should be taken care of in the kernel itself. Moving it to
> userspace just means the kernel is hobbled unless one installs and tunes
> a userspace package correctly.

>From my past experience the existing autotunig works mostly ok for a
vast variety of workloads. A more clever tuning is possible and people
are doing that already. Especially for cases when the machine is heavily
overcommited. There are different ways to achieve that. Your new
in-kernel auto tuning would have to be tested on a large variety of
workloads to be proven and riskless. So I am quite skeptical to be
honest.

Therefore I would really focus on discussing whether we have sufficient
APIs to tune the kernel to do the right thing when needed. That requires
to identify gaps in that area.
-- 
Michal Hocko
SUSE Labs
