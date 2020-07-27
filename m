Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0817AC433E8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 16:21:05 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C340C20719
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 16:21:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="juLbmz0+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C340C20719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8125721FA8;
	Mon, 27 Jul 2020 16:21:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4k2kUt0FWj-7; Mon, 27 Jul 2020 16:21:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 43D32204AB;
	Mon, 27 Jul 2020 16:21:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E137C004F;
	Mon, 27 Jul 2020 16:21:02 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5ED78C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 16:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4C499882A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 16:21:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ICNdOo-62bkU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 16:21:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A6F0A882A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 16:21:00 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id h7so15754142qkk.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 09:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aSoHQvLtd5ehDIvkD8A1Zun/yggItMDxrrpLUadcTAw=;
 b=juLbmz0+JADoY8hY7mPFfnPgqKsiLXa0/ZgsIsQPxwvBK+1zwoDSgnIwXFJhYAR+gC
 DJHq2rzYTmyPErBh5QLZHYnbsZpKTjOogHny+MBb3CWI982UcI2cTMaYevepp+WCpbwX
 bbAzsBezBxuV4ay8eJK8XSkYU8EHHTI4hAdStJF8ke/Zl75p5VXt0/uIfeltJCK+1PvZ
 f2rv+5YAtO+RdeduZ7zZASG2RVdhv1kO4ZJFOmBQzOinPd15qZz+mW/p/SJjkd1R7cJO
 buFIg6mybDExlZ2tynfPs7QG33RdRIEFrs3ZQzsV5mOJ8lP4u9OhypU8LVxSduhBipAC
 YFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aSoHQvLtd5ehDIvkD8A1Zun/yggItMDxrrpLUadcTAw=;
 b=jDE+B8OcMhvGMfBNcLuK7Hi6rxIxt32ejVio9f6SORCezI2/yHfviCA9CQA98rozAS
 AyKhjDb+3bY13mDYWcqR2Tt0y6sHuhfQPAf16HO8ltvI2SsTsgoqRCQZqASTRd8Zz4Fd
 FidNXtvEFhK+XmjkrvUe3qotaqonJ5QRQPcXzc6el9xagsy6euZPs+W7ED54zB0TpSCg
 5gbUj8vLD7qXvfxzfcXF8NHL8Z/nzK4My/SZ8unf1GlMjt0HXBb+H3/kvqgsaQ3fzMSu
 SqCkONtgcKfPZ4HZAfy5TDg07Cpo7iidKuKRb3Zrra+Q/6T+SBRPOchEBggB2aHbITRA
 M4pQ==
X-Gm-Message-State: AOAM531xecN5NlPBDgDXk5HoEUyT7kC2NUYKc2nVFQ0/R25HvXtY0dhM
 vwyHJn/paD6CnS2DECeuug==
X-Google-Smtp-Source: ABdhPJymMFQ2ThC0j3BgCcKt/GLFsB37J7SQMX+TN/oVIkqpTBpZ57IPOEMMqcpXXWsqB/0S9Ax25g==
X-Received: by 2002:a37:ad0a:: with SMTP id f10mr16945474qkm.154.1595866859791; 
 Mon, 27 Jul 2020 09:20:59 -0700 (PDT)
Received: from localhost.localdomain ([209.94.141.207])
 by smtp.gmail.com with ESMTPSA id b186sm19081811qkd.28.2020.07.27.09.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 09:20:59 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 27 Jul 2020 12:19:32 -0400
Message-Id: <20200727161932.322955-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [Linux-kernel-mentees] [PATCH] block/scsi-ioctl: Prevent
	kernel-infoleak in scsi_put_cdrom_generic_arg()
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

scsi_put_cdrom_generic_arg() is copying uninitialized stack memory to
userspace due to the compiler not initializing holes in statically
allocated structures. Fix it by initializing `cgc32` using memset().

Cc: stable@vger.kernel.org
Fixes: f3ee6e63a9df ("compat_ioctl: move CDROM_SEND_PACKET handling into scsi")
Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 block/scsi_ioctl.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/block/scsi_ioctl.c b/block/scsi_ioctl.c
index ef722f04f88a..1b7f85634751 100644
--- a/block/scsi_ioctl.c
+++ b/block/scsi_ioctl.c
@@ -692,16 +692,19 @@ static int scsi_put_cdrom_generic_arg(const struct cdrom_generic_command *cgc,
 {
 #ifdef CONFIG_COMPAT
 	if (in_compat_syscall()) {
-		struct compat_cdrom_generic_command cgc32 = {
-			.buffer		= (uintptr_t)(cgc->buffer),
-			.buflen		= cgc->buflen,
-			.stat		= cgc->stat,
-			.sense		= (uintptr_t)(cgc->sense),
-			.data_direction	= cgc->data_direction,
-			.quiet		= cgc->quiet,
-			.timeout	= cgc->timeout,
-			.reserved[0]	= (uintptr_t)(cgc->reserved[0]),
-		};
+		struct compat_cdrom_generic_command cgc32;
+
+		memset(&cgc32, 0, sizeof(cgc32));
+
+		cgc32.buffer	= (uintptr_t)(cgc->buffer);
+		cgc32.buflen	= cgc->buflen;
+		cgc32.stat	= cgc->stat;
+		cgc32.sense	= (uintptr_t)(cgc->sense);
+		cgc32.data_direction	= cgc->data_direction;
+		cgc32.quiet	= cgc->quiet;
+		cgc32.timeout	= cgc->timeout;
+		cgc32.reserved[0]	= (uintptr_t)(cgc->reserved[0]);
+
 		memcpy(&cgc32.cmd, &cgc->cmd, CDROM_PACKET_SIZE);
 
 		if (copy_to_user(arg, &cgc32, sizeof(cgc32)))
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
