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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 548F4C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 19:02:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18AC42074F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 19:02:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIpehUOt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18AC42074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D98BC85D11;
	Mon, 27 Jul 2020 19:02:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bAs57VjzLEOg; Mon, 27 Jul 2020 19:02:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6DEB685D56;
	Mon, 27 Jul 2020 19:02:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6733BC004F;
	Mon, 27 Jul 2020 19:02:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1CBEFC004F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 19:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 172C285D56
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 19:02:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OdjYHyEPe4Kj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 19:02:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6D49185D11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 19:02:09 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id j10so1313725qvo.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 12:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uPEUCGwUhu6gC7effbwPg+v6omwHm9FSYu/MnszzrTw=;
 b=CIpehUOt0pFLGtZUceSvBaC7bKoxZRO5SIVUlQxu72u1BpL2T7RsEqJZkmlZgbQlNI
 ytkyQCLn2n1RnVX+H6GtBKDp9qt8SAvZpm+2KnCzJD1HwCKKDqzR1jYaRyopVDaNCv9s
 wXE2QZvRW2KliOdYmLGCiSjgteZdqeX6yWfWIceG+rdnBhUECimGxWr4I/vf0lIeubN/
 092IvLfWVygDK6Uzi4Fjb4JPPrGBf2Lz5twZNdFtfUgwfT6lg5vUcDV/tD0uGvNIFGg4
 QX4TrAF1mhaZZhLCC0oWLJOgeYHHZOlxlDWwZ4ztcNmURs54knHDYuGFLPELdHHT9TCB
 /K1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uPEUCGwUhu6gC7effbwPg+v6omwHm9FSYu/MnszzrTw=;
 b=tFtfOCMBG8ra+kauKOjG0l8V2rs62j/NMtk90tLY52NvF906R5P1Hh1O/mNRhUHX/m
 65bmwAfGOFHIyweTGMWvWPszkcR4zMIss/dH1OC591Qjk9EtbL1Nurq2a7NjhULaivI1
 4yc7aWOHboEGTEOdZlBXvBChok4JJ7sxnvyf30ZOG+h+HaDttHS8Cl4WS10IpJ4H1Jt1
 E6QUbBBo9F3cpzBsITy12zzLlyTcRNvz/4SAx4cyJO22vUi+UQRe8Lx6y5hhyKHrd2nk
 tPvxLBeZqW6ImKSwz0QGTFDp9a5/HodgGrYbPzNansRXPuuI8EetSrQT7Yja7O5GHgq6
 v4AQ==
X-Gm-Message-State: AOAM530CklrPrMMDZhFm1Yu0bHItypbrWugjN/5KGDSU8KHrZneMG0Dw
 etzYbKz5RhOQwQm57ToClw==
X-Google-Smtp-Source: ABdhPJxl55vKVbiqhnwds/IIJ1yz9AlsuPAU+JHNpS/sdbZCaQOhnqlEjfFyhJfVgvLP1VrKW1oURQ==
X-Received: by 2002:ad4:4ead:: with SMTP id ed13mr8757280qvb.161.1595876528455; 
 Mon, 27 Jul 2020 12:02:08 -0700 (PDT)
Received: from localhost.localdomain ([209.94.141.207])
 by smtp.gmail.com with ESMTPSA id 6sm18964139qkj.134.2020.07.27.12.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 12:02:07 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 27 Jul 2020 15:00:13 -0400
Message-Id: <20200727190013.324812-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200727161932.322955-1-yepeilin.cs@gmail.com>
References: <20200727161932.322955-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [Linux-kernel-mentees] [PATCH v2] block/scsi-ioctl: Prevent
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
allocated structures. Fix it by adding a padding field to `struct
compat_cdrom_generic_command`.

Cc: stable@vger.kernel.org
Fixes: f3ee6e63a9df ("compat_ioctl: move CDROM_SEND_PACKET handling into scsi")
Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Change in v2:
    - Add a padding field to `struct compat_cdrom_generic_command`,
      instead of doing memset() on `cgc32`. (Suggested by Jens Axboe
      <axboe@kernel.dk>)

 block/scsi_ioctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/scsi_ioctl.c b/block/scsi_ioctl.c
index ef722f04f88a..72108404718f 100644
--- a/block/scsi_ioctl.c
+++ b/block/scsi_ioctl.c
@@ -651,6 +651,7 @@ struct compat_cdrom_generic_command {
 	compat_int_t	stat;
 	compat_caddr_t	sense;
 	unsigned char	data_direction;
+	unsigned char	pad[3];
 	compat_int_t	quiet;
 	compat_int_t	timeout;
 	compat_caddr_t	reserved[1];
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
