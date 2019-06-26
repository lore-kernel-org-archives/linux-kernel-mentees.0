From: c0d1n61at3 at gmail.com (Jiunn Chang)
Date: Wed, 26 Jun 2019 17:47:16 -0500
Subject: [Linux-kernel-mentees] [PATCH] drivers: media: pci: cx88: Fix
	return value assignment
In-Reply-To: <20190626224717.27051-1-c0d1n61at3@gmail.com>
References: <20190626224717.27051-1-c0d1n61at3@gmail.com>
Message-ID: <20190626224717.27051-2-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

hrtimer_forward_now() returns u64, so change missed to u64.

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
 drivers/media/pci/cx88/cx88-input.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx88/cx88-input.c b/drivers/media/pci/cx88/cx88-input.c
index 27f690b54e0c..fa5ce464b0ba 100644
--- a/drivers/media/pci/cx88/cx88-input.c
+++ b/drivers/media/pci/cx88/cx88-input.c
@@ -167,7 +167,7 @@ static void cx88_ir_handle_key(struct cx88_IR *ir)
 
 static enum hrtimer_restart cx88_ir_work(struct hrtimer *timer)
 {
-	unsigned long missed;
+	u64 missed;
 	struct cx88_IR *ir = container_of(timer, struct cx88_IR, timer);
 
 	cx88_ir_handle_key(ir);
-- 
2.22.0
