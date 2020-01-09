Return-Path: <SRS0=kdHc=26=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88755C282DD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jan 2020 15:24:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58EC02072A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jan 2020 15:24:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fG03urZx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58EC02072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1597686B43;
	Thu,  9 Jan 2020 15:24:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SFKRqJqIg63O; Thu,  9 Jan 2020 15:24:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E74BA86762;
	Thu,  9 Jan 2020 15:24:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4643C1796;
	Thu,  9 Jan 2020 15:24:28 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7043C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 15:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C699084CF4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 15:24:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gQm3R-K5Hx3A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 15:24:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0E0A884DD1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 15:24:27 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id dc14so3092061qvb.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 09 Jan 2020 07:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=35mC7jjOS3DAVNg/Jfn1fqnQ9eH4+gqUOYcR+UciIqA=;
 b=fG03urZxeqaR/YJegJQkWaGOEaewWP+6xt4PZ5nK5aj04ciJhN7+AHOHanx+3UBexC
 oOaWmquiLHV7K65YHs5Hk5+LaGZ5DKqcFIgjIYY267E7NzIVF71LKrRFid/Ykym2Sscc
 6KQTbt7SGIDysEoKQ1aHzWM4FimIRAJm3kTo3K/rBJYI1+SCLFhMPwngLxrh02sj7UXM
 s2SbDvS5bV3FHKLxrTHgqYDGBclxbFD5Y9dy8nT4vFv3LuaYeVuDlyJGkJ5VplN+5LRX
 yBZzzezejXV3NM5W7MF94HXSnqRAc31qCm7xBtFQEyMhPv87S6INf7QcSAMXY6l2I9e+
 8jnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=35mC7jjOS3DAVNg/Jfn1fqnQ9eH4+gqUOYcR+UciIqA=;
 b=HoqIcNSyYTmgr69s7VgyUfgVj7VOt6wQW++viacoVKfEmcPtBOJqtmOmKKZKXEbdth
 3i/ILjZM7NmQj1Y9aqj9LBxG4LeFyxKapEzXQqrUVDwBCrbAoz1gterTVXHIwD8MEyJE
 Pzr1t1ec47nJZGNRjtoYv76U2VuGraLEDBtSxMXyuhSOC9b4wOjKdpACbyqkvgsWjS56
 MNLzpyZ73rYvDcWQxjGD0dcTQa7P/Jk/E2En+3Ki/ptnqNyblB6Udv81KMB346Wk/2+L
 RKUxwG5wMr8rwbiV99cSx5RSSeiM1aLLrsj9kVW5CdzdDYfkhwLpPWi+k1GjjMFumweA
 ADbA==
X-Gm-Message-State: APjAAAWEp691FP0jhKguG3nPWboOcEL2H/Yr03YKiGJLx3tfDl3W0wSX
 wxAXB27CMd3K/4xqOYUNmdQ=
X-Google-Smtp-Source: APXvYqy32o1vG5tTVuYr1KL21AFYotys7yajvZ3XGbhUX5Et8M17C2uj78Ie6W4Ox5SPQbfGPjD3xQ==
X-Received: by 2002:ad4:4e68:: with SMTP id ec8mr9385323qvb.203.1578583466037; 
 Thu, 09 Jan 2020 07:24:26 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id w21sm3641361qth.17.2020.01.09.07.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 07:24:25 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org, sean@mess.org, tglx@linutronix.de,
 gregkh@linuxfoundation.org
Date: Thu,  9 Jan 2020 12:24:08 -0300
Message-Id: <20200109152408.919325-2-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200109152408.919325-1-dwlsalmeida@gmail.com>
References: <20200109152408.919325-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH 1/1] media: dvb_dummy_tuner:
	implement driver skeleton
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

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Implement the skeleton for the tuner driver in a separate file.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/tuners/Kconfig           |   7 ++
 drivers/media/tuners/Makefile          |   1 +
 drivers/media/tuners/dvb_dummy_tuner.c | 153 +++++++++++++++++++++++++
 drivers/media/tuners/dvb_dummy_tuner.h |  20 ++++
 4 files changed, 181 insertions(+)
 create mode 100644 drivers/media/tuners/dvb_dummy_tuner.c
 create mode 100644 drivers/media/tuners/dvb_dummy_tuner.h

diff --git a/drivers/media/tuners/Kconfig b/drivers/media/tuners/Kconfig
index e104bb7766e1..efa1591fe0ae 100644
--- a/drivers/media/tuners/Kconfig
+++ b/drivers/media/tuners/Kconfig
@@ -296,4 +296,11 @@ config MEDIA_TUNER_QM1D1B0004
 	default m if !MEDIA_SUBDRV_AUTOSELECT
 	help
 	  Sharp QM1D1B0004 ISDB-S tuner driver.
+
+config MEDIA_TUNER_DVB_DUMMY_TUNER
+	tristate "Dummy tuner"
+	depends on MEDIA_SUPPORT && I2C
+	default m if !MEDIA_SUBDRV_AUTOSELECT
+	help
+	  Dummy tuner driver for common TV standards.
 endmenu
diff --git a/drivers/media/tuners/Makefile b/drivers/media/tuners/Makefile
index 7b4f8423501e..f98de1cf2e19 100644
--- a/drivers/media/tuners/Makefile
+++ b/drivers/media/tuners/Makefile
@@ -44,5 +44,6 @@ obj-$(CONFIG_MEDIA_TUNER_QM1D1C0042) += qm1d1c0042.o
 obj-$(CONFIG_MEDIA_TUNER_QM1D1B0004) += qm1d1b0004.o
 obj-$(CONFIG_MEDIA_TUNER_M88RS6000T) += m88rs6000t.o
 obj-$(CONFIG_MEDIA_TUNER_TDA18250) += tda18250.o
+obj-$(CONFIG_MEDIA_TUNER_DVB_DUMMY_TUNER) += dvb_dummy_tuner.o
 
 ccflags-y += -I$(srctree)/drivers/media/dvb-frontends
diff --git a/drivers/media/tuners/dvb_dummy_tuner.c b/drivers/media/tuners/dvb_dummy_tuner.c
new file mode 100644
index 000000000000..63d2e47d4739
--- /dev/null
+++ b/drivers/media/tuners/dvb_dummy_tuner.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  Driver for Dummy Frontend
+ *
+ *  Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#include <linux/errno.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <media/dvb_frontend.h>
+#include "dvb_dummy_tuner.h"
+
+struct dvb_dummy_tuner_dev {
+	struct dvb_frontend *fe;
+};
+
+static void dvb_dummy_tuner_release(struct dvb_frontend *fe)
+{
+}
+
+static int dvb_dummy_tuner_init(struct dvb_frontend *fe)
+{
+	return 0;
+}
+
+static int dvb_dummy_tuner_sleep(struct dvb_frontend *fe)
+{
+	return 0;
+}
+
+static int dvb_dummy_tuner_suspend(struct dvb_frontend *fe)
+{
+	return 0;
+}
+
+static int dvb_dummy_tuner_resume(struct dvb_frontend *fe)
+{
+	return 0;
+}
+
+static int dvb_dummy_tuner_set_params(struct dvb_frontend *fe)
+{
+	return 0;
+}
+
+static int dvb_dummy_tuner_set_config(struct dvb_frontend *fe, void *priv_cfg)
+{
+	return 0;
+}
+
+static int dvb_dummy_tuner_get_frequency(struct dvb_frontend *fe,
+					 u32 *frequency)
+{
+	return 0;
+}
+
+static int dvb_dummy_tuner_get_bandwidth(struct dvb_frontend *fe,
+					 u32 *bandwidth)
+{
+	return 0;
+}
+
+static int dvb_dummy_tuner_get_if_frequency(struct dvb_frontend *fe,
+					    u32 *frequency)
+{
+	return 0;
+}
+
+static int dvb_dummy_tuner_get_status(struct dvb_frontend *fe, u32 *status)
+{
+	return 0;
+}
+
+static const struct dvb_tuner_ops dvb_dummy_tuner_ops = {
+	.release = dvb_dummy_tuner_release,
+	.init = dvb_dummy_tuner_init,
+	.sleep = dvb_dummy_tuner_sleep,
+	.suspend = dvb_dummy_tuner_suspend,
+	.resume = dvb_dummy_tuner_resume,
+	.set_params = dvb_dummy_tuner_set_params,
+	.set_config = dvb_dummy_tuner_set_config,
+	.get_bandwidth = dvb_dummy_tuner_get_bandwidth,
+	.get_frequency = dvb_dummy_tuner_get_frequency,
+	.get_if_frequency = dvb_dummy_tuner_get_if_frequency,
+	.get_status = dvb_dummy_tuner_get_status,
+};
+
+static const struct i2c_device_id dvb_dummy_tuner_i2c_id_table[] = {
+	{"dvb_dummy_tuner", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, dvb_dummy_tuner_i2c_id_table);
+
+static int dvb_dummy_tuner_i2c_probe(struct i2c_client *client,
+				     const struct i2c_device_id *id)
+{
+	int ret = 0;
+	struct dvb_dummy_tuner_config *config = client->dev.platform_data;
+	struct dvb_frontend *fe = config->fe;
+	struct dvb_dummy_tuner_dev *tuner_dev = NULL;
+
+	tuner_dev = kzalloc(sizeof(*tuner_dev), GFP_KERNEL);
+	if (!tuner_dev) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	i2c_set_clientdata(client, tuner_dev);
+	tuner_dev->fe = config->fe;
+
+	memcpy(&fe->ops.tuner_ops,
+	       &dvb_dummy_tuner_ops,
+	       sizeof(struct dvb_tuner_ops));
+
+	fe->tuner_priv = client;
+
+	pr_debug("%s: Successfully probed %s\n", __func__, client->name);
+	return ret;
+
+err:
+	pr_err("%s: failed\n", __func__);
+	return ret;
+}
+
+static int dvb_dummy_tuner_i2c_remove(struct i2c_client *client)
+{
+	struct dvb_dummy_tuner_dev *tuner_dev = i2c_get_clientdata(client);
+	struct dvb_frontend *fe = tuner_dev->fe;
+
+	memset(&fe->ops.tuner_ops, 0, sizeof(struct dvb_tuner_ops));
+	fe->tuner_priv = NULL;
+	kfree(tuner_dev);
+
+	return 0;
+}
+
+static struct i2c_driver dvb_dummy_tuner_i2c_driver = {
+	.driver = {
+		.name = "dvb_dummy_tuner",
+		.suppress_bind_attrs = true,
+	},
+	.probe		= dvb_dummy_tuner_i2c_probe,
+	.remove		= dvb_dummy_tuner_i2c_remove,
+	.id_table	= dvb_dummy_tuner_i2c_id_table,
+};
+module_i2c_driver(dvb_dummy_tuner_i2c_driver);
+
+MODULE_DESCRIPTION("DVB Dummy Tuner");
+MODULE_AUTHOR("Daniel W. S. Almeida");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/tuners/dvb_dummy_tuner.h b/drivers/media/tuners/dvb_dummy_tuner.h
new file mode 100644
index 000000000000..fde7628258fa
--- /dev/null
+++ b/drivers/media/tuners/dvb_dummy_tuner.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * DVB Dummy Tuner
+ *
+ */
+#ifndef __TUNER_DVB_DUMMY_TUNER_H__
+#define __TUNER_DVB_DUMMY_TUNER_H__
+
+#include <media/dvb_frontend.h>
+/**
+ * struct dvb_dummy_tuner_config - configuration parameters for the dummy tuner
+ *
+ * @fe:
+ *	frontend returned by driver
+ */
+struct dvb_dummy_tuner_config {
+	struct dvb_frontend *fe;
+};
+
+#endif /*__TUNER_DVB_DUMMY_TUNER_H__ */
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
