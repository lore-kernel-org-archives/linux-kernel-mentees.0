Return-Path: <SRS0=Zzie=JT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC6CC43460
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Apr 2021 16:09:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93FA3613FA
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Apr 2021 16:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93FA3613FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4754883E24;
	Thu, 22 Apr 2021 16:09:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6TzOoTXAA8a5; Thu, 22 Apr 2021 16:09:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27D7083133;
	Thu, 22 Apr 2021 16:09:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0EE14C000F;
	Thu, 22 Apr 2021 16:09:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1E247C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Apr 2021 16:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A32482D83
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Apr 2021 16:09:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FRf5KnZ34i0g
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Apr 2021 16:09:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F150482AA2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Apr 2021 16:09:36 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id lr7so5409753pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Apr 2021 09:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O+kc4mJNMwcVlHeeaZq20dPDAxDPgMNPRCiAotcbYBA=;
 b=Y1IYZOPJN9mwNDW9Eq7XW1Ayj8MTRsDPcq86Cl3k+zeK3IjdLQ1FswbWEhWeYcmQ65
 +qKjh99A1AIhrRfzn6jffRUPubxkyFaxSUopoM/mqNMnJTn08MqezRAfu6One+gW2HbB
 5l2+oVdRPeBjUtiS11RuagyqQpT/jWxeh5zSMuQTPbn497T7FFtFX2lZKJpw/K64RON5
 UopfQqirqxX7ZAMj0gZ40oGhuFAO5GaU2fhYmb2TrT6Nw6VB/NzXxF1+22XMwfp3smML
 sALnHPBu2Zu63iH6VXzgsAVsiZW6X3i8yDhq71zabFqzBUNReGuv5EoN2oiPKoMQajnl
 m1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O+kc4mJNMwcVlHeeaZq20dPDAxDPgMNPRCiAotcbYBA=;
 b=S+Kzd1pd5cJl0fwodQ4Ujs48ijaq2jWXqvGb/vwCX0Ccp/qtntFSCwW0JvPkZ68T9O
 nRH18NFGnqD9hQveBtq0touIO38D9/tn1LecIs1vbXTgvuONmDIcW+WXShJipC2xWj9F
 6NCorBDyU+TLO7QTALvBLm+/0mneazQSjWWm2jJssrBnHEkAVHQW9B9nJecOR1fqQZrY
 B3O3Ci1H4N2Dto0vnhfCBkkug1WqCyHo1SxRPv8e/CVMN5LKIT7ZnKBH3kCXkobbAsf0
 lPuMpUadbVlLCnDDPrbt75KkdYBcmcqP01sqfPalULyBTY5xQ2lxG9G93yNGwbhkTfSD
 REwg==
X-Gm-Message-State: AOAM533PULA+2UTCDJa2IeEN/xi4k1dpxb/Z9cMGeJzGcOo/yYmeSeSa
 VH49eHyur+gQBfHTccUsQx0=
X-Google-Smtp-Source: ABdhPJw0/ANuer1v5o3im1PnTtZ/nXHS61mXtQzzskO/Y4COCHoCkzJGvtmmMYbcBz1LoQqe/EABMg==
X-Received: by 2002:a17:903:1cf:b029:e8:c4ca:be6d with SMTP id
 e15-20020a17090301cfb02900e8c4cabe6dmr4241196plh.39.1619107776339; 
 Thu, 22 Apr 2021 09:09:36 -0700 (PDT)
Received: from localhost.localdomain ([171.61.238.200])
 by smtp.gmail.com with ESMTPSA id y189sm2355713pfy.8.2021.04.22.09.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 09:09:35 -0700 (PDT)
From: Atul Gopinathan <atulgopinathan@gmail.com>
To: mchehab@kernel.org
Subject: [PATCH] media: gspca: stv06xx: Fix memleak in stv06xx subdrivers
Date: Thu, 22 Apr 2021 21:37:42 +0530
Message-Id: <20210422160742.7166-1-atulgopinathan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: syzbot+990626a4ef6f043ed4cd@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Atul Gopinathan <atulgopinathan@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
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

During probing phase of a gspca driver in "gspca_dev_probe2()", the
stv06xx subdrivers have certain sensor variants (namely, hdcs_1x00,
hdcs_1020 and pb_0100) that allocate memory for their respective sensor
which is passed to the "sd->sensor_priv" field. During the same probe
routine, after "sensor_priv" allocation, there are chances of later
functions invoked to fail which result in the probing routine to end
immediately via "goto out" path. While doing so, the memory allocated
earlier for the sensor isn't taken care of resulting in memory leak.

Fix this by adding operations to the gspca, stv06xx and down to the
sensor levels to free this allocated memory during gspca probe failure.

-
The current level of hierarchy looks something like this:

	gspca (main driver) represented by struct gspca_dev
	   |
___________|_____________________________________
|	|	|	|	|		| (subdrivers)
			|			  represented
 			stv06xx			  by "struct sd"
			|
 	 _______________|_______________
 	 |	|	|	|	|  (sensors)
	 	|			|
 		hdcs_1x00/1020		pb01000
			|_________________|
				|
			These three sensor variants
			allocate memory for
			"sd->sensor_priv" field.

Here, "struct gspca_dev" is the representation used in the top level. In
the sub-driver levels, "gspca_dev" pointer is cast to "struct sd*",
something like this:

	struct sd *sd = (struct sd *)gspca_dev;

This is possible because the first field of "struct sd" is "gspca_dev":

	struct sd {
		struct gspca_dev;
		.
		.
	}

Therefore, to deallocate the "sd->sensor_priv" fields from
"gspca_dev_probe2()" which is at the top level, the patch creates
operations for the subdrivers and sensors to be invoked from the gspca
driver levels. These operations essentially free the "sd->sensor_priv"
which were allocated by the "config" and "init_controls" operations in
the case of stv06xx sub-drivers and the sensor levels.

This patch doesn't affect other sub-drivers or even sensors who never
allocate memory to "sensor_priv". It has also been tested by syzbot and
it returned an "OK" result.

https://syzkaller.appspot.com/bug?id=ab69427f2911374e5f0b347d0d7795bfe384016c
-

Fixes: 4c98834addfe ("V4L/DVB (10048): gspca - stv06xx: New subdriver.")
Cc: stable@vger.kernel.org
Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
Reported-by: syzbot+990626a4ef6f043ed4cd@syzkaller.appspotmail.com
Tested-by: syzbot+990626a4ef6f043ed4cd@syzkaller.appspotmail.com
Signed-off-by: Atul Gopinathan <atulgopinathan@gmail.com>
---
 drivers/media/usb/gspca/gspca.c                  |  2 ++
 drivers/media/usb/gspca/gspca.h                  |  1 +
 drivers/media/usb/gspca/stv06xx/stv06xx.c        | 15 +++++++++++++++
 drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c   |  9 +++++++++
 drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.h   |  3 +++
 drivers/media/usb/gspca/stv06xx/stv06xx_pb0100.c |  9 +++++++++
 drivers/media/usb/gspca/stv06xx/stv06xx_pb0100.h |  2 ++
 drivers/media/usb/gspca/stv06xx/stv06xx_sensor.h |  3 +++
 8 files changed, 44 insertions(+)

diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspca.c
index 158c8e28ed2c..88298d9f604d 100644
--- a/drivers/media/usb/gspca/gspca.c
+++ b/drivers/media/usb/gspca/gspca.c
@@ -1577,6 +1577,8 @@ int gspca_dev_probe2(struct usb_interface *intf,
 	v4l2_ctrl_handler_free(gspca_dev->vdev.ctrl_handler);
 	v4l2_device_unregister(&gspca_dev->v4l2_dev);
 	kfree(gspca_dev->usb_buf);
+	if (sd_desc->free_sensor_priv)
+		sd_desc->free_sensor_priv(gspca_dev);
 	kfree(gspca_dev);
 	return ret;
 }
diff --git a/drivers/media/usb/gspca/gspca.h b/drivers/media/usb/gspca/gspca.h
index b0ced2e14006..792f19307b91 100644
--- a/drivers/media/usb/gspca/gspca.h
+++ b/drivers/media/usb/gspca/gspca.h
@@ -119,6 +119,7 @@ struct sd_desc {
 	cam_streamparm_op set_streamparm;
 	cam_format_op try_fmt;
 	cam_frmsize_op enum_framesizes;
+	cam_op free_sensor_priv;
 #ifdef CONFIG_VIDEO_ADV_DEBUG
 	cam_set_reg_op set_register;
 	cam_get_reg_op get_register;
diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx.c b/drivers/media/usb/gspca/stv06xx/stv06xx.c
index 95673fc0a99c..de1daeb1a03c 100644
--- a/drivers/media/usb/gspca/stv06xx/stv06xx.c
+++ b/drivers/media/usb/gspca/stv06xx/stv06xx.c
@@ -529,6 +529,8 @@ static int sd_int_pkt_scan(struct gspca_dev *gspca_dev,
 static int stv06xx_config(struct gspca_dev *gspca_dev,
 			  const struct usb_device_id *id);
 
+static int stv06xx_free_sensor_priv(struct gspca_dev *gspca_dev);
+
 /* sub-driver description */
 static const struct sd_desc sd_desc = {
 	.name = MODULE_NAME,
@@ -540,6 +542,7 @@ static const struct sd_desc sd_desc = {
 	.pkt_scan = stv06xx_pkt_scan,
 	.isoc_init = stv06xx_isoc_init,
 	.isoc_nego = stv06xx_isoc_nego,
+	.free_sensor_priv = stv06xx_free_sensor_priv,
 #if IS_ENABLED(CONFIG_INPUT)
 	.int_pkt_scan = sd_int_pkt_scan,
 #endif
@@ -583,7 +586,19 @@ static int stv06xx_config(struct gspca_dev *gspca_dev,
 	return -ENODEV;
 }
 
+/*
+ * Free the memory allocated to sd->sensor_priv field during initial phases of
+ * gspca (probe/init_control) which later encountered error in the same phase.
+ */
+static int stv06xx_free_sensor_priv(struct gspca_dev *gspca_dev)
+{
+	struct sd *sd = (struct sd *) gspca_dev;
+
+	if (sd->sensor->free_sensor_priv)
+		sd->sensor->free_sensor_priv(sd);
 
+	return 0;
+}
 
 /* -- module initialisation -- */
 static const struct usb_device_id device_table[] = {
diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c b/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c
index 5a47dcbf1c8e..50b7a80a855a 100644
--- a/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c
+++ b/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c
@@ -529,3 +529,12 @@ static int hdcs_dump(struct sd *sd)
 	}
 	return 0;
 }
+
+static int hdcs_deallocate(struct sd *sd)
+{
+	struct hdcs *hdcs = sd->sensor_priv;
+
+	kfree(hdcs);
+	sd->sensor_priv = NULL;
+	return 0;
+}
diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.h b/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.h
index 326a6eb68237..482e1a8e9a3b 100644
--- a/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.h
+++ b/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.h
@@ -121,6 +121,7 @@ static int hdcs_init(struct sd *sd);
 static int hdcs_init_controls(struct sd *sd);
 static int hdcs_stop(struct sd *sd);
 static int hdcs_dump(struct sd *sd);
+static int hdcs_deallocate(struct sd *sd);
 
 static int hdcs_set_exposure(struct gspca_dev *gspca_dev, __s32 val);
 static int hdcs_set_gain(struct gspca_dev *gspca_dev, __s32 val);
@@ -142,6 +143,7 @@ const struct stv06xx_sensor stv06xx_sensor_hdcs1x00 = {
 	.start = hdcs_start,
 	.stop = hdcs_stop,
 	.dump = hdcs_dump,
+	.free_sensor_priv = hdcs_deallocate,
 };
 
 const struct stv06xx_sensor stv06xx_sensor_hdcs1020 = {
@@ -161,6 +163,7 @@ const struct stv06xx_sensor stv06xx_sensor_hdcs1020 = {
 	.start = hdcs_start,
 	.stop = hdcs_stop,
 	.dump = hdcs_dump,
+	.free_sensor_priv = hdcs_deallocate,
 };
 
 static const u16 stv_bridge_init[][2] = {
diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_pb0100.c b/drivers/media/usb/gspca/stv06xx/stv06xx_pb0100.c
index ae382b3b5f7f..97ea886698c1 100644
--- a/drivers/media/usb/gspca/stv06xx/stv06xx_pb0100.c
+++ b/drivers/media/usb/gspca/stv06xx/stv06xx_pb0100.c
@@ -318,6 +318,15 @@ static int pb0100_dump(struct sd *sd)
 	return 0;
 }
 
+static int pb0100_free_ctrls(struct sd *sd)
+{
+	struct pb0100_ctrls *ctrls = sd->sensor_priv;
+
+	kfree(ctrls);
+	sd->sensor_priv = NULL;
+	return 0;
+}
+
 static int pb0100_set_gain(struct gspca_dev *gspca_dev, __s32 val)
 {
 	int err;
diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_pb0100.h b/drivers/media/usb/gspca/stv06xx/stv06xx_pb0100.h
index c5a6614577de..12ec207f6bfa 100644
--- a/drivers/media/usb/gspca/stv06xx/stv06xx_pb0100.h
+++ b/drivers/media/usb/gspca/stv06xx/stv06xx_pb0100.h
@@ -102,6 +102,7 @@ static int pb0100_init(struct sd *sd);
 static int pb0100_init_controls(struct sd *sd);
 static int pb0100_stop(struct sd *sd);
 static int pb0100_dump(struct sd *sd);
+static int pb0100_free_ctrls(struct sd *sd);
 
 /* V4L2 controls supported by the driver */
 static int pb0100_set_gain(struct gspca_dev *gspca_dev, __s32 val);
@@ -126,6 +127,7 @@ const struct stv06xx_sensor stv06xx_sensor_pb0100 = {
 	.start = pb0100_start,
 	.stop = pb0100_stop,
 	.dump = pb0100_dump,
+	.free_sensor_priv = pb0100_free_ctrls,
 };
 
 #endif
diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_sensor.h b/drivers/media/usb/gspca/stv06xx/stv06xx_sensor.h
index 67c13c689b9c..22c75c528331 100644
--- a/drivers/media/usb/gspca/stv06xx/stv06xx_sensor.h
+++ b/drivers/media/usb/gspca/stv06xx/stv06xx_sensor.h
@@ -69,6 +69,9 @@ struct stv06xx_sensor {
 
 	/* Instructs the sensor to dump all its contents */
 	int (*dump)(struct sd *sd);
+
+	/* Frees sensor_priv field during initial gspca probe errors */
+	int (*free_sensor_priv)(struct sd *sd);
 };
 
 #endif
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
