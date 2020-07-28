Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB28C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 14:21:33 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1977E20663
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 14:21:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOMKIQEp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1977E20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C6F2422713;
	Tue, 28 Jul 2020 14:21:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J48ESLaUyCFG; Tue, 28 Jul 2020 14:21:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1E19D2269B;
	Tue, 28 Jul 2020 14:21:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02F77C0050;
	Tue, 28 Jul 2020 14:21:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0387FC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 14:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E0657885BD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 14:21:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k6Hvouz5YlSH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 14:21:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3D42B88292
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 14:21:28 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id t23so11800979qto.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 07:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0a7riHkmcNZX+GUojwCDuOWs6tGpRZUtzm7Jn91Fp0E=;
 b=aOMKIQEpNlogZ8jiHhzLA/GEKWEn/zHsQjaZvchq/hUuV4/z9G7PYgam7xaPvK+XbC
 +KZJHQ4LQ4Tgx6xDo3Fv31PeriH5Tmo651RamNk/C2F8C7A5PdTDOmnX41aMFCJNhhja
 +KYI6gi38WMbm+HfI9xlHgB7F3MwUBAWDnLK8I5RFngm+BkcO6FCR8ZSgv1jUucUGoPz
 9qz1IY2fipMOicd6bOlYRGokwL8gAQwLcprzyRp9p4ysvGuEoPBbmBLrc+N9m+mxTN50
 2UZOGYCyhqw7eoUQOutmM6w2src1ou6n87VjBVorI7Z3i/kiJm3bR5kZdF2mgRulmCsz
 qyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0a7riHkmcNZX+GUojwCDuOWs6tGpRZUtzm7Jn91Fp0E=;
 b=DqV8XL6+1+7ztBPF1bjKUtb+QDd4IgPlkuRGKp07M+7VRTIxgnd+Q03E3md6uY4zsA
 +hdSovW3MiF5ItzqDzB4VJrjK6dddqYVMPghRF/8FT4R2lunByGcnTnOFP1X7NPc65ry
 Inij4GryGQIjPdVwFPdlN8BmGk7rTRsh66yIBMulOmYoiFUTwBp2bSBIadQAM8cT+oTg
 nkwdELkgdH6Ni9FUatXB3ZpFYQpxrV1WfyBWqEIFfxNQ5+K8gWjusPsBE6j5yJspa6F5
 AJh22nsxHul6NS1BC0TeaANimXJjhY971frDiapDiBNJP9qkDZEySabNl/AjUx9OQKMI
 Fz3Q==
X-Gm-Message-State: AOAM5334j92JJz1Kh5sV5AzQf0biPRxozqNklc2IpqlBKcEVxPS8h7i7
 92/uA8i6p0CMSUFZ2L2mFg==
X-Google-Smtp-Source: ABdhPJzzeiRIQxSjsjqXZ9i0X7fm6CZjBthtL+HGvt4+uWmVX+wcM3G8gwQYvj+9df1rB/Ghk+yOcA==
X-Received: by 2002:ac8:65d3:: with SMTP id t19mr27140594qto.193.1595946087337; 
 Tue, 28 Jul 2020 07:21:27 -0700 (PDT)
Received: from localhost.localdomain (c-76-119-149-155.hsd1.ma.comcast.net.
 [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id 6sm22142009qkj.134.2020.07.28.07.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 07:21:26 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Denis Efremov <efremov@linux.com>,
	Jens Axboe <axboe@kernel.dk>
Date: Tue, 28 Jul 2020 10:19:46 -0400
Message-Id: <20200728141946.426245-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [Linux-kernel-mentees] [PATCH] block/floppy: Prevent
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
Fixes: 2145e15e0557 ("floppy: don't write kernel-only members to FDRAWCMD ioctl output")
Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
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
