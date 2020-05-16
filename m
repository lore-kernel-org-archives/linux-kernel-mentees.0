Return-Path: <SRS0=jt7Q=7C=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40D1C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 May 2020 12:44:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9BAA207C4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 May 2020 12:44:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BpAAsbqO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9BAA207C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B50498746D;
	Wed, 20 May 2020 12:44:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id igz6PfLeFZbb; Wed, 20 May 2020 12:44:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6121C86439;
	Wed, 20 May 2020 12:44:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A77BC0176;
	Wed, 20 May 2020 12:44:16 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2016CC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 May 2020 23:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0FB7188782
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 May 2020 23:42:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TM0VTQYOKnPr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 May 2020 23:42:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 50FF588783
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 May 2020 23:42:42 +0000 (UTC)
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de
 [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DE48E206D8;
 Sat, 16 May 2020 23:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589672562;
 bh=6rGmLIlDEM2Xz2+GpWdBgDbX8TcyVgVn0tzA8WFHj0E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BpAAsbqOO6srnJZOLjTVlgjD6TSQpZPE6ZR1XH5T0mAJEBd6zM+6ISYzQ6SBHFEH9
 2gKeOWncfhlXcJrMEy6N4FmEg0uISCUbFdvCFjkYmTEi4JSjBZLwNMXNYfuDqLHHnV
 Plc/Y9sxWjrt7CDYkbuOoQLZtMxHF2qNc6tZVxwc=
Date: Sun, 17 May 2020 01:42:37 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20200517014237.30e521dd@coco.lan>
In-Reply-To: <20200517012935.56ca2a8d@coco.lan>
References: <DE1E173D-8D56-4CA5-9838-E9476B24DD69@getmailspring.com>
 <20200517012935.56ca2a8d@coco.lan>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 20 May 2020 12:44:14 +0000
Cc: "linux-kernel-mentees@lists.linuxfoundation.org\"
 <linux-kernel-mentees@lists.linuxfoundation.org>"@osuosl.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] modprobing 'vidtv' doesn't really do
	anything
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

Em Sun, 17 May 2020 01:29:35 +0200
Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:

> Em Sat, 16 May 2020 19:09:35 -0300
> "Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:
> 
> > Hi Mauro!
> > 
> > I am trying to iron out the bugs in the virtual DVB driver I have been
> > working on for the past few months.
> > 
> > modprobing vidtv_bridge apparently works, i.e. 'vidtv_bridge' gets
> > listed in the output of 'lsmod' and there's a message on dmesg warning
> > against loading out of tree modules.
> 
> The warning is probably due to that:
> 
> WARNING: modpost: missing MODULE_LICENSE() in drivers/media/test-drivers/vidtv//vidtv_demod.o
> WARNING: modpost: missing MODULE_LICENSE() in drivers/media/test-drivers/vidtv//vidtv_bridge.o
> 
> You forgot to add MODULE_LICENSE() macro somewhere.
> 
> With is weird, as those are there:
> 
> 	drivers/media/test-drivers/vidtv/vidtv_bridge.c:MODULE_AUTHOR("Daniel W. S. Almeida");
> 	drivers/media/test-drivers/vidtv/vidtv_bridge.c:MODULE_LICENSE("GPL");
> 	drivers/media/test-drivers/vidtv/vidtv_bridge.c:MODULE_DEVICE_TABLE(i2c, vidtv_bridge_id_table);
> 
> (yet, a good practice nowadays is to place all those three at the end of
> a file - not at the beginning)
> 
> This is weird:
> 
> 	drivers/media/test-drivers/vidtv/vidtv_bridge.c:module_i2c_driver(vidtv_bridge_driver);
> 	drivers/media/test-drivers/vidtv/vidtv_demod.c:module_i2c_driver(vidtv_demod_i2c_driver);
> 	drivers/media/test-drivers/vidtv/vidtv_tuner.c:module_i2c_driver(vidtv_tuner_i2c_driver);
> 
> With the above, none of the three files will be initialized, as they
> would wait for some other driver to bind them on some I2C bus.
> 
> See, the way the Kernel works is that each bus has some sort
> of code that initializes the driver. For buses like PCI and USB,
> this happens when an USB ID or PCI ID matches their device tables.
> For normal[1] I2C devices, the driver which creates an I2C adapter
> should either manually bind new I2C devices or ask the I2C core
> to scan.
> 
> [1] ACPI devices using I2C buses use a different logic.
> 
> So, basically, the module_i2c_driver() tells the driver code
> that those devices will be available when some other driver
> would need to bind them. This is the right thing to do for the
> tuner and demod, but the bridge driver should do something else.
> 
> I would be expecting at the bridge driver something like:
> 
> 	static struct platform_driver vidtv_bridge_driver = {
> 		.probe		= vidtv_bridge_probe,
> 		.remove		= vidtv_bridge_remove,
> 		.driver		= {
> 			.name	= "vidtv-bridge",
> 		},
> 	};
> 	module_platform_driver(vidtv_bridge_driver);
> 
> Note: the other media virtual drivers don't use the 
> "module_platform_driver" macro. 
> 
> While I don't test this for a while, but looking at the code
> differences, they also declare a "platform_driver". So, they use 
> a more verbose syntax (see at the end). I suspect that this is
> needed for those devices to be probed unconditionally[2].
> 
> [1] a real platform driver is probed via DT or some other
> mechanism, like ACPI.
> 
> Thanks,
> Mauro
> 
> -
> 
> This is what vim2m.c does, for example:
> 
> 
> static struct platform_driver vim2m_pdrv = {
> 	.probe		= vim2m_probe,
> 	.remove		= vim2m_remove,
> 	.driver		= {
> 		.name	= MEM2MEM_NAME,
> 	},
> };
> 
> static void __exit vim2m_exit(void)
> {
> 	platform_driver_unregister(&vim2m_pdrv);
> 	platform_device_unregister(&vim2m_pdev);
> }
> 
> static int __init vim2m_init(void)
> {
> 	int ret;
> 
> 	ret = platform_device_register(&vim2m_pdev);
> 	if (ret)
> 		return ret;
> 
> 	ret = platform_driver_register(&vim2m_pdrv);
> 	if (ret)
> 		platform_device_unregister(&vim2m_pdev);
> 
> 	return ret;
> }
> 
> module_init(vim2m_init);
> module_exit(vim2m_exit);

There's also a problem at the Makefile. The way it was defined, the
vidtv-bridge driver won't be built.

The enclosed patch should fix the issues. The bridge driver doesn't 
build, though.

Thanks,
Mauro

---

diff --git a/drivers/media/test-drivers/vidtv/Makefile b/drivers/media/test-drivers/vidtv/Makefile
index a1d29001fffe..a56ad8bce0cb 100644
--- a/drivers/media/test-drivers/vidtv/Makefile
+++ b/drivers/media/test-drivers/vidtv/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 vidtv_demod-objs := vidtv_common.o
-vidtv_bridge-objs := vidtv_common.o vidtv_ts.o vidtv_psi.o vidtv_pes.o \
-		     vidtv_s302m.o vidtv_channel.o vidtv_mux.o
+vidtv-objs := vidtv_common.o vidtv_ts.o vidtv_psi.o vidtv_pes.o \
+	      vidtv_s302m.o vidtv_channel.o vidtv_mux.o vidtv_bridge.o
 
 obj-$(CONFIG_DVB_VIDTV)	+= vidtv_tuner.o vidtv_demod.o vidtv_bridge.o
diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index c9876372fdeb..762abf45dda0 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -20,9 +20,6 @@
 #define TUNER_DEFAULT_ADDR 0x68
 #define DEMOD_DEFAULT_ADDR 0x60
 
-MODULE_AUTHOR("Daniel W. S. Almeida");
-MODULE_LICENSE("GPL");
-
 static unsigned int drop_tslock_prob_on_low_snr;
 module_param(drop_tslock_prob_on_low_snr, uint, 0644);
 MODULE_PARM_DESC(drop_tslock_prob_on_low_snr,
@@ -422,21 +419,44 @@ static int vidtv_bridge_i2c_remove(struct i2c_client *client)
 	return 0;
 }
 
-static const struct i2c_device_id vidtv_bridge_id_table[] = {
-	{"vidtv_bridge", 0},
-	{}
+static struct platform_device vidtv_bridge_dev = {
+	.name		= "vidtv_bridge",
+	.dev.release	= vidtv_bridge_dev_release,
 };
 
-MODULE_DEVICE_TABLE(i2c, vidtv_bridge_id_table);
-
-static struct i2c_driver vidtv_bridge_driver = {
+static struct platform_driver vidtv_bridge_driver = {
 	.driver = {
 		.name                = "vidtv_bridge",
 		.suppress_bind_attrs = true,
 	},
 	.probe    = vidtv_bridge_i2c_probe,
 	.remove   = vidtv_bridge_i2c_remove,
-	.id_table = vidtv_bridge_id_table,
 };
 
-module_i2c_driver(vidtv_bridge_driver);
+static void __exit vidtv_bridge_exit(void)
+{
+	platform_driver_unregister(&vidtv_bridge_dev);
+	platform_device_unregister(&vidtv_bridge_driver);
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
+		platform_device_unregister(&vidtv_bridge_pdev);
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
diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.c b/drivers/media/test-drivers/vidtv/vidtv_demod.c
index 15436e565a7b..01cd4a93b0ec 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_demod.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_demod.c
@@ -21,10 +21,6 @@
 #include "vidtv_demod.h"
 #include "vidtv_config.h"
 
-MODULE_DESCRIPTION("Virtual DVB Demodulator Driver");
-MODULE_AUTHOR("Daniel W. S. Almeida");
-MODULE_LICENSE("GPL");
-
 struct vidtv_demod_cnr_to_qual_s vidtv_demod_c_cnr_2_qual[] = {
 	/* from libdvbv5 source code, in milli db */
 	{ QAM_256, FEC_NONE,  34000, 38000},
@@ -492,3 +488,7 @@ static struct i2c_driver vidtv_demod_i2c_driver = {
 };
 
 module_i2c_driver(vidtv_demod_i2c_driver);
+
+MODULE_DESCRIPTION("Virtual DVB Demodulator Driver");
+MODULE_AUTHOR("Daniel W. S. Almeida");
+MODULE_LICENSE("GPL");

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
