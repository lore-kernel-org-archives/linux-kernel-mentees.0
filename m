Return-Path: <SRS0=YTQs=E2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB421C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Nov 2020 19:59:08 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A5462225B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Nov 2020 19:59:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TXKYU3yo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A5462225B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4B41C2E13A;
	Fri, 20 Nov 2020 19:59:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nFdt-ie28yNu; Fri, 20 Nov 2020 19:59:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E3DDA2E137;
	Fri, 20 Nov 2020 19:59:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE3B0C1825;
	Fri, 20 Nov 2020 19:59:04 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1E3DC0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 19:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C7E1E8703B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 19:59:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HA4cUQ0Gb3cW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 19:59:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0EB70860FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 19:59:03 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id q34so8188574pgb.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 11:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=O3BU5ZgK3Tivt+sDSRiVL3/Xl///a+M0mHPo0RlrgTk=;
 b=TXKYU3yoW4seRbI1mZgp14rP2Pe81XL7ibpxgboPcfT7gRmwzemXvox0yrwqF/KCTf
 lskjGOILcWQ5AfTWinx7YAt7soEm07pJhhVoYqT55k0D+RETgdt/es2cOD7b2haCKrHS
 0/FhGzZxkHo4S9Z0P6Gs5fIKyE4Kqx3nx/QlSEUr9prxLsEAcpg16OfuMUOrfbHLxDtQ
 IT52zm4alOFsBDdtd1HZB7MOEIsJA3+DFu2cvsCo77Rm/JiN2CXS07I6yANvDuq6u+Io
 L77TkjYcpZ6M51vTUUlBjhcs4DZSUmPoHF1Q0Ua1PINZdypeQjrJUExPmAjPuWRPU7G9
 xV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=O3BU5ZgK3Tivt+sDSRiVL3/Xl///a+M0mHPo0RlrgTk=;
 b=mqvKgcfhgA3yMETP7Yj11vWwjLhhndU3jckwdoQI7C6OwTkbyABiSGIjzEgY46ZaMH
 HqcAZ5crM9DyZsIEI1RNvuZFtrbIlvJ5CYRZh52LsF8lLrk4/M44rB0nWdpxf2hfjXib
 CcEOK20hKpTKbJru8G3V/yt9v4i+dG0kmnyvkN3tkdqIZVQAcBl91vzdrj2w1SQBDwNf
 o0tAJS6yu46EJDITsv8ATI50lXzd1KITeYDBeyRy8dBK/X5UHZ/sD9yGNQyv61pP83Qt
 KOgMV4xTkAvBRYW77sZTrxSGaNjnDChBl+F5wm+Q7Im1LdF+8H9l5BfJeFE4o+Yif+9l
 c53A==
X-Gm-Message-State: AOAM5305LNpduwkps3pMKRQ4f848erHrutyFblAZ+xqReQ7pCssMq0bY
 FsfvD6j6OulMY0PwaVE3KNY=
X-Google-Smtp-Source: ABdhPJwecBLKIduuyPlmFPb47AlsRrQWtXAeVxwxmJ3k4MpdgN6KWuFp9fhGaeQHAB5bsFfNOuVj5A==
X-Received: by 2002:aa7:8f13:0:b029:18b:db7a:8590 with SMTP id
 x19-20020aa78f130000b029018bdb7a8590mr15890676pfr.9.1605902342542; 
 Fri, 20 Nov 2020 11:59:02 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:415:f607:e09e:f6d6:daa6:f3cd])
 by smtp.googlemail.com with ESMTPSA id a67sm3129921pfa.77.2020.11.20.11.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 11:59:01 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Sat, 21 Nov 2020 01:28:51 +0530
Message-Id: <20201120195851.23679-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <da375716-721c-e4d8-27a9-f8d576741d65@gmail.com>
References: <da375716-721c-e4d8-27a9-f8d576741d65@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add fix and improve
	warning msg for Non-standard signature
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

Checkpatch.pl warns on non-standard signature styles.

E.g., running checkpatch on commit 513f7f747e1c ("parisc: Fix vmap
memory leak in ioremap()/iounmap()") reports this warning:

WARNING: Non-standard signature: Noticed-by:
Noticed-by: Sven Schnelle <svens@stackframe.org>

Provide a fix by:
1) replacing the non-standard signature with its standard equivalent
2) removing the signature if it is not required

Also, improve warning messages correspondingly, providing users
suggestions to either replace or remove the signature

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 45 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index fdfd5ec09be6..23a21dc2c29a 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -506,6 +506,27 @@ our $signature_tags = qr{(?xi:
 	Cc:
 )};
 
+our %standard_signature_fix = (
+	"Requested-by:" => "Suggested-by:",
+	"Co-authored-by:" => "Co-developed-by:",
+	"Analyzed-by:" => "Co-developed-by:",
+	"Analysed-by:" => "Co-developed-by:",
+	"Improvements-by:" => "Co-developed-by:",
+	"Noticed-by:" => "Reported-by:",
+	"Inspired-by:" => "Suggested-by:",
+	"Verified-by:" => "Tested-by:",
+	"Okay-ished-by:" => "Acked-by:",
+	"Acked-for-MFD-by:" => "Acked-by:",
+	"Reviewed-off-by:" => "Reviewed-by:",
+	"Proposed-by:" => "Suggested-by:",
+	"Fixed-by:" => "Co-developed-by:",
+	"Pointed-out-by:" => "Suggested-by:",
+	"Pointed-at-by:" => "Suggested-by:",
+	"Suggestions-by:" => "Suggested-by:",
+	"Generated-by:" => "remove",
+	"Celebrated-by:" => "remove",
+);
+
 our @typeListMisordered = (
 	qr{char\s+(?:un)?signed},
 	qr{int\s+(?:(?:un)?signed\s+)?short\s},
@@ -2773,8 +2794,28 @@ sub process {
 			my $ucfirst_sign_off = ucfirst(lc($sign_off));
 
 			if ($sign_off !~ /$signature_tags/) {
-				WARN("BAD_SIGN_OFF",
-				     "Non-standard signature: $sign_off\n" . $herecurr);
+				my $suggested_signature = "";
+				if (exists($standard_signature_fix{$sign_off})) {
+					$suggested_signature = $standard_signature_fix{$sign_off};
+				}
+				if ($suggested_signature eq "") {
+					WARN("BAD_SIGN_OFF",
+					     "Non-standard signature: $sign_off\n" . $herecurr);
+				}
+				elsif ($suggested_signature eq "remove") {
+					if (WARN("BAD_SIGN_OFF",
+						"Non-standard signature: $sign_off. Please consider removing this signature tag.\n" . $herecurr) &&
+					$fix) {
+						fix_delete_line($fixlinenr, $rawline);
+					}
+				}
+				else {
+					if (WARN("BAD_SIGN_OFF",
+						"Non-standard signature: $sign_off. Please use '$suggested_signature' instead.\n" . $herecurr) &&
+					$fix) {
+						$fixed[$fixlinenr] =~ s/$sign_off/$suggested_signature/;
+					}
+				}
 			}
 			if (defined $space_before && $space_before ne "") {
 				if (WARN("BAD_SIGN_OFF",
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
