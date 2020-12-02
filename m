Return-Path: <SRS0=wdXo=FG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1FC4C71155
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Dec 2020 18:31:07 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CD0D22248
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Dec 2020 18:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CD0D22248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3F62E878E9;
	Wed,  2 Dec 2020 18:31:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jgo8W-3XdvzL; Wed,  2 Dec 2020 18:31:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 85F50878D6;
	Wed,  2 Dec 2020 18:31:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A02AC163C;
	Wed,  2 Dec 2020 18:31:03 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D387C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 18:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F29BA2E299
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 18:31:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k8WZyYdVCZd3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 18:30:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by silver.osuosl.org (Postfix) with ESMTPS id 7E3292E298
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 18:30:57 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id f17so1607235pge.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 02 Dec 2020 10:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dhu0y36YrMVMaqCIBmDd4/g2nz0PBTxsfK5aIIP2g1A=;
 b=VtPTQMR4jtXGflrx3/rVw/rmlMSkFDj4rjwbT6YMTGzrW7pCU2q4OI7w/xrwqe+RQx
 DKjcdYwi6VHJwWPtd9imSRe3lBgkrIMcUcQ2QADBVJ31NrOkpiZCZITF/0aFOsJwo7CJ
 uGHSNbB6ReRY4qsqcfBgXknpaJe+IA/K767VioWXHBUESkEUHqiB/zzRQcq70eFk5+Cc
 Xop2y5Fq4geLedJWZ/lmiMdHS7fcW0fYhAoDdv4S0XKmyYhcQP8WBLUpiVSfbF5VFcg+
 1AwuVXdz/AGNDQW55vOQkaNRQzc5lBo1tWx6VPRfznux6FpNwmHF56aIixADB5Rfx6zP
 kGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dhu0y36YrMVMaqCIBmDd4/g2nz0PBTxsfK5aIIP2g1A=;
 b=P/jAT7Pvl/oCj2IYP6eIH5HqDttf/Evo0bKVq7afZXtvphAHHNg7wcKUE1WnX0/fFC
 RtAddw8chZdrfILKG4uKz6VYPzdmi8+7SCr8dOt+1iszDaLVpupyvS0SARTmDJ/zpkrh
 itpGbBHU8OVRcy89wJBMw1Uk9PRs2RSrWhAu9rZj3wqY2DyfnlB3pYBR3afbQXMwBH6O
 mLnsvfQXbtoPAHXWz/udEeHJcgh/llSmI270q1eynmt6D5pz40Wyfjb08ZCbi9ywixCF
 zYA01i3bztBRbaYIFWa6tFGVuMHIIC7ZrrNTrm2p25HdFvKbeLY9FWR9qgWo9nQQaBxT
 +e2w==
X-Gm-Message-State: AOAM5333BMtS7xhYbsn8Xcb1fADGp7tlTl4qV6benK3oNcrRunchJQ2n
 ICr3hgjqDY32j7WKhMgVMw0=
X-Google-Smtp-Source: ABdhPJxyuChm6ZlTgOgmUuuyWGzkTc4HRQKmNPb6bwVEDKEX6dVavLARWsOHOWBkyAUZQyAZLb0m0A==
X-Received: by 2002:a63:f60e:: with SMTP id m14mr1076364pgh.148.1606933856979; 
 Wed, 02 Dec 2020 10:30:56 -0800 (PST)
Received: from localhost.localdomain
 ([2409:4063:4e14:4867:9984:8aed:2f75:bf22])
 by smtp.googlemail.com with ESMTPSA id s17sm429716pge.37.2020.12.02.10.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 10:30:56 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Thu,  3 Dec 2020 00:00:45 +0530
Message-Id: <20201202183045.9309-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <280235acc0e91365f3fd3b5be5a5244eced1ff61.camel@perches.com>
References: <280235acc0e91365f3fd3b5be5a5244eced1ff61.camel@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH -mmots] checkpatch: add fix for
	non-standard signature - co-authored-by
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

Currently, checkpatch.pl warns us for BAD_SIGN_OFF on the usage of
non-standard signatures.

An evaluation on v4.13..v5.8 showed that out of 539 warnings due to
non-standard signatures, 43 are due to the use of 'Co-authored-by'
tag, which may seem correct, but is not standard.

The standard signature equivalent for 'Co-authored-by' is
'Co-developed-by'.

Provide a fix by suggesting users with this signature alternative and
replacing.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 4a026926139f..fc036d545d2d 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2832,6 +2832,9 @@ sub process {
 
 			if ($sign_off !~ /$signature_tags/) {
 				my $suggested_signature = find_standard_signature($sign_off);
+				if ($sign_off =~ /co-authored-by:/i) {
+					$suggested_signature = "Co-developed-by:";
+				}
 				if ($suggested_signature eq "") {
 					WARN("BAD_SIGN_OFF",
 					     "Non-standard signature: $sign_off\n" . $herecurr);
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
