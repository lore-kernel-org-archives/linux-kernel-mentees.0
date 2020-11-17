Return-Path: <SRS0=gqjg=EX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 478BDC2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 18:13:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 854C32465E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 18:13:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3V9zN1l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 854C32465E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 11F22858D4;
	Tue, 17 Nov 2020 18:13:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DL2CKLWEm1Ou; Tue, 17 Nov 2020 18:13:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AA3E185876;
	Tue, 17 Nov 2020 18:13:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 990B5C0891;
	Tue, 17 Nov 2020 18:13:10 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF93BC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 18:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EB5D0862D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 18:13:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1nRMV5sRCY0B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 18:13:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7F041862F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 18:13:09 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id 35so6507187ple.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 10:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OiYQHkYqtsWMrbxAgg5uqvn4s6SS9WvyA+bC9y6faaY=;
 b=F3V9zN1l20Pniu4roL5x739aIOTwe/dNc5fIgH9CqFlE3E0OHy1WchaWkai803522e
 X1trn9hgZ2nJEOaEtsB0sth8FK20M4ru+r/y0aiRl05ArRxJSD164Dh2Nw+aCp1A+NBN
 TT8h2DTZc3gtvXldIj8VPx7FFICC8O8z4bF2A7RpSJetoKzj5o6+HzIUVVDsmm6urMI1
 YZXLyWOlyk8cQIlVEiDedipOg/UzsVQ2E9kEpZHsz27Z6jamr0k3sXl8ENf/JUDYfaPK
 3WDzGyKKe8Ik10f6zZvmSaq23UJPnEXpIbh/R9IFsG4FrP0y7I5DxogNdalFshDjn0Ui
 WINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OiYQHkYqtsWMrbxAgg5uqvn4s6SS9WvyA+bC9y6faaY=;
 b=swXeuoxEn2k6JIiN94Ggt6bsCV0A279CCBsu63lqoLx/nsYM7hwH00nFs+ejfp+jNc
 7I11GC+oAkWhOYhP5z7uIM27B9jlh8y1ecSw8vda6sMA+7zDQIb9i/UWwyRBmqiejuzB
 zs2pu41K8zTgpEIqaoU0gYU/cy2vHxp/WfTovl9X5GKSUHlKxX8TZO3geaC7NYhg8Y3a
 0h3bDU0opJAPKyMAU4rwRXaSC8o7IA6Xzeeh7mQIu5OptV6sSAQDcIAkW079wHf/cYei
 NGpkBVTe0rEaB06C6ixSN3w8tmq1CBIyQUyCGSencAB1NlRg40imjb9JP0TmIKuA2IKh
 MxrA==
X-Gm-Message-State: AOAM530XcD0WaNHr9mJk8Mr/V6v/WlfS5/Cu/26b7Gh4c850Qt9iO44d
 uhX2FsdTBFwR4EYMwDKTE84=
X-Google-Smtp-Source: ABdhPJxUXJRBpE59u+l22/XRhFmNtv57KBSWraQ4lXLRaNRp9h8e1ySMh2dCMewhqJDqzjw5fKscUw==
X-Received: by 2002:a17:902:eb45:b029:d7:e216:513f with SMTP id
 i5-20020a170902eb45b02900d7e216513fmr375842pli.80.1605636789010; 
 Tue, 17 Nov 2020 10:13:09 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:60ba:80c7:87c0:8479:8968])
 by smtp.gmail.com with ESMTPSA id a3sm3341677pgq.53.2020.11.17.10.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 10:13:08 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Tue, 17 Nov 2020 23:42:36 +0530
Message-Id: <20201117181236.101332-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: fix spacing check for
	return with parentheses
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

The spacing check is unreachable for return statements
followed by an opening parentheses.
For example:

int foo(int bar, int baz)
{
	return(bar+baz);
}

There should be an error emitted for a space between
return and the opening parentheses but checkpatch doesn't
emit one.

Fix the spacing check. Also add --fix option to
the check.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 8da6cde20c68..07feeb3321e2 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -5176,10 +5176,13 @@ sub process {
 				if ($value =~ m/^\s*$FuncArg\s*(?:\?|$)/) {
 					ERROR("RETURN_PARENTHESES",
 					      "return is not a function, parentheses are not required\n" . $herecurr);
+				} elsif ($spacing !~ /\s+/) {
+					if (ERROR("SPACING",
+						  "space required before the open parenthesis '('\n" . $herecurr) &&
+					    $fix) {
+						$fixed[$fixlinenr] =~ s/\breturn\s*\(/return \(/;
+					}
 				}
-			} elsif ($spacing !~ /\s+/) {
-				ERROR("SPACING",
-				      "space required before the open parenthesis '('\n" . $herecurr);
 			}
 		}
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
