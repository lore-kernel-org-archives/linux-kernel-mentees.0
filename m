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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3241C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 22:08:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9685A2065F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 22:08:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s3rUecFp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9685A2065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 64E2B87EF9;
	Sun, 26 Jul 2020 22:08:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XUFqOVo7+Oii; Sun, 26 Jul 2020 22:08:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DBFF487EDE;
	Sun, 26 Jul 2020 22:08:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BBC1DC004F;
	Sun, 26 Jul 2020 22:08:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C90DC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 22:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EADA585F43
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 22:08:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rH2Dfwt6vhwg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 22:08:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4085E85E98
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 22:08:11 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id s16so10882634qtn.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 15:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+IzmjsuAtBmpLPphNE+utP0izhzv97da99bo9QPRTa8=;
 b=s3rUecFptAUZaHB3Xk+eloq3DPiKZHLpXt+olhKQJ7TAmIcaIjh7cVY+JTy5N2Fvu0
 /HxuTGCJ/tAC+1eOawjIKV6SFsoN5j007Kn1m6ENLuetD/PX+2sn4isHYGSnA/U/XFmZ
 +6AW71YqE8aMeDRaDoAr/mumK6omYAwIuL4uIPc2a5uFg/oppGXZnMkTnwyNgxeszCkx
 F8EYzKZldSs3Svnp1YIyDslppkXb1c0vpFCy2V9tjACfQjDRr/NJh0kYzvy3k3vOOX69
 mSxDi9j9sJ8vSpdrz9lpRy6dVJG663W4TAKMU63NNiPdcTDvPOWnijKwk2vRSfW7ndaG
 gS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+IzmjsuAtBmpLPphNE+utP0izhzv97da99bo9QPRTa8=;
 b=JJJ7oir6eiovHdMFzdUiSykbUQ+WNW5uSK1hFYeOBjPthilg765B/TFp2xrxwSbELh
 6pE/Clttm487gLbxNszetA1zKJksNeVfAb3vVa0a1BMP6YT4vtXWvdMYpHUp3n3lEKv8
 OJPbBKulFG1lH99bhwND59gqmg4d9+ZW3I+pNb8iH+CRCE/TQgBADuIFEItY3WrPkNA9
 6gO/jM2SgnhgpK3vgV85Blzy1cYaSwvmuSWx+NWC1FWtQ+tnj1p5XEgxup3NjpAJ22tK
 34asrWFbTHlptCMlTkT8So+0ZbKoN+ZNJ6wxz1oHE7kXMqLeSmra/cHyThw0DRukcLsz
 CmUw==
X-Gm-Message-State: AOAM531gLbZOe21ef1kep51Lx2pA7aFoA8AVi8XwVU+VQFLshnIDyh0c
 frgnnUO99DDOa7FNyHjKhg==
X-Google-Smtp-Source: ABdhPJz8DyBX5pU/BKClttIdS9+l98ZmJ8tCV+3vvPNBY2m8csw8hH0dVNUVIYI0H17hh3eUpyytyw==
X-Received: by 2002:ac8:6992:: with SMTP id o18mr9704010qtq.277.1595801290142; 
 Sun, 26 Jul 2020 15:08:10 -0700 (PDT)
Received: from localhost.localdomain ([209.94.141.207])
 by smtp.gmail.com with ESMTPSA id f31sm9561215qte.35.2020.07.26.15.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 15:08:09 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Sun, 26 Jul 2020 18:05:57 -0400
Message-Id: <20200726220557.102300-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200726164439.48973-1-yepeilin.cs@gmail.com>
References: <20200726164439.48973-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Arnd Bergmann <arnd@arndb.de>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vandana BN <bnvandana@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 Ezequiel Garcia <ezequiel@collabora.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2] media/v4l2-core: Fix
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

video_put_user() is copying uninitialized stack memory to userspace. Fix
it by initializing `ev32` and `vb32` using memset().

Reported-and-tested-by: syzbot+79d751604cb6f29fbf59@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=79d751604cb6f29fbf59
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
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
