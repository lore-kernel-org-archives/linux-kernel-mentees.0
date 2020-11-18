Return-Path: <SRS0=ImFK=EY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6E7C5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 12:41:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2E0924180
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 12:41:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lk39PCW2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2E0924180
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4211A203F7;
	Wed, 18 Nov 2020 12:41:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N25CEnMAMu6J; Wed, 18 Nov 2020 12:41:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EE928203DC;
	Wed, 18 Nov 2020 12:41:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2E5EC0800;
	Wed, 18 Nov 2020 12:41:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 400FEC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 12:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 24BA5853C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 12:41:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TJjdRqDL6U4T
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 12:41:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5ACA584D35
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 12:41:09 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id t21so1119616pgl.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 04:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=it8JzRhie4ZUZLNrhDYP/725kiF3kapQrNtAIJC5Ezw=;
 b=Lk39PCW2Rt/u0byVo7x6YnlDdBC15Pfp9XGL9tutSco5CmQ93zghMz1yRcue05DmfG
 mKtW3ZmgJXrKf91XsKThDWq96gHNuUKqT+IF9y+L7hoDSXmNJLAfRH/6UmwI3WIj34oe
 EWv3RHrwxQYj+Z+G88RVMsbLnHj1X5oSkgr9pTBFKA4cLMHr7cxRyMmERXJPl5XL+73w
 B0fyi5KcKu8rQt0jYtk/8ZvF/ZbX17chs8j5t1GyHI+7jEV7GnoKrGvqU69YYERfayWk
 lpdgAN+o1ssXR+gfhbEMPIPM6VkGp0rYAQHSO9p0isoU0p6nqIDG3Z+OV2axthyPrh/3
 oxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=it8JzRhie4ZUZLNrhDYP/725kiF3kapQrNtAIJC5Ezw=;
 b=HYmhYWZxmiuSvtjgKfxF0Dd+jvYIjFidcms3/MyUGFV0UkiPHgUd3h7fSPZxeZ8oFh
 wiPvouZTk4ajRh/K9Tc1ngYpLzN8qk/KS9Hb3hZ2iI8ZAhCixTRJSurO0scq7I0lLPo1
 Vi0F6EoXZiKRsPwQMpCLUEV0Ai9kSQS//mjGMcfYUaCLv9QWrHSRiOTAFOAqGDFWIX7Z
 rx+u+0aO+Mc/lJC1EZu80ci+TTPkjO70QOJ5V/x+jsoAg64tPJAv4/r5d44M2tZD2soh
 4sjT0232MOs+DxpEeMVdCYu+xOBVyFO0uaH9VrYOLpqzYpZ2Z2HlS0HyTX9Pn0ktesNw
 dGKg==
X-Gm-Message-State: AOAM530G1VB7h7FhwLORsQcrCc8Z3YECtPSBTv/ozb2gO3J3ArO8OG63
 fqxOOtP4dTj0N32qZeTKwQ0=
X-Google-Smtp-Source: ABdhPJzi62EIey9sFgKBK860naW9spg0El00ZDAKcIl5hGwL9SVF9A4kDy1T0OHPWzNPGkONXF/jiw==
X-Received: by 2002:a63:4c5:: with SMTP id 188mr7942080pge.339.1605703268734; 
 Wed, 18 Nov 2020 04:41:08 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6067:4f82:1cca:da0c:606c])
 by smtp.gmail.com with ESMTPSA id d7sm3428045pfd.214.2020.11.18.04.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 04:41:07 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Wed, 18 Nov 2020 18:10:35 +0530
Message-Id: <20201118124035.96976-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add --fix option for
	OPEN_BRACE issues
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

Brace style misuses of the following types are now
corrected:

int foo(int bar,
        int baz) { bar++;
    return bar + baz;
}

int foo(int bar,
        int baz) {
    return bar + baz;
}

if (bar &&
    baz)
{   bar++;
    baz++;
}

if (bar &&
    baz)
{
    bar++;
    baz++;
}

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 38 +++++++++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 0da6422cd0fd..8da6cde20c68 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3937,9 +3937,23 @@ sub process {
 			#print "pre<$pre_ctx>\nline<$line>\nctx<$ctx>\nnext<$lines[$ctx_ln - 1]>\n";
 
 			if ($ctx !~ /{\s*/ && defined($lines[$ctx_ln - 1]) && $lines[$ctx_ln - 1] =~ /^\+\s*{/) {
-				ERROR("OPEN_BRACE",
-				      "that open brace { should be on the previous line\n" .
-					"$here\n$ctx\n$rawlines[$ctx_ln - 1]\n");
+				if (ERROR("OPEN_BRACE",
+					  "that open brace { should be on the previous line\n" .
+						"$here\n$ctx\n$rawlines[$ctx_ln - 1]\n") &&
+				    $fix) {
+					my $line1 = $rawlines[$ctx_ln - 2];
+					my $line2 = $rawlines[$ctx_ln - 1];
+					fix_delete_line($ctx_ln - 2, $line1);
+					fix_delete_line($ctx_ln - 1, $line2);
+
+					my $fixedline = rtrim($line1) . " {";
+					fix_insert_line($ctx_ln - 1, $fixedline);
+					$fixedline = $line2;
+					$fixedline =~ s/^(.\s*)\{\s*/$1\t/;
+					if ($fixedline !~ /^\+\s*$/) {
+						fix_insert_line($ctx_ln - 1, $fixedline);
+					}
+				}
 			}
 			if ($level == 0 && $pre_ctx !~ /}\s*while\s*\($/ &&
 			    $ctx =~ /\)\s*\;\s*$/ &&
@@ -6659,16 +6673,30 @@ sub process {
 			my $ok = 0;
 			my $cnt = statement_rawlines($stat);
 			my $herectx = $here . "\n";
+			my $cur_ln = $linenr - 1;
 			for (my $n = 0; $n < $cnt; $n++) {
 				my $rl = raw_line($linenr, $n);
 				$herectx .=  $rl . "\n";
 				$ok = 1 if ($rl =~ /^[ \+]\{/);
 				$ok = 1 if ($rl =~ /\{/ && $n == 0);
 				last if $rl =~ /^[ \+].*\{/;
+				$cur_ln++;
 			}
 			if (!$ok) {
-				ERROR("OPEN_BRACE",
-				      "open brace '{' following function definitions go on the next line\n" . $herectx);
+				if (ERROR("OPEN_BRACE",
+					  "open brace '{' following function definitions go on the next line\n" . $herectx) &&
+				    $fix && $rawlines[$cur_ln] =~ /^\+/) {
+					fix_delete_line($cur_ln, $rawlines[$cur_ln]);
+					my $fixed_line = $rawlines[$cur_ln];
+					$fixed_line =~ /(^.*\)\s*)\{(.*)$/;
+					my $line1 = rtrim($1);
+					my $line2 = $2;
+					fix_insert_line($cur_ln, $line1);
+					fix_insert_line($cur_ln, "\+{");
+					if ($line2 !~ /^\s*$/) {
+						fix_insert_line($cur_ln, "\+\t" . trim($line2));
+					}
+				}
 			}
 		}
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
