Return-Path: <SRS0=/4fU=DJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF3BC4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Oct 2020 14:23:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74054206DB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Oct 2020 14:23:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQgyxL8N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74054206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4FF3C87390;
	Fri,  2 Oct 2020 14:23:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n4RC1-axpNEU; Fri,  2 Oct 2020 14:23:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 918E7872EC;
	Fri,  2 Oct 2020 14:23:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7AD08C016F;
	Fri,  2 Oct 2020 14:23:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1A0E1C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 14:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 082F2274DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 14:23:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YJM+zBsKeDJs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 14:23:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 1E3A5204DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 14:23:34 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 34so853304pgo.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 02 Oct 2020 07:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OjNQvI2ijIO/M2pfT2smqs+ynvGtDPzeT8cJRRsXgHA=;
 b=XQgyxL8NJ6EiknRfuDKYULLI52Ibs2uLUiO6B6vlyBB+ov5yWWDoKMk1wvbfEhqziB
 cjY7Yv6hyXrGj9EbqxQM8bFCRQ9UHhuFuwQc/WDIhQOMElOsiUaKfVpK+H1J5GxIfhQJ
 W01i0uNznz0D96s0WOyNlnAOtHl+U70MpfaFFdpO34u6TwH8lqtpMIhbeUE8dYltT57i
 UwLjaFz6nTl0SQ4fA8bu7nP9GxRHbraFpFtm+ZjcabA5R6IIYcSqU3V7QZ9XmXEDt1gC
 9zUp0/D4n7NwevTNapoSi57vEk8Ms6o3lws3V3eSl1IWMy+VYhziNL6MALzJyNzKasFK
 9aMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OjNQvI2ijIO/M2pfT2smqs+ynvGtDPzeT8cJRRsXgHA=;
 b=rsiahIJVaHbQyE8Fjt9PTbwdMLu9xlvZ5RlDoBog/k3Q+h/nI1lxaehgZYPMK4vrln
 OzG5CRTfj/pLh9rkLeDJmfQDYhiYfdAZESlFFWYeDGwo0mCkzbRU0HeOR/n4WhRcS2EL
 +ny2w+LLr2yZ7zGLUgqGXoCcXtNFhJclMtsFaDPzvR8rfx+oWBF69tLl6DsQoMfiPn+P
 rxAZ0XboVA8/Bzny3ErggNRFO8u1UKqsoDJVccuOb3ZvvEps5SiKepJwOvsiUrhWADs9
 c3cXz3TN8+ttNYpaCQ6S+AHS+9uJJTbaZaRaxIURqytKCRCgtZfkABMM9NVZEMgzASSp
 r9Tw==
X-Gm-Message-State: AOAM530acHO+abaFFzvbngLKAvbIHkgbFvSQ25V0NwUlnmj3J/HieEiM
 usSAgJm/P/JkJKlHQ0nQ7A==
X-Google-Smtp-Source: ABdhPJxV0D5CAPrY5aLgnnIaonU6JK0L9yfh1hftGF3Vuyfk6tWfcImIpm0lhbKAf6hbESmEjhP2Zw==
X-Received: by 2002:aa7:8d15:0:b029:142:2501:39fe with SMTP id
 j21-20020aa78d150000b0290142250139femr2979520pfe.77.1601648613591; 
 Fri, 02 Oct 2020 07:23:33 -0700 (PDT)
Received: from localhost.localdomain ([161.117.41.183])
 by smtp.gmail.com with ESMTPSA id gi20sm1786628pjb.28.2020.10.02.07.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 07:23:32 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
 syzbot <syzbot+85433a479a646a064ab3@syzkaller.appspotmail.com>
Date: Fri,  2 Oct 2020 10:22:23 -0400
Message-Id: <20201002142223.9482-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <000000000000a24fa705ae29dc6c@google.com>
References: <000000000000a24fa705ae29dc6c@google.com>
MIME-Version: 1.0
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, glider@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [Linux-kernel-mentees] [PATCH v4] block/scsi-ioctl: Fix
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
userspace, since the compiler may leave a 3-byte hole in the middle of
`cgc32`. Fix it by adding a padding field to `struct
compat_cdrom_generic_command`.

Cc: stable@vger.kernel.org
Fixes: f3ee6e63a9df ("compat_ioctl: move CDROM_SEND_PACKET handling into scsi")
Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Reported-by: syzbot+85433a479a646a064ab3@syzkaller.appspotmail.com
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
v3: https://lore.kernel.org/lkml/20200909095057.1214104-1-yepeilin.cs@gmail.com/

Changes in v4:
    - Change "Prevent" in the title to "Fix", and improve the commit
      message, since syzbot has reported it as a "real" bug.
    - Add syzbot Reported-by: tag.

Changes in v3:
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
