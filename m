Return-Path: <SRS0=KBRW=2R=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBB4C2D0C0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 27 Dec 2019 01:00:53 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40BD82080D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 27 Dec 2019 01:00:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="twiCyqpn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40BD82080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EBC0587327;
	Fri, 27 Dec 2019 01:00:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SO3QlzGPZNzw; Fri, 27 Dec 2019 01:00:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6022087143;
	Fri, 27 Dec 2019 01:00:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4A68BC18DD;
	Fri, 27 Dec 2019 01:00:52 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 396A0C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Dec 2019 01:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 35678204CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Dec 2019 01:00:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uVygMRbnqlEQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Dec 2019 01:00:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 99C6320487
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Dec 2019 01:00:50 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id s64so13641681pgb.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Dec 2019 17:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s2YJGyHBLvtLKqb9SRpRu2YXGxUEZDi676bDfDkyEFg=;
 b=twiCyqpn/Igign0RvlTZHvRkRYKtUufFHA5W5ycoaUd3q/8n3py3R1QLAkBGcgvad9
 Kfcxqo5rB/CXwKIUyAmRey7Sjj2B4U/UurCMPZ0Oq3XFZiq5iW4QXiNFq0XUvdph+djU
 amfN30k3K/pnAH2doaL32/Om0flzJGZE4QASYvLRwjk2VBR0jXqlVOJVvgz+OLfivS8P
 6Mln+/3Y4Tcwxlp5b4USwweIsYnqqxgEFpsBqM60Mtv37cMjkY+BMwHW+axPm8cJx+OS
 Ij0wZx7Mo/qWeWuP/P+00VbarS89o+W+QgdgXlRZwfjLokI2fh3F+FuXB0ogkEOb4Odf
 tr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s2YJGyHBLvtLKqb9SRpRu2YXGxUEZDi676bDfDkyEFg=;
 b=DMtqfCr3TzJRR1SM9SKQojeNgOzv3n6Wnu8rUJcxRksA0deh3ElQM9upHjgNNVhgMo
 KYKaxQW3ybw6i1sAxmVa25T0CEOBGdOg93GN0Cc+wxxta6e2tZb6KClJ8ffMVi005bJc
 PciNvBMP091vqF0H298bXRtaCcR6RHciDLxIRVbHJl18QKYFg6b8zCdhXeuj2QV9ipb8
 o7fZNkOJDWlM1rmuRZAuUNwig5/vHnGeSeAT5/ZCsXQSJpvhPJ7vXiQJVIC0JkaV4jdw
 Drcer2KsWSFn4Xg+t0EVbbpllRddKGTiGCDxtM66oGzx+TG9joNkYZ5A2OQDUQwatmVl
 uUmQ==
X-Gm-Message-State: APjAAAWzw73EGpXqsodnpVHM8Rgdx1QGDMjOCisxfSyu56RmTcKaku9y
 UHOWD7AWmBmy72+iF3jb4eKSSh2mXBr4DQ==
X-Google-Smtp-Source: APXvYqwBB3Je6TMn6AbEqX5wBKgLlL6tpe5IErd1reTThA5aDBcNJsLSZUMJ3tQdS3Wfj9HH1YDKYw==
X-Received: by 2002:a62:e318:: with SMTP id g24mr51146777pfh.218.1577408450192; 
 Thu, 26 Dec 2019 17:00:50 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id 65sm39640144pfu.140.2019.12.26.17.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Dec 2019 17:00:49 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: viro@zeniv.linux.org.uk
Date: Thu, 26 Dec 2019 22:00:34 -0300
Message-Id: <20191227010035.854913-2-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191227010035.854913-1-dwlsalmeida@gmail.com>
References: <20191227010035.854913-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] fs: posix-acl.c: Fix warnings
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
