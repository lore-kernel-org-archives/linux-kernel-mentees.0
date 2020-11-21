Return-Path: <SRS0=QJT4=E3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E817C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 04:58:42 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3A4C221F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 04:58:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OcXNyyKO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3A4C221F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7B39886D1C;
	Sat, 21 Nov 2020 04:58:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rPieDdhPON64; Sat, 21 Nov 2020 04:58:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6C63C86C34;
	Sat, 21 Nov 2020 04:58:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 500D5C163C;
	Sat, 21 Nov 2020 04:58:40 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1EE59C0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 04:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EFA472E112
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 04:58:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uskzNWwfrKmD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 04:58:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by silver.osuosl.org (Postfix) with ESMTPS id 4274F20420
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 04:58:38 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id j19so9148542pgg.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 20:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YxjPjJ3G6YcYMUb8AiVipV2sNLNh3DT5WDah/0YUj28=;
 b=OcXNyyKOtEwj1H+vOMKvmfycRfrcoxbuds5w76h8obAlWnsFK1HDwQ6bVQ0F9zJkKe
 bOkYbKPNHLk3IFUgoUnR9RShBAjRES0QGHfsgUXng3VGx7jb5+3wzOGQTcovTImxdoLd
 LH70LfviE+kKWVey8nghFA7Ig5LNIr6cm5dq/tZq007QWvZhroDltj9CJ00XGnkVfXAh
 Ijev1wzuiQj2Hh4BtbWFyCIqWhRLRNIUN1G0PEh7fIpgSM14/7pgp1MECsneBe1GVK2X
 zu5o4Qngra8IhbiDcctYZ8Pjud9EVgUP8fpf/XeJGKiSp4+bjD9kt76E+zWWA5pMzrLe
 Sj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YxjPjJ3G6YcYMUb8AiVipV2sNLNh3DT5WDah/0YUj28=;
 b=kwREjNhRECt4I9sAZl2PBPQp5Vdc8sJ3rg6cEZd43x09sDN4fx5kiHo1dFf6WBTJ8/
 7iY/WsA1mf5Tfw2D3wQXFnFTrdvTnSJzgXy6D3Bt8Gv8m00G1+FmJx1VBqMdCvT8dOJ5
 nZa1DyCX2vu7mVAuz6CH9XvO7P8+++cl73vAv8QBdIMfsA6qGZDHKVOlkSCFd+ePjJya
 q00BVDuq8fwyB0QphUeHCqGgATIlVn9GoNaS+qS9PQEzqzHIdwADE8ozB7BG2CpaO1bU
 ogJ2/Bmsmvi+R+5Is4l5bG4Zraoaz9fxm9ArnYtpnIb8HlSkn6SgBbBZ2N54Ti75Q3MU
 bWUw==
X-Gm-Message-State: AOAM5301qIP5KlZZwLAh5lyUkJe7RjAGtzfuLPlAktjorv66AbSha55q
 r/asC0SO/rVwqpDcl82Anrg=
X-Google-Smtp-Source: ABdhPJxqC+fByDlLv6vJ0aIx8GoLMXx8MZ6h9ut+vKuzbiwo7Oo6L7syI7UnpFQFNZmihcUJkhB4mg==
X-Received: by 2002:aa7:9582:0:b029:18b:86c2:23f9 with SMTP id
 z2-20020aa795820000b029018b86c223f9mr17168646pfj.27.1605934717670; 
 Fri, 20 Nov 2020 20:58:37 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:400:4498:ed91:20bf:333c:1bc4])
 by smtp.googlemail.com with ESMTPSA id x13sm5795859pfj.54.2020.11.20.20.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 20:58:37 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Sat, 21 Nov 2020 10:28:27 +0530
Message-Id: <20201121045827.12175-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <4230063e-48b5-8b0c-c92c-fc3e16b5ddb4@gmail.com>
References: <4230063e-48b5-8b0c-c92c-fc3e16b5ddb4@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix and improve
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

This warning usually occurs because of incorrect use of signature tags,
e.g. tags such as 'Co-authored-by', which although seem correct, is not
a standard signature. Its standard equivalent is 'Co-developed-by'.

An evaluation over v4.13..v5.8 found 'Co-authored-by' tag used 43 times

Similarly, 'Requested-by'(used 48 times) has its equivalent as
'Suggested-by', and so on.

Provide a fix by:
1) replacing the non-standard signature with its standard equivalent
2) removing the signature if it is not required

Also, improve warning messages correspondingly, providing users
suggestions to either replace or remove the signature

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
changes in v2: replace commit specific example with brief evaluation

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
