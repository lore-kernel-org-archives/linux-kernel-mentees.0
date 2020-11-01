Return-Path: <SRS0=yjWw=EH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D2A3C2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Nov 2020 18:52:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E10C22274
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Nov 2020 18:52:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HIooO0z6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E10C22274
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1F11D86DB2;
	Sun,  1 Nov 2020 18:52:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ob3+krlLvAT2; Sun,  1 Nov 2020 18:52:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8A7C685620;
	Sun,  1 Nov 2020 18:52:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 77166C088B;
	Sun,  1 Nov 2020 18:52:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09DBAC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Nov 2020 18:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E202820370
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Nov 2020 18:51:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UWtQvKm2eXID
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Nov 2020 18:51:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 1540E2035E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Nov 2020 18:51:59 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id k27so12415685oij.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Nov 2020 10:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=KFaeSYRh43G7/j9aXoN3pOj3AsZes0E2zRDX86awKWk=;
 b=HIooO0z6Ugr8C69I5LrlLtLiIU0lghFWNGGX2IFKJYNcCPNub3dF4+ptqUDO9Ddm4h
 KWI0/4hlE1E3NGHNz7q7LTwSSQOjOVyWdj+4E42hd2ngdQHfVfED4VCBbyc/wMtuUJJX
 Wvz3ThSa4ZRsvwTnobgza7hpnOJn5Qu/bN8OfiZResBT52iEJf+wqapvfJYx9D7KcZ4C
 8ozoUWNXQR28fScwfVzhQ3cZamMmaQBWV5JKpKY5xkSU3USklfaYus7Hpg5eBpWytFEw
 NhUsJXCKoi/I7/DLPB03LMVMXst/gKvPl8VnKvOD588ynxjaY8mrddn2dYna0+k/MUbY
 Vz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=KFaeSYRh43G7/j9aXoN3pOj3AsZes0E2zRDX86awKWk=;
 b=bX2M4WZ6Pke81Du2lw/DP+A6p+aXcPJWNNAzCaWrX+u1nMlTdApX3GB18VZx4alf6t
 QIXty6UXhNFUGPyGZ5cL6oowXLPPFHSBaEfbEx7EWTzn005s3DbDst/nwD1weBBgTUMT
 eHlsr8q8x0TBFWF2MSkGP+JsGtzqQkx5goEVxH2XnjEg+vQ6yy3Ah4TKMdC/h+IE03NF
 4ILm9EsNznqArlYiKdljPVdXjbANeRmMbIzNXB26zBLScA7ulnYGPFnvQpwKvfTbiPu2
 n1AzKykJfNLrI/ZyoBxr5LFO09cBKOXRQKOBjK6S9UfTYi2l4srTHL0X3Rh8Jmv3qAQz
 z1uA==
X-Gm-Message-State: AOAM5327ieWjXo2WFyHk2/EZQKKONXHj0cVdQ19hYdKaSpwfoee4SWD8
 KeUIsvWuzstceSLc+rvazDtj/J80emf4CQ==
X-Google-Smtp-Source: ABdhPJy+b1cdTP3YF2joELZpL6TPU86du4a+U8wxru7g5Icc3OJr0frMtgDEhk9rtAQd4jYmP1QA7A==
X-Received: by 2002:a17:90a:5204:: with SMTP id
 v4mr12616747pjh.188.1604254875666; 
 Sun, 01 Nov 2020 10:21:15 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:40c:3397:d01d:7878:b941:f1cf])
 by smtp.googlemail.com with ESMTPSA id kv19sm9493329pjb.22.2020.11.01.10.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2020 10:21:15 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Sun,  1 Nov 2020 23:51:06 +0530
Message-Id: <20201101182106.28568-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add fix for
	DEPRECATED_VARIABLE
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

The coding style of Makefile has been improved to use certain different
variable names as compared to earlier.

E.g., variable name asflags-y should be used instead of EXTRA_AFLAGS, etc

Currently checkpatch.pl warns the user to change variable name with
its corresponding upgrade, but does not have a fix option

Provide simple fix by substituting the variable name with its
corresponding upgrade.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index a0107ed257d1..5fd34a862522 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3266,8 +3266,13 @@ sub process {
 				'EXTRA_LDFLAGS' =>  'ldflags-y',
 			};
 
-			WARN("DEPRECATED_VARIABLE",
-			     "Use of $flag is deprecated, please use \`$replacement->{$flag} instead.\n" . $herecurr) if ($replacement->{$flag});
+			if($replacement->{$flag}) {
+				if (WARN("DEPRECATED_VARIABLE",
+					 "Use of $flag is deprecated, please use \`$replacement->{$flag} instead.\n" . $herecurr) &&
+				    $fix) {
+					$fixed[$fixlinenr] =~ s/$flag/$replacement->{$flag}/;
+				}
+			}
 		}
 
 # check for DT compatible documentation
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
