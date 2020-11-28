Return-Path: <SRS0=hNXL=FC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04257C63777
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Nov 2020 17:39:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79D7B246D0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Nov 2020 17:39:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHoZStE5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79D7B246D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 125D987780;
	Sat, 28 Nov 2020 17:39:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tDbJVpSC2noJ; Sat, 28 Nov 2020 17:39:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4E60887746;
	Sat, 28 Nov 2020 17:39:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34CD9C0891;
	Sat, 28 Nov 2020 17:39:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78A5BC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 17:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5EA93877B9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 17:39:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 83j9pdWqpscN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 17:39:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 96DCF877AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 17:39:01 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id t8so7217981pfg.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 09:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/lr0Q5Uwc3CpXfcZqNsuuT98OLf5ZKK5wEqy52e9CRk=;
 b=BHoZStE5yUD85I3A7PXIN9sCE5AeRtlgGZZx9Crxq5C48tz3dcWRIYTIUwZvKOeymW
 zd5/d7HS/W8gjM5NlP14Fp0eLgfgYo4iuE2zfXG1V+F6MBo7Mpr89AwvahVBsQKmbpn6
 DoT/agWf2RFU7VbCG/vZKxlGQ7QELbAGQ4I2EP+6Vh0HKOy65kaki9w9ezl9EPrpgYJu
 UHx8vMG1ccrpznSVTBADc2YaYF36KAFiR+guF6d8biH9WYJIbn/hQggCvxp4HXvAFyaL
 fx5oBebd2XN5dHl1K2QxQLNUEd71o0xIan1jV4VaZeE8UjFqenmCmKkbIqkEKtJvg9UX
 WRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/lr0Q5Uwc3CpXfcZqNsuuT98OLf5ZKK5wEqy52e9CRk=;
 b=b1da0egyE8g5QXMVM4aW2u702mIRTTuIimr1wuu74vHlnFyIRDRuz2z9jjz8ZuTEmf
 xB9t+I7oo0ufxqw0xrP2ZxZe1kEGbDU8eFnNEO+gWOID9tZIdK2z2SBz9yqnptGEXhgj
 OK2qQSNZHyualEnPfMHZ3XN/Mkg/aGuFooyygqN0dMcALRaVa4HIUOO6FM1MjmtlM55k
 PXEcsIRX2RLVEuOuoNQAXRHahK6ZHAPlXCZKM5QUrNS0Zbb7uAbenKx/xRsNovxqzny+
 IwYIznOTifWQ2+HxttCdpozI3m2ii/fvq6v0OEw0iDA0RWNAmWd+yKqx1rg8c2ueuNiO
 9wNA==
X-Gm-Message-State: AOAM5311v+D5cdQVkAwIkZ9w5lBwAeXtLZ4zKgN9Hw7UeTq1fM7wk48L
 nAePbr4mxNKoHACO5/Wju5A=
X-Google-Smtp-Source: ABdhPJypXtG+f192A1K6LnjTqSc6pl0yRhSWq+anfN/4Vy1n/09H8nwnmCnm2Yw7rOLgPTNV4LUNjg==
X-Received: by 2002:a63:cb47:: with SMTP id m7mr10941883pgi.395.1606585141088; 
 Sat, 28 Nov 2020 09:39:01 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:60e2:4a86:2299:c009:477b])
 by smtp.gmail.com with ESMTPSA id q14sm11653885pfl.163.2020.11.28.09.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 09:39:00 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Sat, 28 Nov 2020 23:08:50 +0530
Message-Id: <20201128173850.66509-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v3] checkpatch: add warning for
	unnecessary use of %h[xudi] and %hh[xudi]
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

Modifiers %h and %hh should never be used.

Commit cbacb5ab0aa0 ("docs: printk-formats: Stop encouraging use
of unnecessary %h[xudi] and %hh[xudi]") specifies that:

"Standard integer promotion is already done and %hx and %hhx is useless
so do not encourage the use of %hh[xudi] or %h[xudi]."

"The "h" and "hh" things should never be used. The only reason for them
being used if you have an "int", but you want to print it out as a
"char" (and honestly, that is a really bad reason, you'd be better off
just using a proper cast to make the code more obvious)."

Add a new check to emit a warning on finding an unneeded use of %h or
%hh modifier.

Also add a fix option to the check.

Link: https://lore.kernel.org/lkml/4910042649a4f3ab22fac93191b8c1fa0a2e17c3.camel@perches.com/

Suggested-by: Joe Perches <joe@perches.com>
Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
Changes in v3:
- Change warning message
- Fix regex match to include capture group
- Warn on every unnecesary use of %h on a line
- Add fix option when the format line matches current line

Changes in v2:
- Use $logFunctions instead of the manual list.
- Relocate the check to after logging continuations check.
- Remove perl_version_ok check

 scripts/checkpatch.pl | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7dc094445d83..dc25d32f0c5f 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6027,6 +6027,22 @@ sub process {
 			     "Avoid logging continuation uses where feasible\n" . $herecurr);
 		}
 
+# check for unnecessary use of %h[xudi] and %hh[xudi] in logging functions
+		if (defined $stat &&
+		    $line =~ /\b$logFunctions\s*\(/) {
+			my $lc = $stat =~ tr@\n@@;
+			for (my $cur_ln = $linenr; $cur_ln <= $linenr + $lc; $cur_ln++) {
+				my $cur_rawline = raw_line($cur_ln, 0);
+				while ($cur_rawline =~ /^\+.*\"[^\"]*(%[\d\.\*\-]*h+[idux])/g) {
+					if (WARN("INTEGER_PROMOTION",
+						 "Using 'h' in $1 is unnecessary\n" . "$cur_rawline\n") &&
+					    $fix && ($cur_ln == $linenr)) {
+						$fixed[$fixlinenr] =~ s/(\"[^\"]*%[\d\.\*\-]*)h+([idux])/$1$2/;
+					}
+				}
+			}
+		}
+
 # check for mask then right shift without a parentheses
 		if ($perl_version_ok &&
 		    $line =~ /$LvalOrFunc\s*\&\s*($LvalOrFunc)\s*>>/ &&
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
