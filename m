From: mhocko@kernel.org (Michal Hocko)
Date: Mon, 2 Sep 2019 10:02:18 +0200
Subject: [Linux-kernel-mentees] [RFC PATCH 0/2] Add predictive memory
	reclamation and compaction
In-Reply-To: <23eca880-d0d7-00f9-cb1b-b2998f2a1dff@oracle.com>
References: <20190813140553.GK17933@dhcp22.suse.cz>
	<3cb0af00-f091-2f3e-d6cc-73a5171e6eda@oracle.com>
	<20190814085831.GS17933@dhcp22.suse.cz>
	<d3895804-7340-a7ae-d611-62913303e9c5@oracle.com>
	<20190815170215.GQ9477@dhcp22.suse.cz>
	<2668ad2e-ee52-8c88-22c0-1952243af5a1@oracle.com>
	<20190821140632.GI3111@dhcp22.suse.cz>
	<20190826204420.GA16800@bharath12345-Inspiron-5559>
	<20190827061606.GN7538@dhcp22.suse.cz>
	<23eca880-d0d7-00f9-cb1b-b2998f2a1dff@oracle.com>
Message-ID: <20190902080218.GF14028@dhcp22.suse.cz>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190902080218.jQHA5DS6pEIHJ0ewtGukntGyZgJjHZutre85SKHI0rQ@z>

On Fri 30-08-19 15:35:06, Khalid Aziz wrote:
[...]
> - Kernel is not self-tuning and is dependent upon a userspace tool to
> perform well in a fundamental area of memory management.

You keep bringing this up without an actual analysis of a wider range of
workloads that would prove that the default behavior is really
suboptimal. You are making some assumptions based on a very specific DB
workload which might benefit from a more aggressive background workload.
If you really want to sell any changes to auto tuning then you really
need to come up with more workloads and an actual theory why an early
and more aggressive reclaim pays off.
-- 
Michal Hocko
SUSE Labs
