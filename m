Return-Path: <SRS0=i9XN=4B=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED1EC3B18B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 13 Feb 2020 15:26:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0866C222C2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 13 Feb 2020 15:26:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdYnWy14"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0866C222C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DAC3C85F9A;
	Thu, 13 Feb 2020 15:26:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kYCRPvFEsmXo; Thu, 13 Feb 2020 15:26:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 89CF885F98;
	Thu, 13 Feb 2020 15:26:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7E32CC1D89;
	Thu, 13 Feb 2020 15:26:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B053AC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 15:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9B31E87F52
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 15:26:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oqzhu441YrEN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 15:26:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 25ADB87C8C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 15:26:28 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id y5so3225878pfb.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 07:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=3YsWsylZ4489Gb3tnUr9kkkeFg/lh1zGRWfBEejFiwA=;
 b=CdYnWy14vgKMDE8saobSvrpuwdjIw7BGvH3RroVir3x/MBhrWIMYWQXHeaV5pbj1a+
 bLeq+kKlKdPsWosW3KD3WQrSBY2/ToqH8gIsQMljOcMAj4NIMIEMYVyki1iYe38Lm9zn
 jEb9voFR6JAun43lFlu0Sn2B/uEnHoMryDTh/BWQdOirvc6eez1/JumX8NtoxfdZen+r
 6wcKFEooJ47FjLHBDddTPHoXeun6W1qEMYCpPHFKiglaClnP6iBBwg5BBSO0wG/TzsgL
 3MFtjslnEKVUBdcAhUb0yw34mCgVSg/S1/E7RIlCciQRkNczx1/+V7HglHxTi70Ehwjm
 s+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3YsWsylZ4489Gb3tnUr9kkkeFg/lh1zGRWfBEejFiwA=;
 b=ZGUZF1/9hS0v5HlhczSNxLBhUhMM+nHYzvjuOmdfHAniRndUWywOovMt83Phry6i3+
 YyDbmXUbBd0kYAY2y5Fb/RzRlyT0BIhtqR35KBocEozjx3LOsVSTfQk2oTSc3FEkU36W
 sd7BVRDf1jVlFmZZBjlB79xmh0X8QxzJYJptI6QIqMMvvizba7WIafuVizG6hgA8p9Tq
 b+GPT6djLs0I/BsPmXWMUnHF9hNeywsrDOA8I+5mDlFhuiwtXnS98kTENytKrINiyAQQ
 YxcTyKTJeg+zRM5lhItfNP1WYBXNkpTADi6ErpcAzRybVyMQ8I1S2gF8hxr2ABqMIi4r
 1lmA==
X-Gm-Message-State: APjAAAWgQvE5bBMHC6+jW1AK4GULaN83x/3Wb2zDdtLv8DCSTxZuqNvC
 hhrKA0tOFj77o5N4zkQ+2g==
X-Google-Smtp-Source: APXvYqxb1gt5GdQ7FxVEv5Kv5nacrmWzCQlAA3YUYdxzXLhKbg4wJSto+u81h9uRby9JM7fcpafvlA==
X-Received: by 2002:a62:e91a:: with SMTP id j26mr14805034pfh.189.1581607587813; 
 Thu, 13 Feb 2020 07:26:27 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee8:f65a:fc5b:5bfd:1ab4:4848])
 by smtp.gmail.com with ESMTPSA id z3sm3609082pfz.155.2020.02.13.07.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 07:26:27 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: tytso@mit.edu,
	adilger.kernel@dilger.ca
Date: Thu, 13 Feb 2020 20:55:58 +0530
Message-Id: <20200213152558.7070-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-ext4@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] fs: ext4: mballoc.c: Use built-in
	RCU list checking
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

From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>

list_for_each_entry_rcu() has built-in RCU and lock checking.

Pass cond argument to list_for_each_entry_rcu() to silence
false lockdep warning when CONFIG_PROVE_RCU_LIST is enabled
by default.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 fs/ext4/mballoc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ext4/mballoc.c b/fs/ext4/mballoc.c
index a3e2767bdf2f..70418e13e9e8 100644
--- a/fs/ext4/mballoc.c
+++ b/fs/ext4/mballoc.c
@@ -4280,7 +4280,7 @@ ext4_mb_discard_lg_preallocations(struct super_block *sb,
 
 	spin_lock(&lg->lg_prealloc_lock);
 	list_for_each_entry_rcu(pa, &lg->lg_prealloc_list[order],
-						pa_inode_list) {
+						pa_inode_list, lockdep_is_held(&lg->lg_prealloc_lock)) {
 		spin_lock(&pa->pa_lock);
 		if (atomic_read(&pa->pa_count)) {
 			/*
@@ -4363,7 +4363,7 @@ static void ext4_mb_add_n_trim(struct ext4_allocation_context *ac)
 	/* Add the prealloc space to lg */
 	spin_lock(&lg->lg_prealloc_lock);
 	list_for_each_entry_rcu(tmp_pa, &lg->lg_prealloc_list[order],
-						pa_inode_list) {
+						pa_inode_list, lockdep_is_held(&lg->lg_prealloc_lock)) {
 		spin_lock(&tmp_pa->pa_lock);
 		if (tmp_pa->pa_deleted) {
 			spin_unlock(&tmp_pa->pa_lock);
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
