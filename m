Return-Path: <SRS0=w6iK=37=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69C3C3B186
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:40:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBBF420842
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:40:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TvOwTmvq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBBF420842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 869F4845C5;
	Tue, 11 Feb 2020 12:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0qGEUAfLLasK; Tue, 11 Feb 2020 12:40:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 35A5084537;
	Tue, 11 Feb 2020 12:40:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2F0CBC1D88;
	Tue, 11 Feb 2020 12:40:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7B7FC07FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C620C2033E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:40:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c8N3BK3diyJu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:40:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 3B8142000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:40:41 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 185so5459922pfv.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 04:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=GzaIYHmp0DpzcpK5c+5ytTVOgykyH6stYDC5nQl47N0=;
 b=TvOwTmvq6ZwRLexOEuq45X/b6mM2l9dp9PZ9ZZhsWn9v2Xlo0k57dh+4VVeGRZwvb1
 hlW/hM/fCcC4AxyByaas+IVnO2es4C6RDs+vvqXEfUiJDCxzkQOSBit+K3h84XiZnyLd
 LT2vmxb3yaQsifjIRO5cHUQNoYJ2bOflDqXT5pNZmGeMl1Gu86ztusSyeF6BSNuTJUYf
 Uaml7Jz1ijw8AWFKEUfynnggQKAvRaVjxOb54JuopFBg/KTWvisuVMm0LSc9CxgJBOjl
 jhEXiRw4J2K7pUO0+YkBMFoxc7Kq9cn2A8MPxlGAWPbN3+qQyHo25Tdh+X2MQ8GyZ8Uo
 IXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=GzaIYHmp0DpzcpK5c+5ytTVOgykyH6stYDC5nQl47N0=;
 b=lmup6okitsdsl8++POVyAScmE04G/C5xBlzQH5KjPt9Wtc+gIm0AVjbsnwDum/sG/0
 lPGwNUbXPMyujuOAHK5jKSwcgDVNFVgMXp5DFFkG0AltXxxnNoeLcupRuZ+7omZA5qXF
 ZF9SnBXq3RFg56w4o3pPJEpOioqaEAAijmlBYffYfHcFwhLlDOwqEv21SOqyN5bc+buK
 0jcOfzIERK5d2XW/tdkfn7XZSjcd3slwtL5nhJuWRt4yML4vd/KVSPw41/wU4b8fFUWQ
 8s9H8DrO93958Tbrq+F0m64i9uwcLf2m6KkNYTcExh9uHmyhcLlPFiNkxp2mMYjkqdQq
 ELdA==
X-Gm-Message-State: APjAAAVHrq6IEp4R+NG/o5DanLvgtx0dG3pxeDYYTg1gWqdf99UzYAKs
 Lqvr4VZrSJ1gf1Mjx1bqfso=
X-Google-Smtp-Source: APXvYqxaGPPcjP68gvoKY48cwW/egw4MWMDPPwgFqhZQREs/ICeezHMH2Y0E9Cl+pGoTMn0r7V/dIQ==
X-Received: by 2002:a62:8245:: with SMTP id w66mr3044437pfd.93.1581424840850; 
 Tue, 11 Feb 2020 04:40:40 -0800 (PST)
Received: from localhost.localdomain ([2409:4041:69c:214f:144f:bb39:afc3:51b0])
 by smtp.gmail.com with ESMTPSA id d1sm3876789pgj.79.2020.02.11.04.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 04:40:40 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Tue, 11 Feb 2020 18:08:45 +0530
Message-Id: <20200211123859.10429-5-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211123859.10429-1-pragat.pandya@gmail.com>
References: <20200211123859.10429-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.or, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 04/18] staging: exfat: Rename
	function "ffsLookupFile" to "ffs_lookup_file"
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Fix checkpatch warning: Avoid CamelCase
Change all occurrences of function "ffsLookupFile" to "ffs_lookup_file"
in source.

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat_super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index ba86ca572f32..6082c6e75468 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -534,7 +534,7 @@ static int ffs_sync_vol(struct super_block *sb, bool do_sync)
 /*  File Operation Functions                                            */
 /*----------------------------------------------------------------------*/
 
-static int ffsLookupFile(struct inode *inode, char *path, struct file_id_t *fid)
+static int ffs_lookup_file(struct inode *inode, char *path, struct file_id_t *fid)
 {
 	int ret, dentry, num_entries;
 	struct chain_t dir;
@@ -2279,7 +2279,7 @@ static int exfat_find(struct inode *dir, struct qstr *qname,
 	if (qname->len == 0)
 		return -ENOENT;
 
-	err = ffsLookupFile(dir, (u8 *)qname->name, fid);
+	err = ffs_lookup_file(dir, (u8 *)qname->name, fid);
 	if (err)
 		return -ENOENT;
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
