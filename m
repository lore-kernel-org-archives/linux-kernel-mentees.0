Return-Path: <SRS0=pTPf=A7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB57C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 19:53:41 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B431C22B4E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 19:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uigLztwr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B431C22B4E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 77937880C3;
	Mon, 20 Jul 2020 19:53:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ozOc0ZguTmt7; Mon, 20 Jul 2020 19:53:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 73CBB87E45;
	Mon, 20 Jul 2020 19:53:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5DAD8C089F;
	Mon, 20 Jul 2020 19:53:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99A32C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 19:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 88D1F85F67
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 19:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uXW2UTPKaito
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 19:53:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1A41C85F41
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 19:53:38 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id 6so14264140qtt.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 12:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vEZ6tAuto0AD0QvhHLUuGc6guN47wM0Ymb1QgCDxeVc=;
 b=uigLztwrN8+TW+Kg+TRURPBDbQV2uGy9aJLLJ4rWTw0gqW9xVOmyB3vfkbfoTROJCh
 vLr86t8NOOkhTW/JZqnSoxd5qVdRBowDasBjsYh1vuAo09tntlNd7cSqLkwxVsXbbREd
 +aphWvOcj/CMdaHyfwo+68U0X45to2COOASo2+VCGAXoxf4Y2IFLWcoPVCDpbG73+RUV
 XojbFRAkZ1JMgwADurb3MrJH/R6gYUwMCpf0zWSynpeVIBZS0Mcpv78EQoYh5ouAxdVx
 VMt0KziuHbA+bdZuPvRmBFEQA7EnvufoYnSXzqYXx3QatVIpZFLo2XYVWJnK3bQ7YlGm
 m0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vEZ6tAuto0AD0QvhHLUuGc6guN47wM0Ymb1QgCDxeVc=;
 b=JMTiOZjV5FXk6GldTwqXw11fVjUVN5D7X/Gut/hx6fdXTCD6FgblRK8cOUWokNgR5h
 GLJYwS0An3G8rK1KekTAdvTPKnhu9r7nqZxzD11Tv5T3cx49UeFNOPb2W/6zcwjR2ZHA
 e6CNEQpMxWQaKPddoNZRphm2GIIjo+QjsYDkdPk6fSONQF1FRMi6jmCT9u4oOhBEDNl6
 V6U5vHhVMrlRXfiBEKZBMJbERtNUk1oZWAEV0uoevLVZA1IjKK63OXdjjlcPPPWEDdOO
 6E07y5zOSKSMlKYcLkl9lNknyJDkejnvmJIJPggeNZ7ZvV9OleppKVxwtA+o+MJ94ozq
 S7Ig==
X-Gm-Message-State: AOAM533/cTGJhyNU2/S+8ouxibv+Xc5N9+d7HzJaRoxUESxq+PR77MCs
 kbLuIXQUuAYag8+gqw0SsA==
X-Google-Smtp-Source: ABdhPJz1QibfLhe6SZAZMObPcSE12BVsweLJvbfU6nGN0/7ar7KPnNgawvwZ6AgpvXjUc8gjTmk/KQ==
X-Received: by 2002:ac8:1a14:: with SMTP id v20mr1441898qtj.269.1595274817129; 
 Mon, 20 Jul 2020 12:53:37 -0700 (PDT)
Received: from localhost.localdomain (c-76-119-149-155.hsd1.ma.comcast.net.
 [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id c70sm438566qke.109.2020.07.20.12.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 12:53:36 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Mon, 20 Jul 2020 15:52:09 -0400
Message-Id: <20200720195209.4365-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200718231218.170730-1-yepeilin.cs@gmail.com>
References: <20200718231218.170730-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Cc: linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [Linux-kernel-mentees] [PATCH v2] usbhid: Fix slab-out-of-bounds
	write in hiddev_ioctl_usage()
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

`uref->usage_index` is not always being properly checked, causing
hiddev_ioctl_usage() to go out of bounds under some cases. Fix it.

Reported-by: syzbot+34ee1b45d88571c2fa8b@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=f2aebe90b8c56806b050a20b36f51ed6acabe802
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Change in v2:
    - Add the same check for the `HIDIOCGUSAGE` case. (Suggested by
      Dan Carpenter <dan.carpenter@oracle.com>)

 drivers/hid/usbhid/hiddev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/usbhid/hiddev.c b/drivers/hid/usbhid/hiddev.c
index 4140dea693e9..4f97e6c12059 100644
--- a/drivers/hid/usbhid/hiddev.c
+++ b/drivers/hid/usbhid/hiddev.c
@@ -519,12 +519,16 @@ static noinline int hiddev_ioctl_usage(struct hiddev *hiddev, unsigned int cmd,
 
 		switch (cmd) {
 		case HIDIOCGUSAGE:
+			if (uref->usage_index >= field->report_count)
+				goto inval;
 			uref->value = field->value[uref->usage_index];
 			if (copy_to_user(user_arg, uref, sizeof(*uref)))
 				goto fault;
 			goto goodreturn;
 
 		case HIDIOCSUSAGE:
+			if (uref->usage_index >= field->report_count)
+				goto inval;
 			field->value[uref->usage_index] = uref->value;
 			goto goodreturn;
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
