Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D92C71159
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Aug 2023 16:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2902340182;
	Fri, 18 Aug 2023 16:45:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2902340182
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RqXxgHik
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uNKw8bl9pYrN; Fri, 18 Aug 2023 16:45:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 591634012A;
	Fri, 18 Aug 2023 16:45:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 591634012A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20431C0039;
	Fri, 18 Aug 2023 16:45:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2411C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Aug 2023 16:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A63B440182
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Aug 2023 16:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A63B440182
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bualx9-73nra
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Aug 2023 16:45:29 +0000 (UTC)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4248E4012A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Aug 2023 16:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4248E4012A
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-26d54d3d984so369914a91.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Aug 2023 09:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692377128; x=1692981928;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r7ZzJnqUJbBJTbfc57EbYeNyRN4BQXPGtSZMBseHPyg=;
 b=RqXxgHikQq068ccnLuPfXfzBjx5UaaAijhOQY17HmNuYf+5wZ9/G5NGmMAn4cy9oLQ
 mpD0bj0KGNzqkvsqhiOw9UZhBypxUzOHTFdKrDZsC6f/jd4ff6RD5lYWcrLClX5LaYp1
 /Fq1eVf/uFXYPUuRTamGe4I0QnA6/7QEaxwvdIRS2w5oQ0+JpQwIuR7ChAbuy+8YOAR/
 DzYOSkqEsm8pzbYUDC5P0BKv86EWbWeqMl+wOk+QwOFAMXYiVZQ+Um75RHYHRgGXfG9M
 RBdQOCRoVk0BIne/4DW8mUdx5Y/3a/2lKMRDoykcHHL5bQiy4DHdL4PElG8LewpEmTdJ
 GQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692377128; x=1692981928;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r7ZzJnqUJbBJTbfc57EbYeNyRN4BQXPGtSZMBseHPyg=;
 b=bQ8rb/STP8Ene9I2uN87UhdUKYfcmCmtmnldGKyRw3Q3YXS4fcsjagQ655vDtyyMA4
 UTEGC2o8dWkcDmcPPn+opjC2+IMXrfuNhcgHMwKgpVqGuwtq0dHsP6riK9+btgEkD+HL
 hwv3aio8yTiWr4IXaVJ3yriVdFsxmOhjK+LBbKQYMrhPkIUtE7/Ua/5/LYrENituTBrQ
 cK/H2FDWd8wvPXGjzlg11ejv5d0GOVuvRnYPS6Ez/QJBkULC9NYI/m6pxGq54GXUOfwT
 RQrDiNTlEpbD1t18NhhP5mgpiXDaQCokoxR4BTi7ko0WKWvjejrSSsYmQuAawYxeF2Yy
 wNwQ==
X-Gm-Message-State: AOJu0YyjdznyoqNSOBznc/n99wu2rZDDMW5ijNMiqSDYxlbobR1JpV3+
 vwmC0FzJ6KsQ18i8zeHU6MM=
X-Google-Smtp-Source: AGHT+IEAxBaqN+BM4PfnTLTjV8Z4I/FjIHA8TOfp9T8Sx85AyzH6qRjvmBiTH2v+ZDKGomr894QUZQ==
X-Received: by 2002:a17:90a:4982:b0:268:1b60:5031 with SMTP id
 d2-20020a17090a498200b002681b605031mr2855520pjh.12.1692377128558; 
 Fri, 18 Aug 2023 09:45:28 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:40c2:1016:aeca:d561:fc71:dfac:b68c])
 by smtp.gmail.com with ESMTPSA id
 25-20020a17090a1a1900b00268b439a0cbsm1889031pjk.23.2023.08.18.09.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 09:45:28 -0700 (PDT)
From: coolrrsh@gmail.com
To: hverkuil@xs4all.nl, mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] UBSAN: shift-out-of-bounds in set_flicker
Date: Fri, 18 Aug 2023 22:15:22 +0530
Message-Id: <20230818164522.12806-1-coolrrsh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+e27f3dbdab04e43b9f73@syzkaller.appspotmail.com
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

From: Rajeshwar R Shinde <coolrrsh@gmail.com>

Syzkaller reported the following issue:

UBSAN: shift-out-of-bounds in drivers/media/usb/gspca/cpia1.c:1031:27
shift exponent 245 is too large for 32-bit type 'int'
CPU: 1 PID: 25 Comm: kworker/1:1 
Not tainted 6.5.0-rc4-syzkaller-00118-g55c3e571d2a0 #0
Hardware name: 
Google Google Compute Engine/Google Compute Engine, BIOS Google 07/26/2023
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x125/0x1b0 lib/dump_stack.c:106
 ubsan_epilogue lib/ubsan.c:217 [inline]
 __ubsan_handle_shift_out_of_bounds+0x27a/0x600 lib/ubsan.c:387
 set_flicker.cold+0x1b/0x20 drivers/media/usb/gspca/cpia1.c:1031
 sd_s_ctrl+0x2c6/0xbf0 drivers/media/usb/gspca/cpia1.c:1782
 __v4l2_ctrl_handler_setup+0x511/0x710 
drivers/media/v4l2-core/v4l2-ctrls-core.c:2481
 v4l2_ctrl_handler_setup 
drivers/media/v4l2-core/v4l2-ctrls-core.c:2498 [inline]
 v4l2_ctrl_handler_setup+0x50/0xa0 
drivers/media/v4l2-core/v4l2-ctrls-core.c:2490
 gspca_set_default_mode drivers/media/usb/gspca/gspca.c:908 [inline]
 gspca_dev_probe2+0xdd6/0x1b20 drivers/media/usb/gspca/gspca.c:1541
 gspca_dev_probe+0x18b/0x270 drivers/media/usb/gspca/gspca.c:1610
 usb_probe_interface+0x307/0x930 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x234/0xc90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x4b0 drivers/base/dd.c:798
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:828
 __device_attach_driver+0x1d4/0x300 drivers/base/dd.c:956
 bus_for_each_drv+0x157/0x1d0 drivers/base/bus.c:457
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1028
 bus_probe_device+0x17c/0x1c0 drivers/base/bus.c:532
 device_add+0x11f1/0x1b40 drivers/base/core.c:3625
 usb_set_configuration+0x10cb/0x1c40 drivers/usb/core/message.c:2207
 usb_generic_driver_probe+0xca/0x130 drivers/usb/core/generic.c:238
 usb_probe_device+0xda/0x2c0 drivers/usb/core/driver.c:293
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x234/0xc90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x4b0 drivers/base/dd.c:798
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:828
 __device_attach_driver+0x1d4/0x300 drivers/base/dd.c:956
 bus_for_each_drv+0x157/0x1d0 drivers/base/bus.c:457
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1028
 bus_probe_device+0x17c/0x1c0 drivers/base/bus.c:532
 device_add+0x11f1/0x1b40 drivers/base/core.c:3625
 usb_new_device+0xd80/0x1960 drivers/usb/core/hub.c:2589
 hub_port_connect drivers/usb/core/hub.c:5440 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5580 [inline]
 port_event drivers/usb/core/hub.c:5740 [inline]
 hub_event+0x2e62/0x4f30 drivers/usb/core/hub.c:5822
 process_one_work+0xaa2/0x16f0 kernel/workqueue.c:2597
 process_scheduled_works kernel/workqueue.c:2664 [inline]
 worker_thread+0x896/0x1110 kernel/workqueue.c:2750
 kthread+0x33a/0x430 kernel/kthread.c:389
 ret_from_fork+0x2c/0x70 arch/x86/kernel/process.c:145
 ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:304
 </TASK>

shift-out-of-bounds error was triggered when sd->params.exposure.gain 
is right shifted beyond the bit range of int. Therefore added the 
conditional check before the shift operation.

Tested via syzbot.

Reported-by: syzbot+e27f3dbdab04e43b9f73@syzkaller.appspotmail.com

dashboard link: https://syzkaller.appspot.com/bug?extid=e27f3dbdab04e43b9f73

Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
---
 drivers/media/usb/gspca/cpia1.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/gspca/cpia1.c b/drivers/media/usb/gspca/cpia1.c
index 46ed95483e22..bb22be99ea8c 100644
--- a/drivers/media/usb/gspca/cpia1.c
+++ b/drivers/media/usb/gspca/cpia1.c
@@ -1028,7 +1028,9 @@ static int set_flicker(struct gspca_dev *gspca_dev, int on, int apply)
 			sd->params.exposure.expMode = 2;
 			sd->exposure_status = EXPOSURE_NORMAL;
 		}
+		if(sd->params.exposure.gain < 32){
 		currentexp = currentexp << sd->params.exposure.gain;
+		}
 		sd->params.exposure.gain = 0;
 		/* round down current exposure to nearest value */
 		startexp = (currentexp + ROUND_UP_EXP_FOR_FLICKER) / cj;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
