From: puranjay12@gmail.com (Puranjay Mohan)
Date: Tue, 18 Jun 2019 22:29:08 +0530
Subject: [Linux-kernel-mentees] [PATCH] Sched: Change type of 'overrun' from
	int to u64
Message-ID: <20190618165908.15012-1-puranjay12@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190618165908.G09p4sykrPy3beq_nbj0uZ4e3tcNaZVNtEKY-Bjokjc@z>

Callers of hrtimer_forward_now() should save the return value in u64.
function sched_cfs_period_timer() stores
it in variable 'overrun' of type int
change type of overrun from int to u64 to solve the issue.

Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
---
 kernel/sched/fair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
 
-- 
2.21.0
