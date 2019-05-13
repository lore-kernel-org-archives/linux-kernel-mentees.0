From: bnvandana@gmail.com (Vandana BN)
Date: Mon, 13 May 2019 19:13:21 +0530
Subject: [Linux-kernel-mentees] [PATCH v4 2/8] Staging: kpc2000: kpc_dma:
	Resolve space errors around pointers and function
	declarations reported by checkpatch.
In-Reply-To: <20190513134327.26320-1-bnvandana@gmail.com>
References: <20190510193833.1051-1-bnvandana@gmail.com>
	<20190513134327.26320-1-bnvandana@gmail.com>
Message-ID: <20190513134327.26320-2-bnvandana@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190513134321.KyfHwuyof5NfVZ0gItCs7Mkzpmawz2qo9f_4ZdLLgig@z>

This patch resolves below errors reported by checkpatch
ERROR: "(foo*)" should be "(foo *)"
ERROR: "foo * bar" should be "foo *bar"
ERROR: "foo __init  bar" should be "foo __init bar"
ERROR: "foo __exit  bar" should be "foo __exit bar"

Signed-off-by: Vandana BN <bnvandana at gmail.com>
---
v2 - split changes to multiple patches
v3 - edit commit message, subject line
v4 - edit commit message

 drivers/staging/kpc2000/kpc_dma/dma.c            |  8 ++++----
 drivers/staging/kpc2000/kpc_dma/fileops.c        |  2 +-
 drivers/staging/kpc2000/kpc_dma/kpc_dma_driver.c | 12 ++++++------
 drivers/staging/kpc2000/kpc_dma/kpc_dma_driver.h |  6 +++---
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/kpc2000/kpc_dma/dma.c b/drivers/staging/kpc2000/kpc_dma/dma.c
index ba987307d898..488b9b81debc 100644
--- a/drivers/staging/kpc2000/kpc_dma/dma.c
+++ b/drivers/staging/kpc2000/kpc_dma/dma.c
@@ -14,7 +14,7 @@
 static
 irqreturn_t  ndd_irq_handler(int irq, void *dev_id)
 {
-	struct kpc_dma_device *ldev = (struct kpc_dma_device*)dev_id;
+	struct kpc_dma_device *ldev = (struct kpc_dma_device *)dev_id;
 
 	if ((GetEngineControl(ldev) & ENG_CTL_IRQ_ACTIVE) || (ldev->desc_completed->MyDMAAddr != GetEngineCompletePtr(ldev)))
 		schedule_work(&ldev->irq_work);
@@ -85,8 +85,8 @@ void  start_dma_engine(struct kpc_dma_device *eng)
 int  setup_dma_engine(struct kpc_dma_device *eng, u32 desc_cnt)
 {
 	u32 caps;
-	struct kpc_dma_descriptor * cur;
-	struct kpc_dma_descriptor * next;
+	struct kpc_dma_descriptor *cur;
+	struct kpc_dma_descriptor *next;
 	dma_addr_t next_handle;
 	dma_addr_t head_handle;
 	unsigned int i;
@@ -208,7 +208,7 @@ void  stop_dma_engine(struct kpc_dma_device *eng)
 
 void  destroy_dma_engine(struct kpc_dma_device *eng)
 {
-	struct kpc_dma_descriptor * cur;
+	struct kpc_dma_descriptor *cur;
 	dma_addr_t cur_handle;
 	unsigned int i;
 
diff --git a/drivers/staging/kpc2000/kpc_dma/fileops.c b/drivers/staging/kpc2000/kpc_dma/fileops.c
index 6c38c3f978c3..61927b313a26 100644
--- a/drivers/staging/kpc2000/kpc_dma/fileops.c
+++ b/drivers/staging/kpc2000/kpc_dma/fileops.c
@@ -55,7 +55,7 @@ int  kpc_dma_transfer(struct dev_private_data *priv, struct kiocb *kcb, unsigned
 	ldev = priv->ldev;
 	BUG_ON(ldev == NULL);
 
-	dev_dbg(&priv->ldev->pldev->dev, "kpc_dma_transfer(priv = [%p], kcb = [%p], iov_base = [%p], iov_len = %ld) ldev = [%p]\n", priv, kcb, (void*)iov_base, iov_len, ldev);
+	dev_dbg(&priv->ldev->pldev->dev, "kpc_dma_transfer(priv = [%p], kcb = [%p], iov_base = [%p], iov_len = %ld) ldev = [%p]\n", priv, kcb, (void *)iov_base, iov_len, ldev);
 
 	acd = (struct aio_cb_data *) kzalloc(sizeof(struct aio_cb_data), GFP_KERNEL);
 	if (!acd){
diff --git a/drivers/staging/kpc2000/kpc_dma/kpc_dma_driver.c b/drivers/staging/kpc2000/kpc_dma/kpc_dma_driver.c
index dece60e6e3f3..004d91b5ad00 100644
--- a/drivers/staging/kpc2000/kpc_dma/kpc_dma_driver.c
+++ b/drivers/staging/kpc2000/kpc_dma/kpc_dma_driver.c
@@ -21,7 +21,7 @@ static LIST_HEAD(kpc_dma_list);
 
 
 /**********  kpc_dma_list list management  **********/
-struct kpc_dma_device *  kpc_dma_lookup_device(int minor)
+struct kpc_dma_device *kpc_dma_lookup_device(int minor)
 {
 	struct kpc_dma_device *c;
 	mutex_lock(&kpc_dma_mtx);
@@ -36,14 +36,14 @@ struct kpc_dma_device *  kpc_dma_lookup_device(int minor)
 	return c;
 }
 
-void  kpc_dma_add_device(struct kpc_dma_device * ldev)
+void  kpc_dma_add_device(struct kpc_dma_device *ldev)
 {
 	mutex_lock(&kpc_dma_mtx);
 	list_add(&ldev->list, &kpc_dma_list);
 	mutex_unlock(&kpc_dma_mtx);
 }
 
-void kpc_dma_del_device(struct kpc_dma_device * ldev)
+void kpc_dma_del_device(struct kpc_dma_device *ldev)
 {
 	mutex_lock(&kpc_dma_mtx);
 	list_del(&ldev->list);
@@ -80,7 +80,7 @@ static ssize_t  show_engine_regs(struct device *dev, struct device_attribute *at
 }
 DEVICE_ATTR(engine_regs, 0444, show_engine_regs, NULL);
 
-static const struct attribute *  ndd_attr_list[] = {
+static const struct attribute *ndd_attr_list[] = {
 	&dev_attr_engine_regs.attr,
 	NULL,
 };
@@ -203,7 +203,7 @@ struct platform_driver kpc_dma_plat_driver_i = {
 };
 
 static
-int __init  kpc_dma_driver_init(void)
+int __init kpc_dma_driver_init(void)
 {
 	int err;
 
@@ -239,7 +239,7 @@ int __init  kpc_dma_driver_init(void)
 module_init(kpc_dma_driver_init);
 
 static
-void __exit  kpc_dma_driver_exit(void)
+void __exit kpc_dma_driver_exit(void)
 {
 	platform_driver_unregister(&kpc_dma_plat_driver_i);
 	class_destroy(kpc_dma_class);
diff --git a/drivers/staging/kpc2000/kpc_dma/kpc_dma_driver.h b/drivers/staging/kpc2000/kpc_dma/kpc_dma_driver.h
index 67c0ea31acab..8101601736a2 100644
--- a/drivers/staging/kpc2000/kpc_dma/kpc_dma_driver.h
+++ b/drivers/staging/kpc2000/kpc_dma/kpc_dma_driver.h
@@ -56,7 +56,7 @@ struct dev_private_data {
 	u64                         user_sts;
 };
 
-struct kpc_dma_device *  kpc_dma_lookup_device(int minor);
+struct kpc_dma_device *kpc_dma_lookup_device(int minor);
 
 extern struct file_operations  kpc_dma_fops;
 
@@ -172,12 +172,12 @@ void  SetClearEngineControl(struct kpc_dma_device *eng, u32 set_bits, u32 clear_
 }
 
 static inline
-void  SetEngineNextPtr(struct kpc_dma_device *eng, struct kpc_dma_descriptor * desc)
+void  SetEngineNextPtr(struct kpc_dma_device *eng, struct kpc_dma_descriptor *desc)
 {
 	writel(desc->MyDMAAddr, eng->eng_regs + 2);
 }
 static inline
-void  SetEngineSWPtr(struct kpc_dma_device *eng, struct kpc_dma_descriptor * desc)
+void  SetEngineSWPtr(struct kpc_dma_device *eng, struct kpc_dma_descriptor *desc)
 {
 	writel(desc->MyDMAAddr, eng->eng_regs + 3);
 }
-- 
2.17.1
