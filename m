Return-Path: <SRS0=bnHI=JL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B7CC433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Apr 2021 19:25:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7012F61168
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Apr 2021 19:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7012F61168
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C6F18459A;
	Wed, 14 Apr 2021 19:25:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nKy5_ZGgLqEA; Wed, 14 Apr 2021 19:25:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48FA584570;
	Wed, 14 Apr 2021 19:25:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2446DC000C;
	Wed, 14 Apr 2021 19:25:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6F938C000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Apr 2021 19:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C7F5401C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Apr 2021 19:25:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KxvYSED80Gl2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Apr 2021 19:25:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8BEE9400E4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Apr 2021 19:25:40 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 em21-20020a17090b0155b029014e204a81e6so3482345pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Apr 2021 12:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=KpLOFoYfcHiJCEdbxKTdXhAPH70ztnzVmclf6+HcyKc=;
 b=Q2rpGYCZu6fcLua1Gy3C3msvUvuIABOekDOGgskk2jj3PWoMrSQ/wVOESzgeP6FpXP
 w+lzkE2D0nBfdTtaYca32OIUfKpPd2/SAXa7vYogp6T+4X7Njs+oAXrgXRG94TgM/LgN
 hzFa4EvNsw9TZMY8bsHXQ8s0aUO5082L5hjPYjDCw2v90EpSojmcKGuSRE+el+c3MUKF
 kKHIOB3KMTIjP2cr/KwXf2UZjO/lAgq60cfSq11kRn4X6qwhoSUnLC58f06rL29RCpQo
 FjVVAIL9JfP3oXdr8Jm9Hsj8T2P/w02qu1owpqIVIuF2koJwX58wB15mUxGFb8fNoTsk
 C0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=KpLOFoYfcHiJCEdbxKTdXhAPH70ztnzVmclf6+HcyKc=;
 b=BsxzRQHAnGclT8rN5l9lW8c6zLdR/6lu9Z318ozwPPpI8Yp2k9smFV0kTIKnEz2YpP
 tU7a8yezV+bqqmabjL7E4uAWHTayFvs4EbiI204TBzKHEtj2IFeaSE+YSVGXNqaGxBAZ
 +zM8IWCqBoeL3twH0z12Qqql8WFZ8hogd37p7vRpPfXQLjovztHrmr4EcoL9GfAQvGP0
 9PyQa6KtNfzWd1ou9tZkUXMFDuknVcxEZhTR2abIFi6ivJUj+oC0UN9Z0SFeL5fF48iz
 miQDxRQiWSCBKtPhSmnzG+YaV16a6Zt7bCuDt3/9Hq4/7RfkwJxrxdIpQFODmAa/jNTR
 M5Rw==
X-Gm-Message-State: AOAM5319FuUu0qgrHNJM7W2nVXzZ+DUqkK0Tf8bSRS2qwuEMXrPy2hBy
 EOhKnjIxJFu3919rkKRyNzY=
X-Google-Smtp-Source: ABdhPJz93KXn1rbP+KYjOKNWk+IK6exmdiFZYY5gf+skoogwzYMgSlMGcsdXvXs4SEjivvX24nDuOw==
X-Received: by 2002:a17:90b:302:: with SMTP id
 ay2mr5216317pjb.84.1618428339999; 
 Wed, 14 Apr 2021 12:25:39 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:d8d9:c36b:b907:6d78])
 by smtp.googlemail.com with ESMTPSA id d26sm188652pfo.162.2021.04.14.12.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 12:25:39 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: corbet@lwn.net
Subject: [RFC] scripts: kernel-doc: improve parsing for kernel-doc comments
 syntax
Date: Thu, 15 Apr 2021 00:55:29 +0530
Message-Id: <20210414192529.9080-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
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

Currently kernel-doc does not identify some cases of probable kernel
doc comments, for e.g. pointer used as declaration type for identifier,
space separated identifier, etc.

Some example of these cases in files can be:
i)" *  journal_t * jbd2_journal_init_dev() - creates and initialises a journal structure"
in fs/jbd2/journal.c

ii) "*      dget, dget_dlock -      get a reference to a dentry" in
include/linux/dcache.h

iii) "  * DEFINE_SEQLOCK(sl) - Define a statically allocated seqlock_t"
in include/linux/seqlock.h

Also improve identification for non-kerneldoc comments. For e.g.,

i) " *	The following functions allow us to read data using a swap map"
in kernel/power/swap.c does follow the kernel-doc like syntax, but the
content inside does not adheres to the expected format.

Improve parsing by adding support for these probable attempts to write
kernel-doc comment.

Suggested-by: Jonathan Corbet <corbet@lwn.net>
Link: https://lore.kernel.org/lkml/87mtujktl2.fsf@meer.lwn.net
Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/kernel-doc | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 888913528185..37665aa41e6b 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -2110,17 +2110,25 @@ sub process_name($$) {
     } elsif (/$doc_decl/o) {
 	$identifier = $1;
 	my $is_kernel_comment = 0;
-	if (/^\s*\*\s*([\w\s]+?)(\(\))?\s*([-:].*)?$/) {
+	my $decl_start = qr{\s*\*};
+	my $fn_type = qr{\w+\s*\*\s*}; # i.e. pointer declaration type, foo * bar() - desc
+	my $parenthesis = qr{\(\w*\)};
+	my $decl_end = qr{[-:].*};
+	if (/^$decl_start\s*([\w\s]+?)$parenthesis?\s*$decl_end?$/) {
 	    $identifier = $1;
-	    $decl_type = 'function';
-	    $identifier =~ s/^define\s+//;
-	    $is_kernel_comment = 1;
 	}
 	if ($identifier =~ m/^(struct|union|enum|typedef)\b\s*(\S*)/) {
 	    $decl_type = $1;
 	    $identifier = $2;
 	    $is_kernel_comment = 1;
 	}
+	elsif (/^$decl_start\s*$fn_type?(\w+)\s*$parenthesis?\s*$decl_end?$/ ||	# i.e. foo()
+	    /^$decl_start\s*$fn_type?(\w+.*)$parenthesis?\s*$decl_end$/) {	# i.e. static void foo() - description; or misspelt identifier
+	    $identifier = $1;
+	    $decl_type = 'function';
+	    $identifier =~ s/^define\s+//;
+	    $is_kernel_comment = 1;
+	}
 	$identifier =~ s/\s+$//;
 
 	$state = STATE_BODY;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
