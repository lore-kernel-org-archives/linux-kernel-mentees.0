Return-Path: <SRS0=ZpoD=BI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00CBBC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jul 2020 11:53:22 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFFE42083E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jul 2020 11:53:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1akJVMB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFFE42083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 96CE285EC1;
	Wed, 29 Jul 2020 11:53:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I-yLqLRy2wtk; Wed, 29 Jul 2020 11:53:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 289F4859D2;
	Wed, 29 Jul 2020 11:53:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0EA85C0050;
	Wed, 29 Jul 2020 11:53:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20EDAC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 11:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0FDF688086
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 11:53:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EJuMLJq2kEJX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 11:53:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 444FB8808F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 11:53:19 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id r19so2181906qvw.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 04:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dbKVQJEsi5OmCf8gsZhOgLkAF5HCvO25GsJ5HLwdED8=;
 b=D1akJVMB2ic6FJCvXtcIzudguNqpnLRruyjPU8sZzd1/Da8Jj41grupYH1YBvyjZ8Z
 o79A5fLQK0YnmLT/SaG4/tbNPvD1Q1ZnnUyYtgC6S73UCjZWfQcRNCxgN87znrbnHRpZ
 rVQdTG5RTwa3ASIVKxl35FtEQcPvzIbuOy5Eb7i18wTqykLymIicaqWUzTIJgN3PPwYq
 u33/cU12qu8fH9CnJ4QWLs6gbmL21DYOzf+zTSr3I20Gv+zqw+H2rW+tuJddEPwdgAJ1
 o/fHLXOntqrV/8y/a7wy6JOhUgTH784T/g+QZkkL0iPtoqgTfdChi5a8QIPdCe6vO0Do
 rAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dbKVQJEsi5OmCf8gsZhOgLkAF5HCvO25GsJ5HLwdED8=;
 b=JFuVYKLGqlfuSvxN2ujvQFqC+7YaIw7ywJI50wyz/2CvI459UxE86nUlhv2lyR3xga
 jU+7zmB7ppbiUuEoxQ/zh4mX/5WjrP38EeEzcVTXfIoClAwLhX3j+F94FESdAlpDxLHq
 aWZSNDZhOeRKFAzhZkxatwnzzimFHKPOpTlClmpWECGRWM54IJlVWFQrOtAfRicLRqzM
 RPGyUyf2zft9ILA5IU3emaWAfcdh0bwTdB3tOdH1rUkXyGBmhWkKiuoMD4BucrmiZjp+
 DROoiUEziM4AqmSocOtz6VjnN9EnoYrf9vzKTYexrqWdaGXLeb6gyOsMPXoyJkbveVZH
 dn9w==
X-Gm-Message-State: AOAM530Y6r8CnwmM0brT0hyR7hxXiDhxLZPgr9oW6RiELXpGSKnFCg1q
 0dMz5Skm0XNH4EQfJgb/Ow==
X-Google-Smtp-Source: ABdhPJz66BNCjHBTDeXGIlu2MYFSm0jp9sVQTPG9hCtDssdlKFCd++Ii3AmkngoUIVJXrS+Dj+YasA==
X-Received: by 2002:a0c:e5cc:: with SMTP id u12mr32198398qvm.54.1596023598259; 
 Wed, 29 Jul 2020 04:53:18 -0700 (PDT)
Received: from localhost.localdomain (c-76-119-149-155.hsd1.ma.comcast.net.
 [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id o13sm1330478qko.48.2020.07.29.04.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 04:53:17 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Denis Efremov <efremov@linux.com>,
	Jens Axboe <axboe@kernel.dk>
Date: Wed, 29 Jul 2020 07:51:57 -0400
Message-Id: <20200729115157.8519-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200728141946.426245-1-yepeilin.cs@gmail.com>
References: <20200728141946.426245-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [Linux-kernel-mentees] [PATCH v2] block/floppy: Prevent
	kernel-infoleak in raw_cmd_copyout()
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

raw_cmd_copyout() is potentially copying uninitialized kernel stack memory
since it is initializing `cmd` by assignment, which may cause the compiler
to leave uninitialized holes in this structure. Fix it by using memcpy()
instead.

Cc: stable@vger.kernel.org
Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Change in v2:
    - Remove inappropriate "Fixes:" tag. (Suggested by: Denis Efremov
      <efremov@linux.com>)

Reference: https://lwn.net/Articles/417989/

$ pahole -C "floppy_raw_cmd" drivers/block/floppy.o
struct floppy_raw_cmd {
	unsigned int               flags;                /*     0     4 */

	/* XXX 4 bytes hole, try to pack */

	void *                     data;                 /*     8     8 */
	char *                     kernel_data;          /*    16     8 */
	struct floppy_raw_cmd *    next;                 /*    24     8 */
	long int                   length;               /*    32     8 */
	long int                   phys_length;          /*    40     8 */
	int                        buffer_length;        /*    48     4 */
	unsigned char              rate;                 /*    52     1 */
	unsigned char              cmd_count;            /*    53     1 */
	union {
		struct {
			unsigned char cmd[16];           /*    54    16 */
			/* --- cacheline 1 boundary (64 bytes) was 6 bytes ago --- */
			unsigned char reply_count;       /*    70     1 */
			unsigned char reply[16];         /*    71    16 */
		};                                       /*    54    33 */
		unsigned char      fullcmd[33];          /*    54    33 */
	};                                               /*    54    33 */

	/* XXX 1 byte hole, try to pack */

	/* --- cacheline 1 boundary (64 bytes) was 24 bytes ago --- */
	int                        track;                /*    88     4 */
	int                        resultcode;           /*    92     4 */
	int                        reserved1;            /*    96     4 */
	int                        reserved2;            /*   100     4 */

	/* size: 104, cachelines: 2, members: 14 */
	/* sum members: 99, holes: 2, sum holes: 5 */
	/* last cacheline: 40 bytes */
};

 drivers/block/floppy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index 09079aee8dc4..b8ea98f7a9cb 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -3126,7 +3126,9 @@ static int raw_cmd_copyout(int cmd, void __user *param,
 	int ret;
 
 	while (ptr) {
-		struct floppy_raw_cmd cmd = *ptr;
+		struct floppy_raw_cmd cmd;
+
+		memcpy(&cmd, ptr, sizeof(cmd));
 		cmd.next = NULL;
 		cmd.kernel_data = NULL;
 		ret = copy_to_user(param, &cmd, sizeof(cmd));
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
