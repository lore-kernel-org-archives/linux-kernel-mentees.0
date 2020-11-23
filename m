Return-Path: <SRS0=GItZ=E5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA04C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Nov 2020 10:28:36 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8227C20731
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Nov 2020 10:28:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIR/WMKD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8227C20731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0927385143;
	Mon, 23 Nov 2020 10:28:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ienan58A7mrj; Mon, 23 Nov 2020 10:28:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8749F85065;
	Mon, 23 Nov 2020 10:28:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71DECC163C;
	Mon, 23 Nov 2020 10:28:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0316C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 10:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C766985065
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 10:28:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w41nAqqQ8ZML
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 10:28:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id AB2F285008
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 10:28:30 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 34so13842265pgp.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 02:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qRhACkl7Rv1uiFh8nGeVLLx0hitLFn3xGhjC9ZYYm2s=;
 b=mIR/WMKDFuVlCPGZvcfujDdFLjDoYpA9VEarx8tSzci8KF76UTk9zJSaCd0/zXoKmm
 7qPKRPk9ljIanB837jZ6mTRKugYuSSFpEGkV2PjPb66bgz6spS6uWXEhrnVwM/7aQ7pA
 kB9syVYMaA0uy/2FxAIUeRdNojRAmVCo9YRTmonu8VbcNIk+0yYMQ8OMMt6VSV7hMcOd
 5JpFWZ6bXvfQMjeVb3LnBsVtX00+LcpTcDq12+vUmsC7DQN2hsVmSI2SmdH7tlNi0c67
 AKE7xtwciWyPJl/A3Loj+0O/F+cBboH51Xo7xA06tbhSNewHh2hqPWO/zr48DnS46hzK
 a7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qRhACkl7Rv1uiFh8nGeVLLx0hitLFn3xGhjC9ZYYm2s=;
 b=kSL0vu2sWn5vr5esW4csYzzF28zznAK0KS1/Y4EFWVEUhek3eAyHAHnQSPio9tcm6o
 S9mg2SkznhwUwfbycQcr/jsuYSo0rqTPHdqFqadts2DAgpKJpiArKA48gDHK6/Gp+WdT
 oXgjVwsj6tmaY0HcM70fIAvCbgrTZxT8v8PPDkIneOnnOEjpylHSWtBmdJxaF1kfuwOC
 ccLViEJKeeIg9+pRoehhX6BDJbpjs1uVt89uDcEUfj4iDfiZ4cD8HL1MNHRD+m817cYS
 injoz0SV5Tbf7VsfipCRUlbDLQFssI2MtvgXV8RqV5KSC4i7k1DIyyx0CrYIL4/09HFj
 b9ug==
X-Gm-Message-State: AOAM531teRKRYmN25bgqyeZsnvdUiXg7n+GohOFFgQDEfAsYG2+x4WSO
 WoD634qdrmT04Ycw8RJAi5Q=
X-Google-Smtp-Source: ABdhPJyysChDwLc1e9sbiOMTb/IONSdknPwpSKenaAeO8j9mWeQXJWJ+8vzjQq2E0gRsbUGCVlnBaA==
X-Received: by 2002:a17:90a:5e43:: with SMTP id
 u3mr23657809pji.216.1606127310005; 
 Mon, 23 Nov 2020 02:28:30 -0800 (PST)
Received: from localhost.localdomain ([2405:204:a68f:d31a:e4c8:22ff:b3cf:2a08])
 by smtp.googlemail.com with ESMTPSA id o9sm14030919pjr.2.2020.11.23.02.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 02:28:29 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Mon, 23 Nov 2020 15:58:18 +0530
Message-Id: <20201123102818.24364-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <afaa79a6d86a4184878595ced3f2de1a92a4058c.camel@perches.com>
References: <afaa79a6d86a4184878595ced3f2de1a92a4058c.camel@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v7] checkpatch: add fix option for
	LOGICAL_CONTINUATIONS
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

Currently, checkpatch warns if logical continuations are placed at the
start of a line and not at the end of previous line.

E.g., running checkpatch on commit 3485507fc272 ("staging:
bcm2835-camera: Reduce length of enum names") reports:

CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the
previous line
+	if (!ret
+	    && camera_port ==

Provide a simple fix by inserting logical operator at the last
non-comment, non-whitespace char of the previous line and removing from
current line, if both the lines are additions(ie start with '+')

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
changes in v2: quote $operator at substitution

changes in v3: add a check for previous line ending with comment;
If so, insert $operator at the last non-comment, non-whitespace char of the previous line

changes in v4: improve the matching mechanism by matching line termination at comment or white space;
insert the operator before comments (if any) separated by a whitespace;
append the comment and its pre-whitespace after the inserted operator (if comment was present),
ie if no comment was present nothing will be inserted after the operator

changes in v5: improve regex for comment and line end with '$;'

changes in v6: remove if-check; modify commit message

changes in v7: add an extra '$' symbol at '$fixed[$fixlinenr - 1]' regex substitution to ensure match at line end

 scripts/checkpatch.pl | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 5b1a5a65e69a..fb3c50e0bde2 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3553,8 +3553,16 @@ sub process {
 
 # check for && or || at the start of a line
 		if ($rawline =~ /^\+\s*(&&|\|\|)/) {
-			CHK("LOGICAL_CONTINUATIONS",
-			    "Logical continuations should be on the previous line\n" . $hereprev);
+			my $operator = $1;
+			if (CHK("LOGICAL_CONTINUATIONS",
+				"Logical continuations should be on the previous line\n" . $hereprev) &&
+			    $fix && $prevrawline =~ /^\+/) {
+				# insert logical operator at last non-comment, non-whitepsace char on previous line
+				$prevline =~ /[\s$;]*$/;
+				my $line_end = substr($prevrawline, $-[0]);
+				$fixed[$fixlinenr - 1] =~ s/\Q$line_end\E$/ $operator$line_end/;
+				$fixed[$fixlinenr] =~ s/\Q$operator\E\s*//;
+			}
 		}
 
 # check indentation starts on a tab stop
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
