From: puranjay12@gmail.com (Puranjay Mohan)
Date: Sun, 16 Jun 2019 21:18:08 +0530
Subject: [Linux-kernel-mentees] [PATCH] rtc: Change type of 'count' from int
	to u64
Message-ID: <20190616154808.21772-1-puranjay12@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190616154808.H4u4WvAUkkTZUbPpZwfMseKGW4hhs6_H8NpgGo-4OEc@z>

Callers of hrtimer_forward_now() should save the return value in u64.
function rtc_pie_update_irq() stores it in variable 'count' of type int
change type of count from unsigned long to u64 to solve the issue.

Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
---
 drivers/rtc/interface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index 4124f4dd376b..72b7ddc43116 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -633,7 +633,7 @@ enum hrtimer_restart rtc_pie_update_irq(struct hrtimer *timer)
 {
 	struct rtc_device *rtc;
 	ktime_t period;
-	int count;
+	u64 count;
 
 	rtc = container_of(timer, struct rtc_device, pie_timer);
 
-- 
2.21.0
