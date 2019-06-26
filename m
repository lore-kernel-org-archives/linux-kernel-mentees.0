From: c0d1n61at3 at gmail.com (Jiunn Chang)
Date: Wed, 26 Jun 2019 17:47:17 -0500
Subject: [Linux-kernel-mentees] [PATCH] drivers: rtc: Fix return value
	assignment
In-Reply-To: <20190626224717.27051-1-c0d1n61at3@gmail.com>
References: <20190626224717.27051-1-c0d1n61at3@gmail.com>
Message-ID: <20190626224717.27051-3-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

hrtimer_forward_now() returns u64, so change count to u64.

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
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
2.22.0
