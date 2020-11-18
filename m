Return-Path: <SRS0=ImFK=EY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F019C5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 17:10:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB0D321D7E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 17:10:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s3mVSNy/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB0D321D7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0DEC385DF1;
	Wed, 18 Nov 2020 17:10:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cQQY2-uOyLSy; Wed, 18 Nov 2020 17:10:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7214285D94;
	Wed, 18 Nov 2020 17:10:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60250C0800;
	Wed, 18 Nov 2020 17:10:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83485C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 17:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 70AFB87251
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 17:10:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u8tKf7V0Vlch
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 17:10:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D303B87183
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 17:10:04 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id a18so1817943pfl.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 09:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=InVSY8W143LFrH+AW2rqioi30kl0+1PGvBY612EVdr4=;
 b=s3mVSNy/S7p2Um4Z1VfSYTmCbP4vyNgOuIxTMKfWN3gqCQof7Lk5XiNdcP4zBtaBz6
 ik6ZVSM1Qc2XOSCsNPHkuNzBn4iU+7Jvwta5jplU3zkiOEDTZIl8iC5B39BlTCKhT+iT
 wK5FjRgvSgheTxXfSY9MA/37wfMyWA5CrAmO5jqTdI1TrgUPglgT+JpwpaVN6F4ovmig
 R3J2EjyilWYU8V5mID1RHhGNmm6Q8tOdsMebrEugsvTl7lvvdxyejo4ijT3UmDWuGwv0
 elknMRTCLSvG20hTNICoAeoHhTLgpah3sR12LeSLAGg2Uwz2a8HWMDHxnpL1QO5gcHdZ
 L1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=InVSY8W143LFrH+AW2rqioi30kl0+1PGvBY612EVdr4=;
 b=C2pCsG/7Y5wK7VDNj8l5d17nPnWDa7gvPtxS81PhNjy+HwOpuafU7eCmfcn7GlPClm
 WLuZ30E5JhRyAC7mkxlW41m4e8RkCfF7edAFHNEN3jeHq5dpVh2eft6fIH+G8Svjrj8V
 7qs2aJGoCDhyzyQKOW1HeqgPLS40UGmSUuAe71y8gXxpbPjy+yJkYz8K95zNCuEHtCG5
 Gmfgyh0U3O3zXreu7ASgXaCvCoYP3bYVnENy5uUT7U8AaJer66qNnZGjETjjggmU1GOV
 9pS6ToiAMmQkA8M0/VQBxlZtlhfzSWvDney5EflUZVuBI6RsQtd8k+77I9pj46jHNENB
 VgLA==
X-Gm-Message-State: AOAM533LjEPQU2WV1vqV2u9mYEnUFnXtIyFMr7Dezscv9g4Z4C9/LjA2
 b8r9RbvdnKUyC0UfKDRRtyE=
X-Google-Smtp-Source: ABdhPJwThocp4DTnItxhQZdKOg9l58+X+l4YmVGdXsWyK2dJWFzBJOJO5dZZXM2ramatJUR3KSTSRQ==
X-Received: by 2002:aa7:864b:0:b029:18e:fc45:f2a1 with SMTP id
 a11-20020aa7864b0000b029018efc45f2a1mr5237500pfo.58.1605719404242; 
 Wed, 18 Nov 2020 09:10:04 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:43c:f24e:b031:6d03:e76d:9978])
 by smtp.googlemail.com with ESMTPSA id p19sm2946832pjv.32.2020.11.18.09.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 09:10:03 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Wed, 18 Nov 2020 22:39:50 +0530
Message-Id: <20201118170950.31566-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	NETWORKING_BLOCK_COMMENT_STYLE
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

Currently, checkpatch warns us if we use an empty '/*' line for comment
and contents of the comment are in next line.

E.g., running checkpatch on commit 0d52497ac8ee ("iwlwifi: pcie: remove
the refs / unrefs from the transport") reports this warning:

WARNING: networking block comments don't use an empty /* line, use /* Comment...
+		/*
+		 * If the TXQ is active, then set the timer, if not,

Provide a fix by appending the current line contents to previous line
and deleting the current line

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index f61ac7456151..90e863d63097 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3629,8 +3629,14 @@ sub process {
 		    $prevrawline =~ /^\+[ \t]*\/\*[ \t]*$/ &&
 		    $rawline =~ /^\+[ \t]*\*/ &&
 		    $realline > 3) { # Do not warn about the initial copyright comment block after SPDX-License-Identifier
-			WARN("NETWORKING_BLOCK_COMMENT_STYLE",
-			     "networking block comments don't use an empty /* line, use /* Comment...\n" . $hereprev);
+			if (WARN("NETWORKING_BLOCK_COMMENT_STYLE",
+				 "networking block comments don't use an empty /* line, use /* Comment...\n" . $hereprev) &&\
+			    $fix) {
+				if ($rawline =~ /^\+[ \t]*\*\s*(.*)/) {
+					fix_delete_line($fixlinenr, $rawline);
+					$fixed[$fixlinenr - 1] .= " $1";
+				}
+			}
 		}
 
 # Block comments use * on subsequent lines
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
