From: madhuparnabhowmik04@gmail.com (Madhuparna Bhowmik)
Date: Wed, 25 Sep 2019 22:39:42 +0530
Subject: [Linux-kernel-mentees] [PATCH 2/2] kernel: sched: fair: Changes
	data type from int to u64
Message-ID: <20190925170931.GA23927@madhuparna-HP-Notebook>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190925170942.yHgiyaaZ1DOeMKL0vWioVmPFcaTmMHsEJSDT9YW6uPY@z>

This patch changes the data type of variable overrun in the function
sched_cfs_period_timer() from int to u64 as the return type of the
function hrtimer_forward_now() is u64.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04 at gmail.com>
---
 kernel/sched/fair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index d4bbf68c3161..7c97e9704ca2 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4929,7 +4929,7 @@ static enum hrtimer_restart sched_cfs_period_timer(struct hrtimer *timer)
 	struct cfs_bandwidth *cfs_b =
 		container_of(timer, struct cfs_bandwidth, period_timer);
 	unsigned long flags;
-	int overrun;
+	u64 overrun;
 	int idle = 0;
 	int count = 0;
 
-- 
2.17.1
