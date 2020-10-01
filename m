Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD81C4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 17:19:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9A882085B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 17:19:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OdtQstUM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9A882085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BC154226F3;
	Thu,  1 Oct 2020 17:19:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2cvpXWh9gxrF; Thu,  1 Oct 2020 17:19:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C0DB320439;
	Thu,  1 Oct 2020 17:19:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0631C016F;
	Thu,  1 Oct 2020 17:19:48 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E700CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 17:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DD03886786
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 17:19:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WFbH+31K-HQn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 17:19:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C7F6086A3C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 17:19:45 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 7so4514679pgm.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 10:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RrTCyTN1+2ixfks7s00Aw0ElOFGBGCF6ZaKZi3egmQI=;
 b=OdtQstUMwE24TphYEOw1H7nu2GsKA5sCbLvSGiNUK43tG7xYt+gvxxu23RnupG6Z4N
 XSzEdgvQjVII0O2weDvixUxxGKBO/bu4kgLs4k8txhbsvVINpfeyq9ZYd7M21MmQb57L
 I0Yf5CAVEY2SzF9frgbislitvq7HuMvI2bjLZYEeilN6iT+66KkvLkRQ7g6K7xzcPq53
 nOVfh5hBnNkK2EAGRzIb3+EIoeKKOumTfZ3g1pHMJUjFvgbrilldT4SzC2eUWLk1qT80
 PqGNTfg7JulDtyBcyfXuSOCJgc4S3uDJIush2WXMA0Prc4r9Avd8eAglC5XMmW9ppnCH
 /CTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RrTCyTN1+2ixfks7s00Aw0ElOFGBGCF6ZaKZi3egmQI=;
 b=l1wXBgmaQG4966psY4CjmBWW2NC2/0e7uJx7+EQg/i6dePUzAesUwA1nmrXWh3h5kG
 RwjAUQ8DYSXKfioj/0bc4eUWb8+/ojn9xUqc0DE30dR6CAJuFqK9kHAuW2Fx1LNc92LP
 prY3qhl2EmOZHE8M+oCk9XTwrVU+Sbr9ODQjnNUVNQ5qmRU2/vIpw5/jTzFL+HXExiId
 JTjds2WF0v1X5gJo3fOcY+jXKD1fZMqTXsmVx4pe01S4c/WPvt/o5wKXcvidKMV5UdLq
 3tw5Xx9mu8E88TugxZ+3Z/+wmCeJ2MaWUCq7aFZLIp1wD6pxtUN1sqQ953ArSdeFnAml
 JyMQ==
X-Gm-Message-State: AOAM530fN1aufqjABJkyz/5v+BKmDzj5JG8VskisI/QzDJmCIODlYghf
 DVxA4qpvq35gDPqJ894j2Qg=
X-Google-Smtp-Source: ABdhPJwj+CliAxLfbR8GghOZ89pOMm6NrYJ7r2bkcxnFQM6/UC76RoA882XypGG6XvUYSr1ObiXaqA==
X-Received: by 2002:a17:902:bccb:b029:d3:89e2:7a21 with SMTP id
 o11-20020a170902bccbb02900d389e27a21mr4381730pls.30.1601572785159; 
 Thu, 01 Oct 2020 10:19:45 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:6895:98fa:b2ef:d209:c1d4])
 by smtp.gmail.com with ESMTPSA id b11sm6799796pfd.33.2020.10.01.10.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 10:19:44 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Thu,  1 Oct 2020 22:49:03 +0530
Message-Id: <20201001171903.312021-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: fix multi-statement
	macro checks for while blocks.
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

Checkpatch.pl doesn't have a check for excluding while (...) {...}
blocks from MULTISTATEMENT_MACRO_USE_DO_WHILE error.

For example, running checkpatch.pl on the file mm/maccess.c in the
kernel generates the following error:

ERROR: Macros with complex values should be enclosed in parentheses
+#define copy_from_kernel_nofault_loop(dst, src, len, type, err_label)  \
+       while (len >= sizeof(type)) {                                   \
+               __get_kernel_nofault(dst, src, type, err_label);        \
+               dst += sizeof(type);                                    \
+               src += sizeof(type);                                    \
+               len -= sizeof(type);                                    \
+       }

The error is misleading for this case. Enclosing it in parentheses
doesn't make any sense.

Checkpatch already has an exception list for such common macro types.
Added a new exception for while (...) {...} style blocks to the same.

In addition, the brace flatten logic was modified by changing the
substitution characters from "1" to "1u". This was done to ensure that
macros in the form "#define foo(bar) while(bar){bar--;}" were also
correctly procecssed.

Link: https://lore.kernel.org/linux-kernel-mentees/dc985938aa3986702815a0bd68dfca8a03c85447.camel@perches.com/

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9e65d21456f1..31624bbb342e 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -5299,9 +5299,9 @@ sub process {
 			$dstat =~ s/\s*$//s;
 
 			# Flatten any parentheses and braces
-			while ($dstat =~ s/\([^\(\)]*\)/1/ ||
-			       $dstat =~ s/\{[^\{\}]*\}/1/ ||
-			       $dstat =~ s/.\[[^\[\]]*\]/1/)
+			while ($dstat =~ s/\([^\(\)]*\)/1u/ ||
+			       $dstat =~ s/\{[^\{\}]*\}/1u/ ||
+			       $dstat =~ s/.\[[^\[\]]*\]/1u/)
 			{
 			}
 
@@ -5342,6 +5342,7 @@ sub process {
 			    $dstat !~ /^\.$Ident\s*=/ &&				# .foo =
 			    $dstat !~ /^(?:\#\s*$Ident|\#\s*$Constant)\s*$/ &&		# stringification #foo
 			    $dstat !~ /^do\s*$Constant\s*while\s*$Constant;?$/ &&	# do {...} while (...); // do {...} while (...)
+			    $dstat !~ /^while\s*$Constant\s*$Constant\s*$/ &&		# while (...) {...}
 			    $dstat !~ /^for\s*$Constant$/ &&				# for (...)
 			    $dstat !~ /^for\s*$Constant\s+(?:$Ident|-?$Constant)$/ &&	# for (...) bar()
 			    $dstat !~ /^do\s*{/ &&					# do {...
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
