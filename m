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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2ACDC63697
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 20:21:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DF5A221F1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 20:21:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R17JdDlR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DF5A221F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F0311870B9;
	Tue, 17 Nov 2020 20:13:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Rx3wRG0QQGe; Tue, 17 Nov 2020 20:13:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0DFBC86FFE;
	Tue, 17 Nov 2020 20:13:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA3C6C0891;
	Tue, 17 Nov 2020 20:13:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3A25C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 20:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E6F0885624
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 20:13:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3rVa-wPH0w3s
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 20:13:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3418A850EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 20:13:39 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id k7so10885321plk.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 12:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OiYQHkYqtsWMrbxAgg5uqvn4s6SS9WvyA+bC9y6faaY=;
 b=R17JdDlRo48mLGhSs6XeKtxCd/fu4bpFLuaEFmc8ZMHMDr3aDitOWgqqGLijKWHl/P
 IiLYb8cCijUklpvexTBp/Q8gy0rjjLX8lt+qQAQxNc7SwzUEbh4QUn641oHOS+M9w2M5
 NAeUi0htAsPgjLfoUehQLP8XISiFg4YL1cqh/yyL9Pw4NizuvrT4j3ApWFrtQuuB7o3p
 cKE2ODKmIr6COpu+7uWRDhctCGbNBgDtSl8K39ugDAVR8zvRv0+z0CnVvnPO0C0VxLoo
 hS+sq6UeP8JgVC0EEorjAzkhbtoybXnlffTNk8sJufS9nrHQpp3lvUEueQg0g3ip0oLA
 x+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OiYQHkYqtsWMrbxAgg5uqvn4s6SS9WvyA+bC9y6faaY=;
 b=j/p7pZKVxH1IAT63otN2jmoYpe2/TYXXF5ca1ESVBY/ziEKqRph7+t96+3DbkhuaNT
 ctqOmVO48sxh6tunzo4zcvnyhEIYqtsglTAX4048qYF9YeinTAI9cjcAfRvxuCf5VJ8a
 siARAKoy6QiRUYOs2HLuQ82i+ratnCaQ0xJZ6hUpFfF9yP5tR5NGcFOdYxQNRLE+YsD/
 VO9couTHx8YyeLCtx/JeAMRlceZgUX1E9VVHvuzYZ6Oy5+bH50VOxW6U7mx22vXMGCXD
 75l5irYxXHP8flOE+04hGnN4P6MA4Dz+qF17XoTcEDrDBrFeYMBQF40V2siADMP/zDgX
 k4iQ==
X-Gm-Message-State: AOAM531IVj88srjQ81cmoJt9SY1gB9/crXwEzBcfrA3TMsX2UNKvHW5d
 YFhYIvKOYjm/ZAma1wv3A3I=
X-Google-Smtp-Source: ABdhPJzUZDYasxQm32VBKPbjzgNfrCYEWVkfOI79WsuSIypR+8vmoT0smq2/7t4nBSsKjBgTvy7Ltw==
X-Received: by 2002:a17:902:d698:b029:d6:b974:13c5 with SMTP id
 v24-20020a170902d698b02900d6b97413c5mr826115ply.13.1605644018679; 
 Tue, 17 Nov 2020 12:13:38 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:60ba:80c7:87c0:8479:8968])
 by smtp.gmail.com with ESMTPSA id d22sm4179462pjw.11.2020.11.17.12.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 12:13:37 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Wed, 18 Nov 2020 01:43:05 +0530
Message-Id: <20201117201305.108427-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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
