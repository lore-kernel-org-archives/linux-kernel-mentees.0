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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C72C2BA83
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 13 Feb 2020 15:04:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A7772073C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 13 Feb 2020 15:04:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODlproSh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A7772073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 49ACB87D8E;
	Thu, 13 Feb 2020 15:04:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AJL4TLkhxxxV; Thu, 13 Feb 2020 15:04:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E524C87D6A;
	Thu, 13 Feb 2020 15:04:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3FD0C07FE;
	Thu, 13 Feb 2020 15:04:29 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52F33C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 15:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 421008012A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 15:04:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F0Kgp9G15Qav
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 15:04:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CADC281431
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 15:04:27 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id n7so3219213pfn.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 07:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=209hGhsnE9x9qKc202eXW57WdD7JIQizlKdhyY0UjA0=;
 b=ODlproShyC/M6a05PXd19rSQLHcql1H8dRTbm7J0GTaEZCymOQUbRoJ+Q93B5D9I46
 VcnA07psfzQ2oIeynABvdyTZ55/RIsM8yI0PRrhfwc2BZl62TWjzRF1kl68EEmUNLm9N
 QjuV43txho0gIpSpq5I7AwyG+CIcv34DrhEHnp+aVtJom4aKkejku1ZLUzjb3/zBZH1q
 Ua3H8EW0aID9Xj2bM3fw2Tj56hI9+QFvJQcFbFnweNzNSgmun5cyzPzGF0fVDICPdNB8
 L0pmEbxHAf4GTxgKUpjrO0ZWltm6y0AyuQgpUlLBP6IS2y3H5JQN1vQVZ9xq640orEuT
 uzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=209hGhsnE9x9qKc202eXW57WdD7JIQizlKdhyY0UjA0=;
 b=i5X+YETojF+D0e6sGyZPwCnhiqvVi9d27QHGuSv211WpqOugVjil5ZpIzHzGYqD2he
 iyf5eQiZJ10PMBuC6fKOblKiE3SYXS1LqDO9PH1TVtTL54WfL9UZvJDgHmafKMSRporS
 ImZAS3Uhpvk9myefmpwILx6s6ydPTQAhHnu1Iz/eUBuMUlmGd6PS2e/sPJqpgLRndaEo
 ZHL56olOrJwL0u1evcJGVoIWrDxWBiBcpXjn1CNjxSwXVkur24DKHSdQnBV0DFALwlJ1
 XfwYnZCrgxd4avknoQtIo+2YWNjtw7loYQllgVJRCvQ02KDgxcae2U3a9y1uGjIkHMfd
 Qqiw==
X-Gm-Message-State: APjAAAXxOEU6c6k0i+4uRi1BCxAiz8RVGmrfTTrJsXs5P0i7a/nD5v4R
 YIAcg7oG8mNjFOwtm6ZjHA==
X-Google-Smtp-Source: APXvYqwrUANlCfD4RfrLjtwgDFGOeXuOddD/S75LdBV2kR+2vCHyqnPjHTSiSZfwItNX0LglISdObg==
X-Received: by 2002:a62:c541:: with SMTP id j62mr14599798pfg.237.1581606267342; 
 Thu, 13 Feb 2020 07:04:27 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee8:f65a:fc5b:5bfd:1ab4:4848])
 by smtp.gmail.com with ESMTPSA id x28sm3516038pgc.83.2020.02.13.07.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 07:04:26 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: bfields@fieldses.org,
	chuck.lever@oracle.com
Date: Thu, 13 Feb 2020 20:33:59 +0530
Message-Id: <20200213150359.5819-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-nfs@vger.kernel.org, paulmck@kernel.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] fs: nfsd: fileache.c: Use built-in
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
false lockdep warning when  CONFIG_PROVE_RCU_LIST is enabled
by default.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 fs/nfsd/filecache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfsd/filecache.c b/fs/nfsd/filecache.c
index 32a9bf22ac08..547d2d8bde62 100644
--- a/fs/nfsd/filecache.c
+++ b/fs/nfsd/filecache.c
@@ -736,7 +736,7 @@ nfsd_file_find_locked(struct inode *inode, unsigned int may_flags,
 	unsigned char need = may_flags & NFSD_FILE_MAY_MASK;
 
 	hlist_for_each_entry_rcu(nf, &nfsd_file_hashtbl[hashval].nfb_head,
-				 nf_node) {
+				 nf_node, lockdep_is_held(&nfsd_file_hashtbl[hashval].nfb_lock)) {
 		if ((need & nf->nf_may) != need)
 			continue;
 		if (nf->nf_inode != inode)
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
