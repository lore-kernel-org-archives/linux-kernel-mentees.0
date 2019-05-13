From: bnvandana at gmail.com (Vandana BN)
Date: Mon, 13 May 2019 19:13:23 +0530
Subject: [Linux-kernel-mentees] [PATCH v4 4/8] Staging: kpc2000: kpc_dma:
	Resolve code indent and trailing statements on next line
	errors reported by checkpatch.
In-Reply-To: <20190513134327.26320-1-bnvandana@gmail.com>
References: <20190510193833.1051-1-bnvandana@gmail.com>
	<20190513134327.26320-1-bnvandana@gmail.com>
Message-ID: <20190513134327.26320-4-bnvandana@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

This patch fixes code indentaion error reported by checkpath
ERROR: switch and case should be at the same indent
ERROR: trailing statements should be on next line

Signed-off-by: Vandana BN <bnvandana at gmail.com>
---
v2 - split changes to multiple patches
v3 - edit commit message, subject line
v4 - edit commit message

 drivers/staging/kpc2000/kpc_dma/fileops.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/kpc2000/kpc_dma/fileops.c b/drivers/staging/kpc2000/kpc_dma/fileops.c
index 8dd948ef455f..c09147aaa4ef 100644
--- a/drivers/staging/kpc2000/kpc_dma/fileops.c
+++ b/drivers/staging/kpc2000/kpc_dma/fileops.c
@@ -395,10 +395,14 @@ long  kpc_dma_ioctl(struct file *filp, unsigned int ioctl_num, unsigned long ioc
 	dev_dbg(&priv->ldev->pldev->dev, "kpc_dma_ioctl(filp = [%p], ioctl_num = 0x%x, ioctl_param = 0x%lx) priv = [%p], ldev = [%p]\n", filp, ioctl_num, ioctl_param, priv, priv->ldev);
 
 	switch (ioctl_num) {
-		case KND_IOCTL_SET_CARD_ADDR:           priv->card_addr  = ioctl_param; return priv->card_addr;
-		case KND_IOCTL_SET_USER_CTL:            priv->user_ctl   = ioctl_param; return priv->user_ctl;
-		case KND_IOCTL_SET_USER_CTL_LAST:       priv->user_ctl_last = ioctl_param; return priv->user_ctl_last;
-		case KND_IOCTL_GET_USER_STS:            return priv->user_sts;
+	case KND_IOCTL_SET_CARD_ADDR:
+		priv->card_addr  = ioctl_param; return priv->card_addr;
+	case KND_IOCTL_SET_USER_CTL:
+		priv->user_ctl   = ioctl_param; return priv->user_ctl;
+	case KND_IOCTL_SET_USER_CTL_LAST:
+		priv->user_ctl_last = ioctl_param; return priv->user_ctl_last;
+	case KND_IOCTL_GET_USER_STS:
+		return priv->user_sts;
 	}
 
 	return -ENOTTY;
-- 
2.17.1
