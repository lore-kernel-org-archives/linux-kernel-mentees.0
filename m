From: c0d1n61at3 at gmail.com (Jiunn Chang)
Date: Wed, 26 Jun 2019 17:47:15 -0500
Subject: [Linux-kernel-mentees] [PATCH] drivers: kernel: sched: Fix return
	value assignment
Message-ID: <20190626224717.27051-1-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

hrtimer_forward_now() returns u64, so change overrun to u64.

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
 kernel/sched/fair.c | 2 +-
 kernel/sched/rt.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index f35930f5e528..c6bcae7d4e49 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4896,7 +4896,7 @@ static enum hrtimer_restart sched_cfs_period_timer(struct hrtimer *timer)
 	struct cfs_bandwidth *cfs_b =
 		container_of(timer, struct cfs_bandwidth, period_timer);
 	unsigned long flags;
-	int overrun;
+	u64 overrun;
 	int idle = 0;
 	int count = 0;
 
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 1e6b909dca36..f5d3893914f5 100644
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
2.22.0
