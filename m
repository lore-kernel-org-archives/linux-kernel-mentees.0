Return-Path: <SRS0=/i4J=Z2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF481C43603
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Dec 2019 10:46:26 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EED9207DD
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Dec 2019 10:46:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irQosFEL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EED9207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6E1F8882A3;
	Wed,  4 Dec 2019 10:46:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xPxjuwpyikIH; Wed,  4 Dec 2019 10:46:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F29428829B;
	Wed,  4 Dec 2019 10:46:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6902C1DD6;
	Wed,  4 Dec 2019 10:46:25 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BDC7BC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 10:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AB36E87BD7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 10:46:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bLfuGQDqzs0A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 10:46:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2F6CD86D39
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 10:46:24 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x28so3461605pfo.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Dec 2019 02:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=FfFA2fx9vKQkK9IXB35RPn6PXJy6DUq2hQ/f9g/q8mg=;
 b=irQosFELQ9MogtzndKRWTSh4IdQpCm0B7RPeZAAeOsWxA4/nkKPY4wrC9q646U0SWg
 rYAhrTUthYM/Pn8MzgXoJoSiBrPdwlrSw27HgWWzXomLmYl6w8ckAmGbfIh3VVN5pTNj
 rzTvCH2wyR+wKu3yEFFD6JKFcC+afGyLmgBK939sYlhyD8k76FbfnKoH1WoF7cAXHPX1
 dq5IIhewOVUWQ9XiVKqiVNNw9ksCqnCG9S9tk4bJaKEcRLJ9Bb9e1yuHbaZLNar01+9Y
 ZWACTWDUwchpJTxj577MeUjtDqjYlMJjD1u5x87Bs5/RgW7VMrZjgoSaee0puIlFYtzL
 HS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FfFA2fx9vKQkK9IXB35RPn6PXJy6DUq2hQ/f9g/q8mg=;
 b=GTu79mtj7BYz8BtvfH4VBNqXRx55DYES8tpu8EpsveHt4rr9JwoeObF5pqaWxj/uhF
 CDz+jQBMPCm+qK0IR3b5L2lECN3LxG4Mhm9Mj+dVRIZKJ23bNy3N0jjIdLDlmzkFdJ59
 FLUEIPwZrFgVQKg7EiqCTYrDrg6jqcxHAv8iJHpgyoDAoRBcMk+aBNjt15y+CiRMJTeZ
 20kvtdm6RZ+2wFVzhZdD+7AHVGx2JtfBlyT+FprVHOr/VhDKcwen2wxT4OUEDuT3IiIU
 zEaZNmyhgeHcbTs6A3jYY2BESswjhkTjfM1D8nFLWP1b+GRBbKHZOl9XBwMWytNKoKXt
 JEhA==
X-Gm-Message-State: APjAAAWZx4qBawGKbvibeFWD9H5cZRzomQPLdS7uo+hOwgcYmrUxLb2D
 RTaSO1AHtekr7anR27CpX3zkPvr7MGk=
X-Google-Smtp-Source: APXvYqyivDIvz9YK3RohHzevDM78spQ4qGZqtiStCyPw+L5kyV050nRq6HQWpEPVeoBgX97T0Lo+eg==
X-Received: by 2002:a63:ff26:: with SMTP id k38mr2909488pgi.128.1575456383355; 
 Wed, 04 Dec 2019 02:46:23 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:cdb:94ce:3984:ab1:9b44:803])
 by smtp.gmail.com with ESMTPSA id
 k101sm6160710pjb.5.2019.12.04.02.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 02:46:22 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: corbet@lwn.net,
	mchehab@kernel.org
Date: Wed,  4 Dec 2019 16:15:54 +0530
Message-Id: <20191204104554.9100-1-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH 2/2] Documentation: kernel-hacking:
	hacking.rst: Change reference to document namespaces.rst to
	symbol-namespaces.rst
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

From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>

This patch fixes the following documentation build warning:
Warning: Documentation/kernel-hacking/hacking.rst references
a file that doesn't exist: Documentation/kbuild/namespaces.rst

According to the following patch:
https://patchwork.kernel.org/patch/11178727/
(doc: move namespaces.rst from kbuild/ to core-api/)

The file namespaces.rst was moved from kbuild to core-api
and renamed to symbol-namespaces.rst.
Therefore, this patch changes the reference to the document
kbuild/namespaces.rst in hacking.rst to
core-api/symbol-namespaces.rst

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
---
 Documentation/kernel-hacking/hacking.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/kernel-hacking/hacking.rst b/Documentation/kernel-hacking/hacking.rst
index a3ddb213a5e1..d62aacb2822a 100644
--- a/Documentation/kernel-hacking/hacking.rst
+++ b/Documentation/kernel-hacking/hacking.rst
@@ -601,7 +601,7 @@ Defined in ``include/linux/export.h``
 
 This is the variant of `EXPORT_SYMBOL()` that allows specifying a symbol
 namespace. Symbol Namespaces are documented in
-``Documentation/kbuild/namespaces.rst``.
+``Documentation/core-api/symbol-namespaces.rst``.
 
 :c:func:`EXPORT_SYMBOL_NS_GPL()`
 --------------------------------
@@ -610,7 +610,7 @@ Defined in ``include/linux/export.h``
 
 This is the variant of `EXPORT_SYMBOL_GPL()` that allows specifying a symbol
 namespace. Symbol Namespaces are documented in
-``Documentation/kbuild/namespaces.rst``.
+``Documentation/core-api/symbol-namespaces.rst``.
 
 Routines and Conventions
 ========================
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
