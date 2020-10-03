Return-Path: <SRS0=1t5V=DK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D74C4727D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 20:33:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 967E3206C1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 20:33:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bp+Of4EY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 967E3206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 212E5854F7;
	Sat,  3 Oct 2020 20:33:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G_yIy0VrTfPR; Sat,  3 Oct 2020 20:33:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8F80F8531D;
	Sat,  3 Oct 2020 20:33:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 81A02C016F;
	Sat,  3 Oct 2020 20:33:24 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66F55C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 20:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 44B5E87171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 20:33:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZhCAjEny2A6X
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 20:33:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E5E77870A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 20:33:21 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id g10so630448pfc.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 03 Oct 2020 13:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WfQ+i+BxpbFQx3pen9QNH4hEFsBqsYjP8pLH9bs7mUw=;
 b=Bp+Of4EY8R7dq7agpxR3FH4RsGGGxOLR03sus0ezi4ewM034U1nkstuEpOVj0UVGK7
 6hxitcMpw5mM+Yfm8QmRVvQ2ih44rqmY7tM0a6O5kH6rq+4O1ht4+zHbFtpLfeX4qIeA
 z5vZtQkroTAmaYAlJrWPNNCQuQR73BWwS7ffYvVO56oo/BuBFW9sjwynLoi1Bnt9C8/c
 M3Eb1noqWQ62M6d528zW9GFdYwqdc6mqIJV7ckGNpVZiBzkHM6Wbh7v1xN8bN67c192N
 3ds6niFo6VLc2jzfdQIqD+25jngBKhwtdPKRacTKVKcJyxWfX3Di23WJERmL75EPPTFQ
 togA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WfQ+i+BxpbFQx3pen9QNH4hEFsBqsYjP8pLH9bs7mUw=;
 b=f8l7Kgy6I7GFvTzcRHxylBC5pDeh2+j5WvbSyDOLoN3LWz0DBYDC2JNFbo+y2spjjV
 XeTW0CaoLu2udsdqo+wIMFNB1aey4yRcRYtnwkEhPgx1XoxtYQ50nJdyfq6JtyCY6bSC
 JR0AnOsGeS1xA16G8P5iM9Pb0BYLOXgTEfhJV+8Aub/dazp2pXVaONe/hRY/EiRdDOt8
 fYjTU79bU7FF8Qt2ncaIeqI+ikRQsf5EG/XCdvRSAS4n/CLpDwQsIr8/ymVT8z8aXiZV
 np8GbaFSzWGQOSOB/20oyLCr5DN2y6TC1xd2e4oH/8jx76K3SHcgfLPUom8yMPVtVxsV
 oAQQ==
X-Gm-Message-State: AOAM532iuDLT47HtkHuTc+lL+vECjRj5NkZL1CysFDUGDYY3qQ0uHVKO
 kLsDyMQGoO0od57h+DUR0LQ=
X-Google-Smtp-Source: ABdhPJzHEcb0FuV1DCvKntiRgzf3Bf7lfi0p9EM/K5/fze9qprL346jRWeiUX+qn8g9puKzep7Jqag==
X-Received: by 2002:a62:3001:0:b029:142:2501:39e3 with SMTP id
 w1-20020a6230010000b0290142250139e3mr8528343pfw.50.1601757201024; 
 Sat, 03 Oct 2020 13:33:21 -0700 (PDT)
Received: from localhost.localdomain ([45.118.167.204])
 by smtp.googlemail.com with ESMTPSA id v22sm5339736pff.159.2020.10.03.13.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2020 13:33:20 -0700 (PDT)
From: Anmol Karn <anmol.karan123@gmail.com>
To: dwmw2@infradead.org, richard@nod.at, viro@zeniv.linux.org.uk,
 sandeen@sandeen.net, dhowells@redhat.com
Date: Sun,  4 Oct 2020 02:03:10 +0530
Message-Id: <20201003203310.494524-1-anmol.karan123@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: syzbot+9765367bb86a19d38732@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] fs: jffs2: super: Fix null pointer
	dereference in jffs2_parse_param()
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

mtd is getting NULL dereferenced in jffs2_parse_param(), while checking condition
for pool size when, case: opt is Opt_rp_size hits.

- fs/jffs2/super.c
The bug seems to get triggered in this line:

if (opt > c->mtd->size)
	return invalf(fc, "jffs2: Too large reserve pool specified, max is %llu KB",
				      c->mtd->size / 1024);


Fix this by adding a NULL check for 'c->mtd' device and return invalf(); which wraps 
errorf() and returns -EINVAL for convenience, which allows userspace to collect them 
directly.

Reported-and-tested-by: syzbot+9765367bb86a19d38732@syzkaller.appspotmail.com 
Link: https://syzkaller.appspot.com/bug?extid=9765367bb86a19d38732 
Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
---
 fs/jffs2/super.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 05d7878dfad1..f4ce67ac8486 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -203,6 +203,10 @@ static int jffs2_parse_param(struct fs_context *fc, struct fs_parameter *param)
 		if (result.uint_32 > UINT_MAX / 1024)
 			return invalf(fc, "jffs2: rp_size unrepresentable");
 		opt = result.uint_32 * 1024;
+
+		if (!c->mtd)
+			return invalf(fc, "jffs2: mtd device is NULL");
+
 		if (opt > c->mtd->size)
 			return invalf(fc, "jffs2: Too large reserve pool specified, max is %llu KB",
 				      c->mtd->size / 1024);
-- 
2.28.0
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
