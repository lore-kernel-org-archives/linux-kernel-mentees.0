Return-Path: <SRS0=gqjg=EX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DEBEC2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 08:56:25 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F2FE223BD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 08:56:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yvmkcyw2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F2FE223BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BE906870FC;
	Tue, 17 Nov 2020 08:56:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lHimFJHpXJp7; Tue, 17 Nov 2020 08:56:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3FFAF870E1;
	Tue, 17 Nov 2020 08:56:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1222BC0891;
	Tue, 17 Nov 2020 08:56:23 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 958A3C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 08:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7A0FE870FC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 08:56:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P60-XbCD42hW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 08:56:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E04F9870E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 08:56:20 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id w20so88430pjh.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 00:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=it8JzRhie4ZUZLNrhDYP/725kiF3kapQrNtAIJC5Ezw=;
 b=Yvmkcyw2oQDCua/AYGR5scHYE8K/I0tsj3R03qK+3fe0YL6FNCRwVVeJAutHFKEoH4
 tlJVj+DpQvxtUb3bDsXm6eElOEdbUsE0mx2f4kTav3/09jjmhUX5AQ7XqlcIveu4/4Ch
 EfhEH4SDEQyFlTJKQCahuBDEn4oLcotc2QPXaqdAs0w5PV75ZTgTvDY87R7nD9IOjH1r
 GgyfAMl+RUFHJM7W2nf1Rd/1/6aXNU4QTa64QQFva0LLJoSVANkR9iXWAOhDTxJAQvaX
 gr+GqkeJbiC0O7/+VerWVajqwKbQ/+RYZmX9F14/rXnWfPa/Lnzd2fZEbwm2sItqlVNV
 G3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=it8JzRhie4ZUZLNrhDYP/725kiF3kapQrNtAIJC5Ezw=;
 b=VV7zfrtlwpuTaRY7WvDy4boM7M7ax4+qHxmSBONvYnF8VEazPtSUu9xde6KzEJbcQR
 nJSv0+6+tVDTiU/3ekC9utlVocxB1InBWyr0RicT4WsATELYHu9kBcbhHtxQRec7kwSs
 3c42gL1+TdJlZjzbX3kvZwx4c+NvBM+X5km8xXSPcbgaS9XYSd3+Xdf7035zdFsIzt6v
 QSGIXnUav9RmhaII1cWEWtRw+u8J3Mm69WuVghFjgp7+IL1bKxfGxEUIARLFv6nueKas
 Yg5EvfnZRDmglM3zoIiFK2HukJ9n1QyjmCvdbrUPBX6DPk/m2RcVKQpFE/URsT6Bad1Q
 U75g==
X-Gm-Message-State: AOAM532wNIuCMcAV64reOgyoJAG0BUxy6lAev+dZlEx2rOYKoiEf8DlS
 vSVJmssgxDcA/PncCWDPP+c=
X-Google-Smtp-Source: ABdhPJwYuSQsmPLP/LBEH+2WAywaYYG8zCGEvw2f+2XslJ5CCrnS7VPQH87QL5YEw0WbbZDd7ZvGug==
X-Received: by 2002:a17:90a:9a1:: with SMTP id 30mr3632645pjo.52.1605603380328; 
 Tue, 17 Nov 2020 00:56:20 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:60ba:80c7:87c0:8479:8968])
 by smtp.gmail.com with ESMTPSA id y5sm20937998pfc.165.2020.11.17.00.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 00:56:19 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Tue, 17 Nov 2020 14:25:53 +0530
Message-Id: <20201117085553.52583-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
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
