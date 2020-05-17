Return-Path: <SRS0=jt7Q=7C=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01639C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 May 2020 12:44:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7DD320758
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 May 2020 12:44:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="PdZ5JB/7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7DD320758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8A6DD86D47;
	Wed, 20 May 2020 12:44:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id erye7YqW2PJr; Wed, 20 May 2020 12:44:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5023D86469;
	Wed, 20 May 2020 12:44:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F994C088A;
	Wed, 20 May 2020 12:44:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EFD2FC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 May 2020 00:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D77AC20429
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 May 2020 00:17:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AnDwUz2nPw9f
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 May 2020 00:17:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 22EBE203B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 May 2020 00:17:46 +0000 (UTC)
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de
 [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9749920709;
 Sun, 17 May 2020 00:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589674665;
 bh=yF0Mql5AgBbPCzyzSdvJEchLG9701xDmZIKI5m6/Dyo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PdZ5JB/7NoA3DQwv+YJEVQkI365awzSyxi5E1XETN2nBsKJ9pL7oeXEdK5dxP+xw6
 8BTZmSvoxXEXNX4xlroJConSx8hzOeHRpfh+xghhrlWGtUX95O+/Ngu+MwhQEtMqM0
 6y5YyO7M6MTn2A6fW3vNdY5PFfGb7ydqu9CrB+DY=
Date: Sun, 17 May 2020 02:17:41 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20200517021741.24d53b38@coco.lan>
In-Reply-To: <20200517014237.30e521dd@coco.lan>
References: <DE1E173D-8D56-4CA5-9838-E9476B24DD69@getmailspring.com>
 <20200517012935.56ca2a8d@coco.lan>
 <20200517014237.30e521dd@coco.lan>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 20 May 2020 12:44:21 +0000
Cc: "linux-kernel-mentees@lists.linuxfoundation.org\"
 <linux-kernel-mentees@lists.linuxfoundation.org>"@osuosl.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [Linux-kernel-mentees] [PATCH] media: vidtv: fix issues preventing
	it to build and load
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

There are several issues that were preventing it to properly
build and load:

- Makefile was not actually compiling everything;
- The bridge driver should be a platform driver;
- There are lots of warnings and other errors produced
  by the driver.

Address them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

Please notice that there are still several issues reported by
sparse. I didn't check them:

$ make W=1 C=1 M=drivers/media/test-drivers/vidtv 
SPARSE:drivers/media/test-drivers/vidtv/vidtv_channel.c drivers/media/test-drivers/vidtv/vidtv_channel.c:54:62:  warning: Using plain integer as NULL pointer
SPARSE:drivers/media/test-drivers/vidtv/vidtv_psi.c drivers/media/test-drivers/vidtv/vidtv_psi.c:71:43:  warning: Using plain integer as NULL pointer
SPARSE:drivers/media/test-drivers/vidtv/vidtv_psi.c drivers/media/test-drivers/vidtv/vidtv_psi.c:174:43:  warning: Using plain integer as NULL pointer
SPARSE:drivers/media/test-drivers/vidtv/vidtv_psi.c drivers/media/test-drivers/vidtv/vidtv_psi.c:319:43:  warning: Using plain integer as NULL pointer
SPARSE:drivers/media/test-drivers/vidtv/vidtv_psi.c drivers/media/test-drivers/vidtv/vidtv_psi.c:359:43:  warning: Using plain integer as NULL pointer
SPARSE:drivers/media/test-drivers/vidtv/vidtv_psi.c drivers/media/test-drivers/vidtv/vidtv_psi.c:574:50:  warning: Using plain integer as NULL pointer
SPARSE:drivers/media/test-drivers/vidtv/vidtv_psi.c drivers/media/test-drivers/vidtv/vidtv_psi.c:575:50:  warning: Using plain integer as NULL pointer
SPARSE:drivers/media/test-drivers/vidtv/vidtv_psi.c drivers/media/test-drivers/vidtv/vidtv_psi.c:576:50:  warning: Using plain integer as NULL pointer
SPARSE:drivers/media/test-drivers/vidtv/vidtv_psi.c drivers/media/test-drivers/vidtv/vidtv_psi.c:770:44:  warning: Using plain integer as NULL pointer
SPARSE:drivers/media/test-drivers/vidtv/vidtv_psi.c drivers/media/test-drivers/vidtv/vidtv_psi.c:771:44:  warning: Using plain integer as NULL pointer
SPARSE:drivers/media/test-drivers/vidtv/vidtv_psi.c drivers/media/test-drivers/vidtv/vidtv_psi.c:772:44:  warning: Using plain integer as NULL pointer
SPARSE:drivers/media/test-drivers/vidtv/vidtv_psi.c drivers/media/test-drivers/vidtv/vidtv_psi.c:773:44:  warning: Using plain integer as NULL pointer
SPARSE:drivers/media/test-drivers/vidtv/vidtv_psi.c drivers/media/test-drivers/vidtv/vidtv_psi.c:938:44:  warning: Using plain integer as NULL pointer
SPARSE:drivers/media/test-drivers/vidtv/vidtv_psi.c drivers/media/test-drivers/vidtv/vidtv_psi.c:939:44:  warning: Using plain integer as NULL pointer
SPARSE:drivers/media/test-drivers/vidtv/vidtv_psi.c drivers/media/test-drivers/vidtv/vidtv_psi.c:940:44:  warning: Using plain integer as NULL pointer
SPARSE:drivers/media/test-drivers/vidtv/vidtv_psi.c drivers/media/test-drivers/vidtv/vidtv_psi.c:941:44:  warning: Using plain integer as NULL pointer
SPARSE:drivers/media/test-drivers/vidtv/vidtv_mux.c drivers/media/test-drivers/vidtv/vidtv_mux.c:155:39:  warning: Using plain integer as NULL pointer
SPARSE:drivers/media/test-drivers/vidtv/vidtv_mux.c drivers/media/test-drivers/vidtv/vidtv_mux.c:197:39:  warning: Using plain integer as NULL pointer
SPARSE:drivers/media/test-drivers/vidtv/vidtv_mux.c drivers/media/test-drivers/vidtv/vidtv_mux.c:259:47:  warning: Using plain integer as NULL pointer
SPARSE:drivers/media/test-drivers/vidtv/vidtv_pes.c drivers/media/test-drivers/vidtv/vidtv_pes.c:80:54:  warning: missing braces around initializer
SPARSE:drivers/media/test-drivers/vidtv/vidtv_pes.c drivers/media/test-drivers/vidtv/vidtv_pes.c:81:54:  warning: missing braces around initializer
SPARSE:drivers/media/test-drivers/vidtv/vidtv_pes.c drivers/media/test-drivers/vidtv/vidtv_pes.c:146:54:  warning: missing braces around initializer
SPARSE:drivers/media/test-drivers/vidtv/vidtv_pes.c drivers/media/test-drivers/vidtv/vidtv_pes.c:147:54:  warning: missing braces around initializer
SPARSE:drivers/media/test-drivers/vidtv/vidtv_pes.c drivers/media/test-drivers/vidtv/vidtv_pes.c:311:59:  warning: Using plain integer as NULL pointer
SPARSE:drivers/media/test-drivers/vidtv/vidtv_pes.c drivers/media/test-drivers/vidtv/vidtv_pes.c:312:59:  warning: Using plain integer as NULL pointer
SPARSE:drivers/media/test-drivers/vidtv/vidtv_s302m.c drivers/media/test-drivers/vidtv/vidtv_s302m.c:374:42:  warning: missing braces around initializer
SPARSE:drivers/media/test-drivers/vidtv/vidtv_s302m.c drivers/media/test-drivers/vidtv/vidtv_s302m.c:430:36:  warning: incorrect type in assignment (different base types)
SPARSE:drivers/media/test-drivers/vidtv/vidtv_s302m.c drivers/media/test-drivers/vidtv/vidtv_s302m.c:430:36:     expected signed short [usertype] sample
SPARSE:drivers/media/test-drivers/vidtv/vidtv_s302m.c drivers/media/test-drivers/vidtv/vidtv_s302m.c:430:36:     got restricted __le16 [usertype]
SPARSE:drivers/media/test-drivers/vidtv/vidtv_bridge.c drivers/media/test-drivers/vidtv/vidtv_bridge.c:252:42:  warning: Using plain integer as NULL pointer
SPARSE:drivers/media/test-drivers/vidtv/vidtv_bridge.c drivers/media/test-drivers/vidtv/vidtv_bridge.c:270:42:  warning: Using plain integer as NULL pointer


 drivers/media/test-drivers/vidtv/Makefile     | 11 ++-
 .../media/test-drivers/vidtv/vidtv_bridge.c   | 88 ++++++++++++-------
 .../media/test-drivers/vidtv/vidtv_common.c   |  6 +-
 .../media/test-drivers/vidtv/vidtv_demod.c    | 39 ++++----
 .../media/test-drivers/vidtv/vidtv_s302m.c    |  2 -
 .../media/test-drivers/vidtv/vidtv_tuner.c    | 10 +--
 6 files changed, 93 insertions(+), 63 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/Makefile b/drivers/media/test-drivers/vidtv/Makefile
index a1d29001fffe..cc3b67fd1c9f 100644
--- a/drivers/media/test-drivers/vidtv/Makefile
+++ b/drivers/media/test-drivers/vidtv/Makefile
@@ -1,7 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 
-vidtv_demod-objs := vidtv_common.o
-vidtv_bridge-objs := vidtv_common.o vidtv_ts.o vidtv_psi.o vidtv_pes.o \
-		     vidtv_s302m.o vidtv_channel.o vidtv_mux.o
+dvb-vidtv-tuner-objs := vidtv_tuner.o
+dvb-vidtv-demod-objs := vidtv_common.o vidtv_demod.o
+dvb-vidtv-bridge-objs := vidtv_common.o vidtv_ts.o vidtv_psi.o vidtv_pes.o \
+		         vidtv_s302m.o vidtv_channel.o vidtv_mux.o \
+		         vidtv_bridge.o
 
-obj-$(CONFIG_DVB_VIDTV)	+= vidtv_tuner.o vidtv_demod.o vidtv_bridge.o
+obj-$(CONFIG_DVB_VIDTV)	+= dvb-vidtv-tuner.o dvb-vidtv-demod.o \
+			   dvb-vidtv-bridge.o
diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index c9876372fdeb..26681ecacfc0 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -7,22 +7,22 @@
  * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
  */
 
-#include <linux/types.h>
 #include <linux/moduleparam.h>
 #include <linux/mutex.h>
-#include <linux/workqueue.h>
+#include <linux/platform_device.h>
 #include <linux/time.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
 #include "vidtv_bridge.h"
-#include "vidtv_ts.h"
+#include "vidtv_config.h"
 #include "vidtv_mux.h"
+#include "vidtv_ts.h"
 
 #define TS_BUF_MAX_SZ (128 * TS_PACKET_LEN)
 #define TUNER_DEFAULT_ADDR 0x68
 #define DEMOD_DEFAULT_ADDR 0x60
 
-MODULE_AUTHOR("Daniel W. S. Almeida");
-MODULE_LICENSE("GPL");
-
 static unsigned int drop_tslock_prob_on_low_snr;
 module_param(drop_tslock_prob_on_low_snr, uint, 0644);
 MODULE_PARM_DESC(drop_tslock_prob_on_low_snr,
@@ -87,7 +87,7 @@ static unsigned int mux_rate_kbytes_sec = 4096;
 module_param(mux_rate_kbytes_sec, uint, 0644);
 MODULE_PARM_DESC(mux_rate_kbytes_sec, "Optional mux rate: will pad stream if below");
 
-static unsigned int pcr_pid = 0x200
+static unsigned int pcr_pid = 0x200;
 module_param(pcr_pid, uint, 0644);
 MODULE_PARM_DESC(pcr_pid, "Optional PCR PID for all channels: defaults to 0x200");
 
@@ -97,11 +97,13 @@ static bool vidtv_bridge_check_demod_lock(struct vidtv_dvb *dvb, u32 n)
 
 	dvb->fe[n]->ops.read_status(dvb->fe[n], &status);
 
-	return status == FE_HAS_SIGNAL  |
-			 FE_HAS_CARRIER |
-			 FE_HAS_VITERBI |
-			 FE_HAS_SYNC    |
-			 FE_HAS_LOCK;
+	status = FE_HAS_SIGNAL  |
+		 FE_HAS_CARRIER |
+		 FE_HAS_VITERBI |
+		 FE_HAS_SYNC    |
+		 FE_HAS_LOCK;
+
+	return status;
 }
 
 static void
@@ -188,7 +190,7 @@ static u32 vidtv_i2c_func(struct i2c_adapter *adapter)
 	return I2C_FUNC_I2C;
 }
 
-struct i2c_algorithm vidtv_i2c_algorithm = {
+static const struct i2c_algorithm vidtv_i2c_algorithm = {
 	.master_xfer   = vidtv_master_xfer,
 	.functionality = vidtv_i2c_func,
 };
@@ -358,8 +360,7 @@ static int vidtv_bridge_dvb_init(struct vidtv_dvb *dvb)
 	return ret;
 }
 
-static int vidtv_bridge_i2c_probe(struct i2c_client *client,
-				  const struct i2c_device_id *id)
+static int vidtv_bridge_probe(struct platform_device *pdev)
 {
 	int ret;
 	struct vidtv_dvb *dvb;
@@ -378,14 +379,14 @@ static int vidtv_bridge_i2c_probe(struct i2c_client *client,
 	mux_args.mux_rate_kbytes_sec = mux_rate_kbytes_sec;
 	mux_args.on_new_packets_available_cb = vidtv_bridge_on_new_pkts_avail;
 	mux_args.ts_buf_sz = ts_buf_sz;
-	mux_args.pcr_period_usecs = pcr_period_msecs * 1000;
-	mux_args.si_period_usecs = si_period_msecs * 1000;
+	mux_args.pcr_period_usecs = pcr_period_msec * 1000;
+	mux_args.si_period_usecs = si_period_msec * 1000;
 	mux_args.pcr_pid = pcr_pid;
 	mux_args.priv = dvb;
 
 	dvb->mux = vidtv_mux_init(mux_args);
 
-	i2c_set_clientdata(client, dvb);
+	platform_set_drvdata(pdev, dvb);
 
 	return ret;
 
@@ -394,12 +395,12 @@ static int vidtv_bridge_i2c_probe(struct i2c_client *client,
 	return ret;
 }
 
-static int vidtv_bridge_i2c_remove(struct i2c_client *client)
+static int vidtv_bridge_remove(struct platform_device *pdev)
 {
 	struct vidtv_dvb *dvb;
 	u32 i;
 
-	dvb = i2c_get_clientdata(client);
+	dvb = platform_get_drvdata(pdev);
 
 	vidtv_mux_destroy(dvb->mux);
 
@@ -422,21 +423,48 @@ static int vidtv_bridge_i2c_remove(struct i2c_client *client)
 	return 0;
 }
 
-static const struct i2c_device_id vidtv_bridge_id_table[] = {
-	{"vidtv_bridge", 0},
-	{}
-};
+static void vidtv_bridge_dev_release(struct device *dev)
+{
+}
 
-MODULE_DEVICE_TABLE(i2c, vidtv_bridge_id_table);
+static struct platform_device vidtv_bridge_dev = {
+	.name		= "vidtv_bridge",
+	.dev.release	= vidtv_bridge_dev_release,
+};
 
-static struct i2c_driver vidtv_bridge_driver = {
+static struct platform_driver vidtv_bridge_driver = {
 	.driver = {
 		.name                = "vidtv_bridge",
 		.suppress_bind_attrs = true,
 	},
-	.probe    = vidtv_bridge_i2c_probe,
-	.remove   = vidtv_bridge_i2c_remove,
-	.id_table = vidtv_bridge_id_table,
+	.probe    = vidtv_bridge_probe,
+	.remove   = vidtv_bridge_remove,
 };
 
-module_i2c_driver(vidtv_bridge_driver);
+static void __exit vidtv_bridge_exit(void)
+{
+	platform_driver_unregister(&vidtv_bridge_driver);
+	platform_device_unregister(&vidtv_bridge_dev);
+}
+
+static int __init vidtv_bridge_init(void)
+{
+	int ret;
+
+	ret = platform_device_register(&vidtv_bridge_dev);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&vidtv_bridge_driver);
+	if (ret)
+		platform_device_unregister(&vidtv_bridge_dev);
+
+	return ret;
+}
+
+module_init(vidtv_bridge_init);
+module_exit(vidtv_bridge_exit);
+
+MODULE_DESCRIPTION("Virtual Digital TV Test Driver");
+MODULE_AUTHOR("Daniel W. S. Almeida");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/test-drivers/vidtv/vidtv_common.c b/drivers/media/test-drivers/vidtv/vidtv_common.c
index b1412b497e1e..3a2358d4fe69 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_common.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_common.c
@@ -7,9 +7,11 @@
  * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
  */
 
-#include <linux/types.h>
-#include <linux/string.h>
 #include <linux/printk.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+#include "vidtv_common.h"
 
 u32 vidtv_memcpy(void *to,
 		 const void *from,
diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.c b/drivers/media/test-drivers/vidtv/vidtv_demod.c
index 15436e565a7b..7d3aa464d6fc 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_demod.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_demod.c
@@ -8,30 +8,27 @@
  * Based on the example driver written by Emard <emard@softhome.net>
  */
 
+#include <linux/errno.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/init.h>
-#include <linux/string.h>
+#include <linux/random.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/workqueue.h>
-#include <linux/random.h>
-#include <linux/errno.h>
-#include <linux/i2c.h>
 #include <media/dvb_frontend.h>
-#include "vidtv_demod.h"
-#include "vidtv_config.h"
 
-MODULE_DESCRIPTION("Virtual DVB Demodulator Driver");
-MODULE_AUTHOR("Daniel W. S. Almeida");
-MODULE_LICENSE("GPL");
+#include "vidtv_config.h"
+#include "vidtv_demod.h"
 
-struct vidtv_demod_cnr_to_qual_s vidtv_demod_c_cnr_2_qual[] = {
+static const struct vidtv_demod_cnr_to_qual_s vidtv_demod_c_cnr_2_qual[] = {
 	/* from libdvbv5 source code, in milli db */
 	{ QAM_256, FEC_NONE,  34000, 38000},
 	{ QAM_64,  FEC_NONE,  30000, 34000},
 };
 
-struct vidtv_demod_cnr_to_qual_s vidtv_demod_s_cnr_2_qual[] = {
+static const struct vidtv_demod_cnr_to_qual_s vidtv_demod_s_cnr_2_qual[] = {
 	/* from libdvbv5 source code, in milli db */
 	{ QPSK, FEC_1_2,  7000, 10000},
 	{ QPSK, FEC_2_3,  9000, 12000},
@@ -40,7 +37,7 @@ struct vidtv_demod_cnr_to_qual_s vidtv_demod_s_cnr_2_qual[] = {
 	{ QPSK, FEC_7_8, 12000, 15000},
 };
 
-struct vidtv_demod_cnr_to_qual_s vidtv_demod_s2_cnr_2_qual[] = {
+static const struct vidtv_demod_cnr_to_qual_s vidtv_demod_s2_cnr_2_qual[] = {
 	/* from libdvbv5 source code, in milli db */
 	{ QPSK,  FEC_1_2,   9000,  12000},
 	{ QPSK,  FEC_2_3,  11000,  14000},
@@ -54,7 +51,7 @@ struct vidtv_demod_cnr_to_qual_s vidtv_demod_s2_cnr_2_qual[] = {
 	{ PSK_8, FEC_8_9,  19000,  22000},
 };
 
-static struct vidtv_demod_cnr_to_qual_s vidtv_demod_t_cnr_2_qual[] = {
+static const struct vidtv_demod_cnr_to_qual_s vidtv_demod_t_cnr_2_qual[] = {
 	/* from libdvbv5 source code, in milli db*/
 	{   QPSK, FEC_1_2,  4100,  5900},
 	{   QPSK, FEC_2_3,  6100,  9600},
@@ -75,11 +72,11 @@ static struct vidtv_demod_cnr_to_qual_s vidtv_demod_t_cnr_2_qual[] = {
 	{ QAM_64, FEC_7_8, 22000, 24000},
 };
 
-static struct vidtv_demod_cnr_to_qual_s
+static const struct vidtv_demod_cnr_to_qual_s
 *vidtv_match_cnr_s(struct dvb_frontend *fe)
 {
 	struct dtv_frontend_properties *c;
-	struct vidtv_demod_cnr_to_qual_s *cnr2qual = NULL;
+	const struct vidtv_demod_cnr_to_qual_s *cnr2qual = NULL;
 	u32    array_size                          = 0;
 	u32 i;
 
@@ -129,13 +126,11 @@ static void vidtv_demod_poll_snr_handler(struct work_struct *work)
 	 * lose the TS lock if it dips too low
 	 */
 	struct vidtv_demod_state *state;
-	struct dtv_frontend_properties *c;
-	struct vidtv_demod_cnr_to_qual_s *cnr2qual = NULL;
+	const struct vidtv_demod_cnr_to_qual_s *cnr2qual = NULL;
 	struct vidtv_demod_config *config;
 	u16 snr = 0;
 
 	state  = container_of(work, struct vidtv_demod_state, poll_snr.work);
-	c      = &state->frontend.dtv_property_cache;
 	config = &state->config;
 
 	if (!state->frontend.ops.tuner_ops.get_rf_strength)
@@ -214,7 +209,7 @@ static int vidtv_demod_get_frontend(struct dvb_frontend *fe,
 static int vidtv_demod_set_frontend(struct dvb_frontend *fe)
 {
 	struct vidtv_demod_state *state            = fe->demodulator_priv;
-	struct vidtv_demod_cnr_to_qual_s *cnr2qual = NULL;
+	const struct vidtv_demod_cnr_to_qual_s *cnr2qual = NULL;
 	u32    tuner_status                        = 0;
 
 	if (fe->ops.tuner_ops.set_params) {
@@ -492,3 +487,7 @@ static struct i2c_driver vidtv_demod_i2c_driver = {
 };
 
 module_i2c_driver(vidtv_demod_i2c_driver);
+
+MODULE_DESCRIPTION("Virtual DVB Demodulator Driver");
+MODULE_AUTHOR("Daniel W. S. Almeida");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.c b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
index b08bfff7b8f2..1ffb1da1e124 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
@@ -200,14 +200,12 @@ vidtv_s302m_compute_sample_count_v(struct vidtv_encoder *e)
 	u32 vau_duration_usecs;
 	u32 sample_duration_usecs;
 	u32 i;
-	u32 sample_count;
 	u32 s;
 
 	vau_duration_usecs    = USEC_PER_SEC / e->sync->sampling_rate_hz;
 	sample_duration_usecs = USEC_PER_SEC / e->sampling_rate_hz;
 
 	for (i = 0; i < e->sync->nunits; ++i) {
-		sample_count = e->samples_per_unit[i];
 		s = DIV_ROUND_UP(vau_duration_usecs, sample_duration_usecs);
 		e->samples_per_unit[i] = s;
 	}
diff --git a/drivers/media/test-drivers/vidtv/vidtv_tuner.c b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
index ece4a94b0c3a..882a1fec2ce5 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_tuner.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
@@ -30,13 +30,13 @@ struct vidtv_tuner_cnr_to_qual_s {
 	u32 cnr_ok, cnr_good;
 };
 
-struct vidtv_tuner_cnr_to_qual_s vidtv_tuner_c_cnr_2_qual[] = {
+static const struct vidtv_tuner_cnr_to_qual_s vidtv_tuner_c_cnr_2_qual[] = {
 	/* from libdvbv5 source code, in milli db */
 	{ QAM_256, FEC_NONE,  34000, 38000},
 	{ QAM_64,  FEC_NONE,  30000, 34000},
 };
 
-struct vidtv_tuner_cnr_to_qual_s vidtv_tuner_s_cnr_2_qual[] = {
+static const struct vidtv_tuner_cnr_to_qual_s vidtv_tuner_s_cnr_2_qual[] = {
 	/* from libdvbv5 source code, in milli db */
 	{ QPSK, FEC_1_2,  7000, 10000},
 
@@ -47,7 +47,7 @@ struct vidtv_tuner_cnr_to_qual_s vidtv_tuner_s_cnr_2_qual[] = {
 	{ QPSK, FEC_7_8, 12000, 15000},
 };
 
-struct vidtv_tuner_cnr_to_qual_s vidtv_tuner_s2_cnr_2_qual[] = {
+static const struct vidtv_tuner_cnr_to_qual_s vidtv_tuner_s2_cnr_2_qual[] = {
 	/* from libdvbv5 source code, in milli db */
 	{ QPSK,  FEC_1_2,   9000,  12000},
 	{ QPSK,  FEC_2_3,  11000,  14000},
@@ -61,7 +61,7 @@ struct vidtv_tuner_cnr_to_qual_s vidtv_tuner_s2_cnr_2_qual[] = {
 	{ PSK_8, FEC_8_9,  19000,  22000},
 };
 
-static struct vidtv_tuner_cnr_to_qual_s vidtv_tuner_t_cnr_2_qual[] = {
+static const struct vidtv_tuner_cnr_to_qual_s vidtv_tuner_t_cnr_2_qual[] = {
 	/* from libdvbv5 source code, in milli db*/
 	{   QPSK, FEC_1_2,  4100,  5900},
 	{   QPSK, FEC_2_3,  6100,  9600},
@@ -159,7 +159,7 @@ static int
 vidtv_tuner_get_signal_strength(struct dvb_frontend *fe, u16 *strength)
 {
 	struct dtv_frontend_properties *c          = &fe->dtv_property_cache;
-	struct vidtv_tuner_cnr_to_qual_s *cnr2qual = NULL;
+	const struct vidtv_tuner_cnr_to_qual_s *cnr2qual = NULL;
 	u32    array_size                          = 0;
 	s32 shift;
 	u32 i;
-- 
2.26.2



Thanks,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
