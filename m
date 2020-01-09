Return-Path: <SRS0=kdHc=26=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D26C33CA2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jan 2020 15:37:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B43DA20721
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jan 2020 15:37:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZneKtiAl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B43DA20721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7FF918654C;
	Thu,  9 Jan 2020 15:37:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mN-W2j8BYmfZ; Thu,  9 Jan 2020 15:37:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2172E863DB;
	Thu,  9 Jan 2020 15:37:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15C9CC1796;
	Thu,  9 Jan 2020 15:37:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F24A6C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 15:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D8C3D21515
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 15:37:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AZG-ofkdNTZQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 15:37:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 315DD21514
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 15:37:18 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id v25so4356911qto.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 09 Jan 2020 07:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s2YJGyHBLvtLKqb9SRpRu2YXGxUEZDi676bDfDkyEFg=;
 b=ZneKtiAlMcidG4UdYbHPyxPvUR5AWwRcKL1wUXAKDc3yaB5Rz2JG2cg9C+f/skx5di
 IPR1RluXbxEvHAmkbAnTVYeiCBecT03OzDYOo2OAHOHyuRB11O8rFg3tNiTOZLHmgXoa
 MDVcLXuCkhA1oB8ew29ESo+iL2YRj+s/rpqID+AgHME6pbnELqyMDAgHnW+2SQNpPP+w
 qa9P8QKO7h3dtEfAoPylj50dBtBSxZp8+7AFMi+ZRNDBYAZndBhg3CrVPteAPfeEtlfx
 QjKbf7Bh/VxE39BXkS2iW5QtRy7yAmy4Ihv5t2FvO5Gi6UQ3SfCpkGzS2kwEEsdy9Ixw
 /zzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s2YJGyHBLvtLKqb9SRpRu2YXGxUEZDi676bDfDkyEFg=;
 b=BjTYmbPMBgtJmz4frTfJqt+szRUEemGyYN7N6Kh8ioc2FVlY5dbqz/CIQXP55gmW2B
 8K9yi6KFQDpJ+68oVntvM4p8P7FlULoXSX+EE0e7bXjVtOnJB25w64uO5QxHbmq4G08g
 pzL/vHbvBjrFUiwLqR6tKZeHXP3bhkuVt21LMmHmhMaZDLQKKFgZfBxD4QsqUOYMoQ+b
 zT3wtycrDEaC8MwT7F1oIEpK26SoCfKwyPtXxZznoC5Uk+1UJGRxTlv76ofCYOMELsID
 rQZjNgga5HnEmqrXVG7cHRRjGoR/Kv/vNlNCuSGQJYEYQpm9BsODbZcA10wx/Sx2tX+u
 l62Q==
X-Gm-Message-State: APjAAAVSz0cdknqKmIyT0D0ObrH7QoReB143U70M8RIT/N3o849TqqTY
 44+EYx6h86Ivg6R1C5RHPlA=
X-Google-Smtp-Source: APXvYqzRsrNCmNbKgXNaQF/bpdsSBKi6qZ1al31wLZdA+ei0VbefgTZAFJ0ZXB5U1yp13F10a5Gylg==
X-Received: by 2002:ac8:65d3:: with SMTP id t19mr8721051qto.369.1578584237194; 
 Thu, 09 Jan 2020 07:37:17 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id u16sm3122008qku.19.2020.01.09.07.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 07:37:16 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: viro@zeniv.linux.org.uk
Date: Thu,  9 Jan 2020 12:37:07 -0300
Message-Id: <20200109153708.1021891-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [RESEND] fs: posix-acl.c: Fix warnings
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

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Fix the following warning

/fs/posix_acl.c:636: WARNING: Inline emphasis start-string without end-string.

By escaping a character.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 fs/posix_acl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/posix_acl.c b/fs/posix_acl.c
index 84ad1c90d535..cb25966c6881 100644
--- a/fs/posix_acl.c
+++ b/fs/posix_acl.c
@@ -634,7 +634,7 @@ EXPORT_SYMBOL_GPL(posix_acl_create);
  *
  * Update the file mode when setting an ACL: compute the new file permission
  * bits based on the ACL.  In addition, if the ACL is equivalent to the new
- * file mode, set *acl to NULL to indicate that no ACL should be set.
+ * file mode, set \*acl to NULL to indicate that no ACL should be set.
  *
  * As with chmod, clear the setgit bit if the caller is not in the owning group
  * or capable of CAP_FSETID (see inode_change_ok).
@@ -743,12 +743,12 @@ posix_acl_from_xattr(struct user_namespace *user_ns,
 		return ERR_PTR(-EINVAL);
 	if (count == 0)
 		return NULL;
-	
+
 	acl = posix_acl_alloc(count, GFP_NOFS);
 	if (!acl)
 		return ERR_PTR(-ENOMEM);
 	acl_e = acl->a_entries;
-	
+
 	for (end = entry + count; entry != end; acl_e++, entry++) {
 		acl_e->e_tag  = le16_to_cpu(entry->e_tag);
 		acl_e->e_perm = le16_to_cpu(entry->e_perm);
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
