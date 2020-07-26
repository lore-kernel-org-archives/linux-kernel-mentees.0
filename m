Return-Path: <SRS0=5Mz1=BF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A29C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 22:28:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF411206E3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 22:28:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DTjrlCc1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF411206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 93E27850D6;
	Sun, 26 Jul 2020 22:28:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zu320hiwjnhN; Sun, 26 Jul 2020 22:28:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 802C284E7C;
	Sun, 26 Jul 2020 22:28:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B94DC0050;
	Sun, 26 Jul 2020 22:28:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2F0E8C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 22:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EAC33882A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 22:28:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NqUyGGAwF6qR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 22:28:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0AB9E8829D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 22:28:27 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id d27so10899983qtg.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 15:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HNVE8+pAZSpeQxmP3tSg/BQyhP/rZ6/36SGQbiLTu10=;
 b=DTjrlCc1aaT47CyiCirs8x37QjuaaCyUvqYQxlAI4joQjoihgH45exIk7sFyfMNL5K
 Pw2+ArAw3sF1/iA8mfH0ZZcpeCLgvYtRgj1Qg5iy/kV9z58HvEEOwG6SK9/FKBc2UY0a
 IZid2Hl7q5oWdIRLcPYOVRDgjK+D/nAxozO0ZY4wpOb5HADvXU+4IcJEf1YkBVYjJhcu
 P+jYmCPpS3j62awxakOMD0egTjkVlMGObcj4JVgLuj/ON1JUThB3k4j0X2CsKALrdGxx
 usgwDcdVclIno51K0gUmkd6ExGj2ixZeE+Q3Z7o0XrCMpvLPgFlw4i0yHuOFIZXCp8Zg
 V8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HNVE8+pAZSpeQxmP3tSg/BQyhP/rZ6/36SGQbiLTu10=;
 b=koYgopejqAcHc2XcpinyEmKoqC8mo9g4BBrrFSv6kGuWsbswfbpbGBVc97yAd2ZISs
 yNefXGY4Y80MU4osq5+4AZpErO6VI2OmSQnAoXHlJKbuiOezMzylXxFZAjAbNhVCoOlK
 nQf3P26lPEoqIMlDMqE3ziZSxOE3GmPcydjliLH6tBydWDKDsJckIq8y+r9Y2rx033sI
 5pO0spLrbH3VwshV4TVGtUnZts1HFRcx+EXoyhqhL6j7SPdJSKp2WRM6/Gy1Avl9vnKL
 juZ4sRMDoLCWFz/yPSXiZw6K32hU9jEKra2MXtSxXiEMdIOe5QknMnRrQbsr77Mzuhs3
 9Q6A==
X-Gm-Message-State: AOAM531Y6kHn2yepT/MHXghTx1PFsEpR4C2XcFFdIYA+3uCydWrsxEYz
 FVqzuj9Juksu0Xgu35t4SQ==
X-Google-Smtp-Source: ABdhPJxDmohnMKBdybckNP/0ftXHuIYM6ruvF1XPpe7KtytStFqJzmZc2OAjVU394YJU+GUM5f4Epg==
X-Received: by 2002:ac8:794f:: with SMTP id r15mr10880075qtt.383.1595802506053; 
 Sun, 26 Jul 2020 15:28:26 -0700 (PDT)
Received: from localhost.localdomain ([209.94.141.207])
 by smtp.gmail.com with ESMTPSA id h16sm15592243qkg.8.2020.07.26.15.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 15:28:25 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Sun, 26 Jul 2020 18:27:03 -0400
Message-Id: <20200726222703.102701-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200726220557.102300-1-yepeilin.cs@gmail.com>
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Arnd Bergmann <arnd@arndb.de>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vandana BN <bnvandana@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 Ezequiel Garcia <ezequiel@collabora.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3] media/v4l2-core: Fix
	kernel-infoleak in video_put_user()
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

video_put_user() is copying uninitialized stack memory to userspace due
to the compiler not initializing holes in the structures declared on the
stack. Fix it by initializing `ev32` and `vb32` using memset().

Reported-and-tested-by: syzbot+79d751604cb6f29fbf59@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=79d751604cb6f29fbf59
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Change in v3:
    - Improve the commit description. (Suggested by Laurent Pinchart
      <laurent.pinchart@ideasonboard.com>)

Change in v2:
    - Do the same thing for `case VIDIOC_DQEVENT_TIME32`.

 drivers/media/v4l2-core/v4l2-ioctl.c | 50 +++++++++++++++-------------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index a556880f225a..e3a25ea913ac 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3189,14 +3189,16 @@ static int video_put_user(void __user *arg, void *parg, unsigned int cmd)
 #ifdef CONFIG_COMPAT_32BIT_TIME
 	case VIDIOC_DQEVENT_TIME32: {
 		struct v4l2_event *ev = parg;
-		struct v4l2_event_time32 ev32 = {
-			.type		= ev->type,
-			.pending	= ev->pending,
-			.sequence	= ev->sequence,
-			.timestamp.tv_sec  = ev->timestamp.tv_sec,
-			.timestamp.tv_nsec = ev->timestamp.tv_nsec,
-			.id		= ev->id,
-		};
+		struct v4l2_event_time32 ev32;
+
+		memset(&ev32, 0, sizeof(ev32));
+
+		ev32.type	= ev->type;
+		ev32.pending	= ev->pending;
+		ev32.sequence	= ev->sequence;
+		ev32.timestamp.tv_sec	= ev->timestamp.tv_sec;
+		ev32.timestamp.tv_nsec	= ev->timestamp.tv_nsec;
+		ev32.id		= ev->id;
 
 		memcpy(&ev32.u, &ev->u, sizeof(ev->u));
 		memcpy(&ev32.reserved, &ev->reserved, sizeof(ev->reserved));
@@ -3210,21 +3212,23 @@ static int video_put_user(void __user *arg, void *parg, unsigned int cmd)
 	case VIDIOC_DQBUF_TIME32:
 	case VIDIOC_PREPARE_BUF_TIME32: {
 		struct v4l2_buffer *vb = parg;
-		struct v4l2_buffer_time32 vb32 = {
-			.index		= vb->index,
-			.type		= vb->type,
-			.bytesused	= vb->bytesused,
-			.flags		= vb->flags,
-			.field		= vb->field,
-			.timestamp.tv_sec	= vb->timestamp.tv_sec,
-			.timestamp.tv_usec	= vb->timestamp.tv_usec,
-			.timecode	= vb->timecode,
-			.sequence	= vb->sequence,
-			.memory		= vb->memory,
-			.m.userptr	= vb->m.userptr,
-			.length		= vb->length,
-			.request_fd	= vb->request_fd,
-		};
+		struct v4l2_buffer_time32 vb32;
+
+		memset(&vb32, 0, sizeof(vb32));
+
+		vb32.index	= vb->index;
+		vb32.type	= vb->type;
+		vb32.bytesused	= vb->bytesused;
+		vb32.flags	= vb->flags;
+		vb32.field	= vb->field;
+		vb32.timestamp.tv_sec	= vb->timestamp.tv_sec;
+		vb32.timestamp.tv_usec	= vb->timestamp.tv_usec;
+		vb32.timecode	= vb->timecode;
+		vb32.sequence	= vb->sequence;
+		vb32.memory	= vb->memory;
+		vb32.m.userptr	= vb->m.userptr;
+		vb32.length	= vb->length;
+		vb32.request_fd	= vb->request_fd;
 
 		if (copy_to_user(arg, &vb32, sizeof(vb32)))
 			return -EFAULT;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
