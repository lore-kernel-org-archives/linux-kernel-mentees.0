From: dwlsalmeida at gmail.com (Daniel W. S. Almeida)
Date: Mon, 30 Sep 2019 22:04:55 -0300
Subject: [Linux-kernel-mentees] [PATCH] sched: change type of 'overrun' to
	u64
Message-ID: <20191001010455.278712-1-dwlsalmeida@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

From: "Daniel W. S. Almeida" <dwlsalmeida at gmail.com>

hrtimer_forward_now() return value is now u64, but int was used instead.
Now fixed.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida at gmail.com>
---
 kernel/sched/fair.c | 2 +-
 kernel/sched/rt.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 83ab35e2374f..379577798703 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4913,7 +4913,7 @@ static enum hrtimer_restart sched_cfs_period_timer(struct hrtimer *timer)
 	struct cfs_bandwidth *cfs_b =
 		container_of(timer, struct cfs_bandwidth, period_timer);
 	unsigned long flags;
-	int overrun;
+	u64 overrun;
 	int idle = 0;
 	int count = 0;
 
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index ebaa4e619684..cc4875964352 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -19,7 +19,7 @@ static enum hrtimer_restart sched_rt_period_timer(struct hrtimer *timer)
 	struct rt_bandwidth *rt_b =
 		container_of(timer, struct rt_bandwidth, rt_period_timer);
 	int idle = 0;
-	int overrun;
+	u64 overrun;
 
 	raw_spin_lock(&rt_b->rt_runtime_lock);
 	for (;;) {
-- 
2.23.0
