Return-Path: <SRS0=ah7H=DX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58769C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Oct 2020 18:16:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98B5C2083B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Oct 2020 18:16:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9j22U2d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98B5C2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 10E6D88C8D;
	Fri, 16 Oct 2020 18:16:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FyA2CUnqgk4T; Fri, 16 Oct 2020 18:16:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 93C1388C5C;
	Fri, 16 Oct 2020 18:16:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C97DC07FF;
	Fri, 16 Oct 2020 18:16:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0056AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 18:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F015B88C7A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 18:16:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9h5iAQhcWNuQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 18:16:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5456988C5C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 18:16:35 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id az3so1809297pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 11:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yp3z4MH81v/xZq/RblNC6U2i7AEzkzJS/AP9gru2J5I=;
 b=M9j22U2dguy1XEEH+ZqLgTXG+y2kEz3uGte7JO3wFOT5adpid+1MVJ+zQ5g3gDNCDL
 muCxJu1zlGDKeXZoix0dp/3adRzqUsI76ITfyZB9p3IKz6lHLBcx+Ds0b2bWpoLGu8Xq
 WVx4FpzmyzgRME/Jo/FhqZbzwnGyhWeAxt0I1R09VtNAtjKQNUdfoIaSTr3IV6p1eFYr
 wPJA0++POXLpGpRygiqPsUKVus6a7fZxhQ5SxXGcvBPJuW/HyfZ7b+qSQes+k/+8Wcxp
 CSVOzAUZZPX96VrUB6aVDt/qaavrAc9TIyfDzoW7qpMAmWuproSVmzZcbQXX80+r+Pv9
 W+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yp3z4MH81v/xZq/RblNC6U2i7AEzkzJS/AP9gru2J5I=;
 b=bDkL/lwNtun0EyLCqUAKQsq2xia4bTFhSz64dqxq+M8vzak1DxtSEbWwboTAd8obW+
 RLK+7fVJaDIqlBKghWuOIrvp3grqoR8Lml4RhQ0b4tsIFvZOpbRPArZEP+hqrvyIBiM/
 66m7Dw7hqboAvZikeVJxJ6Q+4mxs61sLQ/woWtq5hsUscifj6O6pezT/L3HQ3ZjYwOkZ
 +6wQcDAB5gdlApeU5yHjWeZdQZFJK40rGiLrgufoHahUnJpicowaiSHbz4Rz+eatl7Er
 UXaG8DAiHvVJJSFQ0fL8hsPL2w8yEdY2Y6EzUgrJn0wut1/HtUbSj4JCpVMwnsaprw51
 9PQA==
X-Gm-Message-State: AOAM533BOD2mH9qEjjT2PV5YPXRE20MDQOkHjbPyNRs2G9J6SdFB0JX9
 D8R1XbKrFJ7M1KsJdn6uX0I=
X-Google-Smtp-Source: ABdhPJyZqMEhQkvtYLtQuHoLFOvNXfIH9UVpCfeNAhuuVXDdISnHYLGseTVACrCOW17ebqTSznyKAg==
X-Received: by 2002:a17:902:848b:b029:d4:e5b2:fb9b with SMTP id
 c11-20020a170902848bb02900d4e5b2fb9bmr5221469plo.34.1602872194699; 
 Fri, 16 Oct 2020 11:16:34 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:68c8:652f:fb23:5ed8:226a])
 by smtp.gmail.com with ESMTPSA id e1sm3575227pfd.198.2020.10.16.11.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:16:33 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Fri, 16 Oct 2020 23:46:13 +0530
Message-Id: <20201016181613.129843-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add new exceptions to
	repeated word check
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

Recently, commit 4f6ad8aa1eac ("checkpatch: move repeated word test")
moved the repeated word test to check for more file types. But after
this, if checkpatch.pl is run on MAINTAINERS, it generates several
new warnings of the type:

WARNING: Possible repeated word: 'git'

For example:
WARNING: Possible repeated word: 'git'
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rw/uml.git

So, the pattern "git git://..." is a false positive in this case.

There are several other combinations which may produce a wrong
warning message, such as "@size size", "Begin; begin", etc.

Extend repeated word check to compare the characters before and
after the word matches. If the preceding or succeeding character
belongs to the exception list, the warning is avoided.

Suggested-by: Joe Perches <joe@perches.com>
Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index f1a4e61917eb..82497a71ac96 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -595,6 +595,7 @@ our @mode_permission_funcs = (
 );
 
 my $word_pattern = '\b[A-Z]?[a-z]{2,}\b';
+my $punctuation_chars = '[,:;@\.\-]';
 
 #Create a search pattern for all these functions to speed up a loop below
 our $mode_perms_search = "";
@@ -3065,6 +3066,21 @@ sub process {
 				next if ($first ne $second);
 				next if ($first eq 'long');
 
+				# check for character before and after the word matches
+				my $ca_first = substr($rawline, $-[1]-1, 1);
+				my $cb_first = substr($rawline, $+[1], 1);
+				my $ca_second = substr($rawline, $-[2]-1, 1);
+				my $cb_second = substr($rawline, $+[2], 1);
+
+				if ($ca_first ne $ca_second || $cb_first ne $cb_second) {
+					if ($ca_first =~ /$punctuation_chars/ ||
+					    $ca_second =~ /$punctuation_chars/ ||
+					    $cb_first =~ /$punctuation_chars/ ||
+					    $cb_second =~ /$punctuation_chars/) {
+						next;
+					}
+				}
+
 				if (WARN("REPEATED_WORD",
 					 "Possible repeated word: '$first'\n" . $herecurr) &&
 				    $fix) {
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
