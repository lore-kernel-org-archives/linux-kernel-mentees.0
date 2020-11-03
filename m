Return-Path: <SRS0=AIAE=EJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE0DC2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 13:31:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DE272080C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 13:31:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GoWTcNEX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DE272080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 273E885D9B;
	Tue,  3 Nov 2020 13:31:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mnuqKRiFNYME; Tue,  3 Nov 2020 13:31:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8B58F85D8E;
	Tue,  3 Nov 2020 13:31:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7515FC088B;
	Tue,  3 Nov 2020 13:31:04 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51A8CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 13:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3628E2051B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 13:31:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id siWJ5hE0R14f
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 13:31:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 81E672043C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 13:31:00 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id u2so2626318pls.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 05:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=KQLHLBrtjmMC+ApXkx9HRXGZ0HtYQuvRJnHQDIlLu+4=;
 b=GoWTcNEX0P9laYIFvgDaGP1LwZ1MRMSdhsUbyahKAupp+mWhgPMCLyWCHhYu1Y55bp
 UqvEq0itL3nOFyMqjda34iZ9KmTUameJBrbkbRSfOIhW1vzpOHXSg0QPcCqP7K2DjbCJ
 TQdp8T3549hCiNiPyExPuqKyU8ERo/Ovns3gtRMKm8wapvSR/IdRFXI6P84rMayv6jyO
 QmpJv+Om8CYNyEtTwpgxTy0QzYTM2o8IpbnY112yQehBsg6vN8ENi+OQWSDpx7b40WIW
 NOIvk5ekqae1wukSDwHLa13wvGSoez/pcUMMoiheAuYdiJA+QOtMIeW3m1NxJXzJonDu
 9TQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=KQLHLBrtjmMC+ApXkx9HRXGZ0HtYQuvRJnHQDIlLu+4=;
 b=jUf4B4VMePQBVMgZEmj7Xh58UpG7QiPycFcz3a7RBybh2i8WAEOS9N03hKu5KMa6KB
 SELqv1npIqNmhokSSRIey3opAv/rvJKX6rAFg7DszufIpZznsF2y2wV9HRA2ImsTKCj3
 iN1THkRM7UVpTtpQy6MIa+Fa2CzXLjm5XDpyna5hx6IxJyF4/BR8J9KqwfjlVsNpSGQX
 GIwGYSM62RnLD/24if6x/lxGPxMrI4JkrSk7NN3q20o+cVGfk0NnCqQro9jM6H134tMa
 8AYWWX4yKuSdBYTN//qgUrN0SAkCQTfNvQFO2DMBiKGmTF9zN4s+RkyoEbCoCVzcbub3
 N2CQ==
X-Gm-Message-State: AOAM530gZyJudoOV1U9U7GUP/BdGWUp6/FJ1n4tk7q8V9jmRdo2yo91D
 RKpxQF3WdueSKF+zawy8kuo=
X-Google-Smtp-Source: ABdhPJzwcbJMlrZhDYxLRwgsk4rEU9T90wLYokPt8vSLiCt++px6U96WMtWTqe9gsCX+MIltx8iTfA==
X-Received: by 2002:a17:902:7c83:b029:d6:cea4:1740 with SMTP id
 y3-20020a1709027c83b02900d6cea41740mr9051036pll.25.1604410259968; 
 Tue, 03 Nov 2020 05:30:59 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:41d:f163:ac:13ab:8c6a:34ab])
 by smtp.googlemail.com with ESMTPSA id
 v13sm15990809pgl.6.2020.11.03.05.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 05:30:59 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Tue,  3 Nov 2020 19:00:52 +0530
Message-Id: <20201103133052.21053-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add fixes for
	BAD_SIGN_OFF
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

Currently, checkpatch warns if the author signs-off two or more times
for the same role.
E.g., for commit 6dd47d9754ff ("mac80211: fix
ieee80211_txq_setup_flows() failure path") we get warning:

WARNING: Duplicate signature
Signed-off-by: Johannes Berg <johannes.berg@intel.com>

Here there are two Signed-off-by lines present for the same user. So,
we get a warning to remove one.

Similarly, we get warning if the author of the commit signs-off under
co-developed-by.
E.g. for commit 6e88559470f5 ("Documentation: Add section about
CPU vulnerabilities for Spectre") we get:

WARNING: Co-developed-by: should not be used to attribute nominal
patch author 'Tim Chen <tim.c.chen@linux.intel.com>'
Co-developed-by: Tim Chen <tim.c.chen@linux.intel.com>

Provide fixes by removing the duplicate signature line and the
co-developed-by line from the commit

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 58095d9d8f34..4e6cbca495eb 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2818,8 +2818,11 @@ sub process {
 			$sig_nospace =~ s/\s//g;
 			$sig_nospace = lc($sig_nospace);
 			if (defined $signatures{$sig_nospace}) {
-				WARN("BAD_SIGN_OFF",
-				     "Duplicate signature\n" . $herecurr);
+				if (WARN("BAD_SIGN_OFF",
+					 "Duplicate signature\n" . $herecurr) &&
+				    $fix) {
+					fix_delete_line($fixlinenr, $rawline);
+				}
 			} else {
 				$signatures{$sig_nospace} = 1;
 			}
@@ -2827,8 +2830,11 @@ sub process {
 # Check Co-developed-by: immediately followed by Signed-off-by: with same name and email
 			if ($sign_off =~ /^co-developed-by:$/i) {
 				if ($email eq $author) {
-					WARN("BAD_SIGN_OFF",
-					      "Co-developed-by: should not be used to attribute nominal patch author '$author'\n" . "$here\n" . $rawline);
+					if (WARN("BAD_SIGN_OFF",
+						 "Co-developed-by: should not be used to attribute nominal patch author '$author'\n" . "$here\n" . $rawline) &&
+					    $fix) {
+						fix_delete_line($fixlinenr, $rawline);
+					}
 				}
 				if (!defined $lines[$linenr]) {
 					WARN("BAD_SIGN_OFF",
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
