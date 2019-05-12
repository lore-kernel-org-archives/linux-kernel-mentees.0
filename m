From: bnvandana at gmail.com (Vandana BN)
Date: Mon, 13 May 2019 05:10:00 +0530
Subject: [Linux-kernel-mentees] [PATCH v2 8/8] Staging: kpc2000: kpc_dma:
	Resolve coding style warning reported by checkpatch
In-Reply-To: <20190512234000.16555-1-bnvandana@gmail.com>
References: <20190510193833.1051-1-bnvandana@gmail.com>
	<20190512234000.16555-1-bnvandana@gmail.com>
Message-ID: <20190512234000.16555-8-bnvandana@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

This Patch resolves unnecessary cast warning and const file_operations
WARNING: unnecessary cast may hide bugs
WARNING: struct file_operations should normally be const

Signed-off-by: Vandana BN <bnvandana at gmail.com>
---
 drivers/staging/kpc2000/kpc_dma/fileops.c        | 4 ++--
 drivers/staging/kpc2000/kpc_dma/kpc_dma_driver.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/kpc2000/kpc_dma/fileops.c b/drivers/staging/kpc2000/kpc_dma/fileops.c
index c21672ea2b4f..54a1419728ce 100644
--- a/drivers/staging/kpc2000/kpc_dma/fileops.c
+++ b/drivers/staging/kpc2000/kpc_dma/fileops.c
@@ -59,7 +59,7 @@ int  kpc_dma_transfer(struct dev_private_data *priv, struct kiocb *kcb, unsigned
 
 	dev_dbg(&priv->ldev->pldev->dev, "%s(priv = [%p], kcb = [%p], iov_base = [%p], iov_len = %ld) ldev = [%p]\n", __func__, priv, kcb, (void *)iov_base, iov_len, ldev);
 
-	acd = (struct aio_cb_data *) kzalloc(sizeof(struct aio_cb_data), GFP_KERNEL);
+	acd = kzalloc(sizeof(struct aio_cb_data), GFP_KERNEL);
 	if (!acd) {
 		dev_err(&priv->ldev->pldev->dev, "Couldn't kmalloc space for for the aio data\n");
 		return -ENOMEM;
@@ -418,7 +418,7 @@ long  kpc_dma_ioctl(struct file *filp, unsigned int ioctl_num, unsigned long ioc
 	return -ENOTTY;
 }
 
-struct file_operations  kpc_dma_fops = {
+const struct file_operations  kpc_dma_fops = {
 	.owner      = THIS_MODULE,
 	.open           = kpc_dma_open,
 	.release        = kpc_dma_close,
diff --git a/drivers/staging/kpc2000/kpc_dma/kpc_dma_driver.h b/drivers/staging/kpc2000/kpc_dma/kpc_dma_driver.h
index cf781940ac1b..ee47f43e71cf 100644
--- a/drivers/staging/kpc2000/kpc_dma/kpc_dma_driver.h
+++ b/drivers/staging/kpc2000/kpc_dma/kpc_dma_driver.h
@@ -57,7 +57,7 @@ struct dev_private_data {
 
 struct kpc_dma_device *kpc_dma_lookup_device(int minor);
 
-extern struct file_operations  kpc_dma_fops;
+extern const struct file_operations  kpc_dma_fops;
 
 #define ENG_CAP_PRESENT                 0x00000001
 #define ENG_CAP_DIRECTION               0x00000002
-- 
2.17.1
