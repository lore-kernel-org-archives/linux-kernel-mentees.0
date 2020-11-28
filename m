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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B68BC63798
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Nov 2020 20:01:00 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 917BB22210
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Nov 2020 20:00:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H14FXKXp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 917BB22210
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3AE9387862;
	Sat, 28 Nov 2020 20:00:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XWYE3Z9c-iZq; Sat, 28 Nov 2020 20:00:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 691E287857;
	Sat, 28 Nov 2020 20:00:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 516B1C0891;
	Sat, 28 Nov 2020 20:00:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C9439C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 20:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A1BD620360
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 20:00:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mGcVQeRGIU8X
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 20:00:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 77B9F20341
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 20:00:55 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id t3so7025881pgi.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 12:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nZU8qf4YgD6zzI9n1LIw7CWJC/0Je3ODzydn48QlHPM=;
 b=H14FXKXpkIVQ0pwwBAhxN7Byw/nmqxb22FlD21mBVlQDOrB/YrD2CnNvGNfDv/+tT/
 mkd5VaVKhDu1x4TYr8nNOZSCbN/jSRhhEmBaM7Cpgybo7/QzS2AofQRNvyN5Cc29b9zf
 P5QvM+5HgiBw/rg3ONHdLcMso5lkWI+7V9qQTletNZQUX0C5nmjkCNY38tAUh7TW7tbA
 qGtSfzeDa0QJzdy90pWfgvgMArF11rqXuydRBJcdxXZOFYO4ftU3zRdhqRCAFx/wTlmO
 Uar1GCfIM6nw+mnG2bpbXnAXl7nxiuoPdUuNqtLaxtOYVKnfaxTjHhGLrb/e2iHeYbX9
 g/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nZU8qf4YgD6zzI9n1LIw7CWJC/0Je3ODzydn48QlHPM=;
 b=GQCfhZRhSvrFPd+rjTUL8AFNnusl6bKlPVHCi/mvjCo85dguLUwzo4ZGqf3WLYOPJc
 ToUBe69U0HzSwALtplU6+j34OYQeZYzM9hSwvSEFQsqmRCd6tRkt8AftmV0xEFK89aUy
 B9CNvPgFg1R4WzXLZq6BSnLS+xa3UNn1U/z+CQFc7zwP2qmDKD++C9pMw92ztoS1sojA
 rOa4Oaf39YSFgiSzgD+i4aF50vjccPj7auOGFGkKXrmPy26CVq2SgQE+sYhM/X479IJU
 1S3pc76r1Nwc0+y6TMwntkbLh89O08qMW4VoLHJCMrhK69vpp07p8hwXktlDRawdHLzY
 qVTg==
X-Gm-Message-State: AOAM5332hsZ1nFgMh9txe8GfAG19UH9mb6z1w+l4Md8caWFZdDHm0a7d
 M+zrGLXFqQPXSyTMMr0ErM4=
X-Google-Smtp-Source: ABdhPJzGfT6TnNIkWw4wmxuh5ospbXqG8HO5n37D6R3i5y+O/21sL+ABmSlEBKf85z/xi/THPCpC+A==
X-Received: by 2002:a17:90b:2344:: with SMTP id
 ms4mr3584506pjb.43.1606593654833; 
 Sat, 28 Nov 2020 12:00:54 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:60e2:4a86:2299:c009:477b])
 by smtp.gmail.com with ESMTPSA id o2sm2946450pgq.63.2020.11.28.12.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 12:00:53 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Sun, 29 Nov 2020 01:30:46 +0530
Message-Id: <20201128200046.78739-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v4] checkpatch: add warning for
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
Changes in v4:
- Change warning type and message
- Use $stat_real and calculate line offset during matches
- fix option now works for any patch line
- # was added to format block to match %#06hh

Changes in v3:
- Change warning message
- Fix regex match to include capture group
- Warn on every unnecesary use of %h on a line
- Add fix option when the format line matches current line

Changes in v2:
- Use $logFunctions instead of the manual list.
- Relocate the check to after logging continuations check.
- Remove perl_version_ok check


 scripts/checkpatch.pl | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7dc094445d83..3c86ea737e9c 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6027,6 +6027,28 @@ sub process {
 			     "Avoid logging continuation uses where feasible\n" . $herecurr);
 		}
 
+# check for unnecessary use of %h[xudi] and %hh[xudi] in logging functions
+		if (defined $stat &&
+		    $line =~ /\b$logFunctions\s*\(/ &&
+		    index($stat, '"') >= 0) {
+			my $lc = $stat =~ tr@\n@@;
+			$lc = $lc + $linenr;
+			my $stat_real = get_stat_real($linenr, $lc);
+			pos($stat_real) = index($stat_real, '"');
+			while ($stat_real =~ /[^\"%]*(%[\#\d\.\*\-]*(h+)[idux])/g) {
+				my $pspec = $1;
+				my $h = $2;
+				my $lineoff = substr($stat_real, 0, $-[1]) =~ tr@\n@@;
+				if (WARN("UNNECESSARY_MODIFIER",
+					 "Integer promotion: Using '$h' in '$pspec' is unnecessary\n" . "$here\n$stat_real\n") &&
+				    $fix && $fixed[$fixlinenr + $lineoff] =~ /^\+/) {
+					my $nspec = $pspec;
+					$nspec =~ s/h//g;
+					$fixed[$fixlinenr + $lineoff] =~ s/\Q$pspec\E/$nspec/;
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
