Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF03C43457
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 13:57:15 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61E8C22227
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 13:57:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mG3N0433"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61E8C22227
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C9F39878E1;
	Wed, 14 Oct 2020 13:57:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l37nO1tQ3AIp; Wed, 14 Oct 2020 13:57:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B6C7587639;
	Wed, 14 Oct 2020 13:57:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8CA21C07FF;
	Wed, 14 Oct 2020 13:57:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00859C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 13:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E7ED687D86
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 13:57:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bo7c+nclj2Gu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 13:57:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EC5F487690
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 13:57:07 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id d6so1785002plo.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 06:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IzJhHTSFV4aE1sSC7KkXjqi2ufY0RfaV89jrFKTw/jI=;
 b=mG3N043341+5bBtnNcnr9MpI8mZhDJ7O7vwn1aWOUOCDmVIzvL/RvyY+Mdse/Aq5l4
 4FTNBIpY1+cr9nJpLS65/3s+myXHhJTOqmQVTf5Co4ksEfZr1bF3rtDAGq0DnSxGtHX9
 YqupM7tAm4Hg76dHvFxoIX8fRQqR/zacae1kp23eovKg9tVGd4sDokQBbkwq0in9pnZM
 s/YT/QYjKaU2ETfSN9QkPp0QzNZjefzGYmyrwjZ51k4JrerQtqYl6gTU60/FI+tYpzAf
 /Ywz9a1PO9vPoqJ+Kd+1Rf8m57lYaLb75qEq8FgqjjTzO8GwhTKqYHgTKMl+DGixMyME
 XQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IzJhHTSFV4aE1sSC7KkXjqi2ufY0RfaV89jrFKTw/jI=;
 b=tpEQ7n/fGMAyUmYvo5Ep60sOCcEMdcakEtF1rZ6i/RfYsFbKc+c50BXmcvMQ320ZxZ
 hPF3bc6lIXrYZLLWsQQAIbcazRaJihCd11X3IsO0e4LS4fovIFEKy/yPq5EDeFzakYAx
 pMPzaTiDexcWZjsbcxgf0b4k+FcXU95NHl3VA2HvawdTKLYNqBMiydd2xAYbTzUw7hXW
 7rIVN89ubqYBWUUl5ZyKeSK55+QHudI/FR93L1oqIdrvFQZb45YPtlpoiwrhvZna1Vkb
 6NZcfqCr1ks5SAPDndFjml9hPSJQTpm7ziWkmAD73VSMZsoe/HYrVIj/7ikT3LCrRDxl
 /jaQ==
X-Gm-Message-State: AOAM531SnZdZeMRmkvuRdGPWWYyRbByPImitiqiK6h17VcCiKfF2Eusk
 DygBNrCnUZZfqk1QDsEMooc=
X-Google-Smtp-Source: ABdhPJyLKgvVi4cNhtcF1kmM5+5IYdJex9SfZsjFsZoLMQOErJnj4IR4XhMvD7AsyykNItj+W6IFcA==
X-Received: by 2002:a17:902:d394:b029:d3:f13b:5ef0 with SMTP id
 e20-20020a170902d394b02900d3f13b5ef0mr4497407pld.64.1602683827303; 
 Wed, 14 Oct 2020 06:57:07 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:686c:a3bc:1846:e23f:17d])
 by smtp.gmail.com with ESMTPSA id
 fa12sm3275824pjb.25.2020.10.14.06.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 06:57:06 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Wed, 14 Oct 2020 19:26:37 +0530
Message-Id: <20201014135637.92319-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add new exception to
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

Add 'git' to the exception list for repeated word check. This effectively
fixes all the newly generated false positives.

Fixes: 4f6ad8aa1eac ("checkpatch: move repeated word test")
Link: https://lore.kernel.org/linux-kernel-mentees/b6cd81b936671a8868fe98536d7c80771bdfd61c.camel@perches.com/

Suggested-by: Joe Perches <joe@perches.com>
Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index f1a4e61917eb..b55d83360366 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3063,7 +3063,7 @@ sub process {
 				}
 
 				next if ($first ne $second);
-				next if ($first eq 'long');
+				next if ($first =~ /(?:long|git)$/);
 
 				if (WARN("REPEATED_WORD",
 					 "Possible repeated word: '$first'\n" . $herecurr) &&
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
