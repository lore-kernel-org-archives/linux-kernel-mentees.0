Return-Path: <SRS0=P4BV=CS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5143C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 09:51:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3082E21D79
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 09:51:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUS5XxD2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3082E21D79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CB9242E173;
	Wed,  9 Sep 2020 09:51:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZKAlZedgnnag; Wed,  9 Sep 2020 09:51:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C065B23265;
	Wed,  9 Sep 2020 09:51:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A348CC0859;
	Wed,  9 Sep 2020 09:51:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37B53C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 09:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 20518861E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 09:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U9ylR1GkillA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 09:51:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 61EF48618C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 09:51:37 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id z19so1681676pfn.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Sep 2020 02:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/9l1F2fFs2dFU7DfJaEfmDwpck1jBFfm2qL4yv6i45A=;
 b=gUS5XxD26ZqiyNIqxlgKKs1/c7QFsxEH6CoGq9vg+43Xi818ir8GnGC14nZcyjs5N9
 4YcZE76uvR0x9I4oMz3/jNgpmRz5m2wGQFnCirGqSnqJWTnz6vpHB/YEVsy8goMTLypT
 xtW4iTa5CSFWxHkDaDSG64BAAuqK5NRqH1Hd1VoH3bS6nNctyiIF9PN9HdzqaHfaaZ6E
 sYfLQHR73Sh/urkiEgZwViqIc2rZF4Fxzcoh6Af/+b4pyOsvHbTBod2os3UrDWAJlbjo
 yVvZVkkThHDFIMCLvSqPYE6B7xCkPY5fD7VmtkLcfpt+EoiO4K+uUp+TVKVEFbg5WS57
 7wKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/9l1F2fFs2dFU7DfJaEfmDwpck1jBFfm2qL4yv6i45A=;
 b=D38NTghWTk9A4O5WEzM+BHf2C53COPe0EQk/yaXJ5R2sx/nrL9UMGRAYuDk65d0I2d
 oXXIya61A1udQpbDWtgxRx38qLrQtzql/5EspHzRSZoY5HoKBOECPBhf/rtdMC1Mn/Ho
 +G9BxuG6BsR0FRNKtO/GBI0tF50TZz6JsjPa2jJ7k5pMQ2UubTctxbm37tQunbtS16uA
 zhF3LyP3zrNbgS832VZTVb5CHaCL589zAKzlETYXhuDytjWI9mOA85DDKNqZ8BccDKyy
 PKVFX/WWSVfwlP0Au4jW1GHbB24QFWUsVNoVq2JgGF+YfdTIjSYSkNDnAMuP8Z5BETfb
 gLhA==
X-Gm-Message-State: AOAM532fD5QajA6kAUDr8iNRKOzZw0loWvMOR5EzhX/SDFdFEJpYHeX2
 MOcdfcTqcoyzu/PoMVNkbQ==
X-Google-Smtp-Source: ABdhPJxPvdD+1JahpDgWNitQ/DG2DsQjU5/g4ZEcoeE50l/NWqFVWK6cL3krfXar1a6p6baMtWmGGw==
X-Received: by 2002:a63:d449:: with SMTP id i9mr18251pgj.83.1599645096850;
 Wed, 09 Sep 2020 02:51:36 -0700 (PDT)
Received: from localhost.localdomain (n11212042027.netvigator.com.
 [112.120.42.27])
 by smtp.gmail.com with ESMTPSA id 25sm1603638pjh.57.2020.09.09.02.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 02:51:36 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  9 Sep 2020 05:50:57 -0400
Message-Id: <20200909095057.1214104-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200727190013.324812-1-yepeilin.cs@gmail.com>
References: <20200727190013.324812-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [Linux-kernel-mentees] [PATCH v3] block/scsi-ioctl: Prevent
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

scsi_put_cdrom_generic_arg() is potentially copying uninitialized stack
memory to userspace, since the compiler may leave a 3-byte hole in the
middle of `cgc32`. Prevent it by adding a padding field to `struct
compat_cdrom_generic_command`.

Cc: stable@vger.kernel.org
Fixes: f3ee6e63a9df ("compat_ioctl: move CDROM_SEND_PACKET handling into scsi")
Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Change in v3:
    - Improve commit message. scsi_put_cdrom_generic_arg() does not
      *always* leak kernel information. It is compiler dependent.
      Reference: https://www.nccgroup.com/us/about-us/newsroom-and-events/blog/2019/october/padding-the-struct-how-a-compiler-optimization-can-disclose-stack-memory/
    - Base the patch against mainline 5.9-rc4.

Change in v2:
    - Add a padding field to `struct compat_cdrom_generic_command`,
      instead of doing memset() on `cgc32`. (Suggested by Jens Axboe
      <axboe@kernel.dk>)

$ # before
$ pahole -C "compat_cdrom_generic_command" !$
pahole -C "compat_cdrom_generic_command" block/scsi_ioctl.o
struct compat_cdrom_generic_command {
	unsigned char              cmd[12];              /*     0    12 */
	compat_caddr_t             buffer;               /*    12     4 */
	compat_uint_t              buflen;               /*    16     4 */
	compat_int_t               stat;                 /*    20     4 */
	compat_caddr_t             sense;                /*    24     4 */
	unsigned char              data_direction;       /*    28     1 */

	/* XXX 3 bytes hole, try to pack */

	compat_int_t               quiet;                /*    32     4 */
	compat_int_t               timeout;              /*    36     4 */
	compat_caddr_t             reserved[1];          /*    40     4 */

	/* size: 44, cachelines: 1, members: 9 */
	/* sum members: 41, holes: 1, sum holes: 3 */
	/* last cacheline: 44 bytes */
};
$ # after
$ pahole -C "compat_cdrom_generic_command" block/scsi_ioctl.o
struct compat_cdrom_generic_command {
	unsigned char              cmd[12];              /*     0    12 */
	compat_caddr_t             buffer;               /*    12     4 */
	compat_uint_t              buflen;               /*    16     4 */
	compat_int_t               stat;                 /*    20     4 */
	compat_caddr_t             sense;                /*    24     4 */
	unsigned char              data_direction;       /*    28     1 */
	unsigned char              pad[3];               /*    29     3 */
	compat_int_t               quiet;                /*    32     4 */
	compat_int_t               timeout;              /*    36     4 */
	compat_caddr_t             reserved[1];          /*    40     4 */

	/* size: 44, cachelines: 1, members: 10 */
	/* last cacheline: 44 bytes */
};
$ _

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
