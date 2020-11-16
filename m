Return-Path: <SRS0=dWhK=EW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE61FC55ABD
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Nov 2020 08:38:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07B9B208C7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Nov 2020 08:38:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlieRbSs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07B9B208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 881F1870A8;
	Mon, 16 Nov 2020 08:38:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kPShqfh8Xy0i; Mon, 16 Nov 2020 08:38:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8CA1D87074;
	Mon, 16 Nov 2020 08:38:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71232C0800;
	Mon, 16 Nov 2020 08:38:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1973EC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 08:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EA30585F46
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 08:38:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LPU1chXaci1Z
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 08:38:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 67D7885F4D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 08:38:06 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id x15so8070527pll.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 00:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=WiKXLY/e64nqLzEROzawOCPF5yuNSt2KsJE3wDL+hG0=;
 b=UlieRbSsJkdSMHAShiwmqv0g2mVeEvRzppJZpDLhEbmemUYktcQl0yNFkC0lW9aoLS
 i0M1Yjz2tLMt1Og2tnqqhw/Ch2ZoCM3H+/byU1ZUVzkvOpE0aEww2uVapxz+6lJcysDp
 PtrW23oa3DMGz/80Or22ywSi7ntEubOIufEWqmYY08g0WkkMWSEcHeQE3AskFNLkwuiV
 BhJhPo6soXewSOIAj//g3rJ2FX0trATpEfIIqIxFQS+VKdawsEXlWWSYDSYgTI0OQjfO
 EZskMYDqPVdFX32eVzPQWQvco1NJW0He7ICXogaQxarNNC9dryjjaKNSKVxV08m1Q8Wc
 OWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=WiKXLY/e64nqLzEROzawOCPF5yuNSt2KsJE3wDL+hG0=;
 b=Sgu1FKIEaUPIH9XOlN5fDGA3x5UhfDvxHb+ycGDUmbRJRqC7m/nPKIclxNGCJuCipw
 OSZge+yGfg6bvbWHit/F9fh1y6BfZlcnedcCBxSICbabIVFxaOTxFTLIxN70KkYWg1Wf
 AF0Ch6OEbveaML1prfH/7i1lq24sBPg9xJdFblZxLOOGeJmPJcYYTAJ72Mbq4uqvJMD0
 FsF4ef45/cN3XE4WC+ceYFVX5d7Sm3EVVGcURlmiCDYrQ0CuS9MaM7JM9p10xdhCEf09
 GHxSghPKqT1w7dYiTpWRt98DFkoAbbWoWfcMXo5U50VV/kMmn8T5brJryyTwLxZgd+GW
 elyA==
X-Gm-Message-State: AOAM532bG+yYwIFV4XE4PpXsAvXd9yREXMRTyt2lj1Q8Wb656goPvPT4
 6uNmVmdsLQ0KE41uHCaghrc=
X-Google-Smtp-Source: ABdhPJwELoBVlXDHbxY3wpR7gBLoCAH3kJJmwacUVPeq2NFAi1ZqUbuX53Wu2dHHQIhrVQ7KtOJDIA==
X-Received: by 2002:a17:902:b688:b029:d6:ad52:ffab with SMTP id
 c8-20020a170902b688b02900d6ad52ffabmr12026353pls.61.1605515885866; 
 Mon, 16 Nov 2020 00:38:05 -0800 (PST)
Received: from localhost.localdomain ([42.111.137.21])
 by smtp.googlemail.com with ESMTPSA id p19sm17417034pjv.32.2020.11.16.00.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 00:38:05 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Mon, 16 Nov 2020 14:07:54 +0530
Message-Id: <20201116083754.10629-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v3] checkpatch: avoid
	COMMIT_LOG_LONG_LINE warning for signature tags
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

Currently checkpatch warns us for long lines in commits even for
signature tag lines.

Generally these lines exceed the 75-character limit because of:
1) long names and long email address
2) some comments on scoped review and acknowledgement, i.e., for a
dedicated pointer on what was reported by the identity in 'Reported-by'
3) some additional comments on CC: stable@vger.org tags

Exclude signature tag lines from this class of warning.

There were 1896 COMMIT_LOG_LONG_LINE warnings in v5.6..v5.8 before this
patch application and 1879 afterwards.

A quick manual check found all the dropped warnings related to signature
tags.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
Changes in v2:
modify commit message: remove specific commit example, add cause of the warning instead

Changes in v3:
modify commit message: minor english fix; remove difference count, add relative counts instead

 scripts/checkpatch.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index ac7e5ac80b58..f2369ac29d50 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2961,8 +2961,8 @@ sub process {
 					# file delta changes
 		      $line =~ /^\s*(?:[\w\.\-]+\/)++[\w\.\-]+:/ ||
 					# filename then :
-		      $line =~ /^\s*(?:Fixes:|Link:)/i ||
-					# A Fixes: or Link: line
+		      $line =~ /^\s*(?:Fixes:|Link:|$signature_tags)/i ||
+					# A Fixes: or Link: line or signature tag line
 		      $commit_log_possible_stack_dump)) {
 			WARN("COMMIT_LOG_LONG_LINE",
 			     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
