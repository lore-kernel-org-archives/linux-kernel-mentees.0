Return-Path: <SRS0=0o+h=I3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 967E4C433C1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Mar 2021 09:30:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27AA26193C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Mar 2021 09:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27AA26193C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D118F8348C;
	Mon, 29 Mar 2021 09:30:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id phXJe2qiBhnn; Mon, 29 Mar 2021 09:30:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0D11831F2;
	Mon, 29 Mar 2021 09:30:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B18AAC000B;
	Mon, 29 Mar 2021 09:30:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4DF46C000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 09:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23DFD400E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 09:30:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E5B9iQs8mIz0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 09:29:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8DCE7400E4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 09:29:59 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 x21-20020a17090a5315b029012c4a622e4aso4888742pjh.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 02:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=I2rYcnAf0ifNkAwBrdzfC3Hucp+PdY95Y1i5iXCzcs4=;
 b=DWp35A6ITBgFsPERJoKrnD9oIp9n4wapfaTcGC2EG6YLrSB5O3Nq0M0kcN7pV4Xk6z
 fDyfD26eVfv9+wOhmh7PcmI8AUF7tDgYEYMviw+lg1KX9MV3Dt/k/GkB+pj6+tPI5R7W
 KkylbAr0Hy83xpbgXRhZSJKC7Pw/yTFB2O2pIVAkGr5DsyvOLDRYcZQfAE7lpRPPhO2P
 S8/2WUwaxBCscvR4kRpbfY342rTnsJRIgEdxUxxtmD25Nbprj593WvV9jFmkaVhB94WY
 BKkBC0NkbfHU+CMNx3IuhvKltB9rx+6NZkpuOlT2H5wdmQCyI3zRt5P3Toe6QTX8ZtsS
 iDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=I2rYcnAf0ifNkAwBrdzfC3Hucp+PdY95Y1i5iXCzcs4=;
 b=OquG4IGho9h/duK6/Ee/x2cgi9ZujXKNtPYIqqYSkeq4pE8t/l6E3NFAM+9tpaBl5j
 bioFPILKH1WiVCQMghAX+a1tD9QrX36k4+Ue9G4c342dthqihLHS27T33BrBQRpFXDhr
 9kawbcAG9UGBravoo9hv0vbs6+LpxMEsI50RLQZmKGrh6foUuXSQ2wtu3do/gEAaPHtu
 zwAWvp8ONyKxmf+8rQRux62Ybd0A7OwJp99gUWwWdJYNKaBgEyj1dSH07QPwpI3p9vx/
 CRee57AiBVF5cdnKIkt4Ia92jGt2QZ9qjmpwLI+Lkf/uMHtazq+KzGNyIU3x59Dxh3Iw
 oQDQ==
X-Gm-Message-State: AOAM532xULaLDbjx+Iyy+LbUOn9xjyZQ/XdijyNyvrFVOmeK/GkD1Rro
 RBEdLn6Tzj8IiH+c6YUnRrw=
X-Google-Smtp-Source: ABdhPJx8yZaadvCrbGyAu8R22UEr9i0Qzbzpk5yBbA8vuFl5QZLV1SahL4l40JzN+KlSnvGEOUdKcw==
X-Received: by 2002:a17:90b:16cd:: with SMTP id
 iy13mr26404121pjb.46.1617010199064; 
 Mon, 29 Mar 2021 02:29:59 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:4ed:8f53:adc7:b574])
 by smtp.googlemail.com with ESMTPSA id
 z1sm16581419pfn.127.2021.03.29.02.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 02:29:58 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: corbet@lwn.net
Subject: [PATCH] scripts: kernel-doc: add warning for comment not following
 kernel-doc syntax
Date: Mon, 29 Mar 2021 14:59:45 +0530
Message-Id: <20210329092945.13152-1-yashsri421@gmail.com>
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

Currently, kernel-doc start parsing the comment as a kernel-doc comment if
it starts with '/**', but does not take into account if the content inside
the comment too, adheres with the expected format.
This results in unexpected and unclear warnings for the user.

E.g., running scripts/kernel-doc -none mm/memcontrol.c emits:
"mm/memcontrol.c:961: warning: expecting prototype for do not fallback to current(). Prototype was for get_mem_cgroup_from_current() instead"

Here kernel-doc parses the corresponding comment as a kernel-doc comment
and expects prototype for it in the next lines, and as a result causing
this warning.

Provide a clearer warning message to the users regarding the same, if the
content inside the comment does not follow the kernel-doc expected format.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/kernel-doc | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index cb92d0e1e932..b1d71a7b721f 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -2103,15 +2103,17 @@ sub process_name($$) {
 	}
     } elsif (/$doc_decl/o) {
 	$identifier = $1;
-	if (/\s*([\w\s]+?)(\(\))?\s*([-:].*)?$/) {
+	my $is_kernel_comment = 0;
+	if (/^\s*\*\s*([\w\s]+?)(\(\))?\s*([-:].*)?$/) {
 	    $identifier = $1;
+	    $decl_type = 'function';
+	    $identifier =~ s/^define\s+//;
+	    $is_kernel_comment = 1;
 	}
 	if ($identifier =~ m/^(struct|union|enum|typedef)\b\s*(\S*)/) {
 	    $decl_type = $1;
 	    $identifier = $2;
-	} else {
-	    $decl_type = 'function';
-	    $identifier =~ s/^define\s+//;
+	    $is_kernel_comment = 1;
 	}
 	$identifier =~ s/\s+$//;
 
@@ -2133,6 +2135,13 @@ sub process_name($$) {
 	    $declaration_purpose = "";
 	}
 
+	if (!$is_kernel_comment) {
+	    print STDERR "${file}:$.: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst\n";
+	    print STDERR $_;
+	    ++$warnings;
+	    $state = STATE_NORMAL;
+	}
+
 	if (($declaration_purpose eq "") && $verbose) {
 	    print STDERR "${file}:$.: warning: missing initial short description on line:\n";
 	    print STDERR $_;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
