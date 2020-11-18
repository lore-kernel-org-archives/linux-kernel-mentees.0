Return-Path: <SRS0=ImFK=EY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38071C5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 17:40:07 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75EC9248EB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 17:40:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X2LF+AjA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75EC9248EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AEF3B84A0D;
	Wed, 18 Nov 2020 17:40:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hP9q6PWClQwy; Wed, 18 Nov 2020 17:40:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2A4AE8495A;
	Wed, 18 Nov 2020 17:40:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B772C0891;
	Wed, 18 Nov 2020 17:40:03 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44DE2C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 17:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 26E8584961
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 17:40:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7bdpXBDf9mq9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 17:40:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 249CF8495A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 17:40:00 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id w4so1656624pgg.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 09:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vUqC2GIz0E9EfM8BF8xpOcOz2of65Zs+pAR3Lb78uWA=;
 b=X2LF+AjAnSHWkux0ep5/j+UcK/wT+nWLchMs7XXFONqfxpaQrXJjHnNOl7o04+R0+V
 nul+snS/+BomNvOWTn+yczIxqQlgU+hOMa/ao3prvdwMCAX5PtVCIxncTrcDXtp6KKXW
 KeWMc8sE5kBmiDSbE4XjfzaOKKtB0jBaOUNPVlEeATF5EAih2CABJPhKDJx0FJtT2h3Y
 lflU8MX6Em04uQS2132HJau/byKESi/KIVVWSZoOBbkIdGIQAcumY+kVm2MlDkoDIF9f
 UIxjxHuYjTdb7Zr00Ff4HhRQ77cuz6J9USQgIiTEDRL9VqP25UNGXUMeIw2FH2zh2zdw
 ICiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vUqC2GIz0E9EfM8BF8xpOcOz2of65Zs+pAR3Lb78uWA=;
 b=TTAc8cHQUhNdDVFtHKZBUW44DLN29itg1LTAuK6HY348u2fEhtkKTzifS5aiL7wkZ2
 VQMVyfymUu0/U1g0FUEiiBTTftdd/iS0uW9t9zj/qPerhNcM0mkAz6P1Jtb7fGdXGCaS
 n/FGiPKaMzyZXj/DlWvsNe2G9aLi0OXPs64jb7ihwsxb+Z4y0KtjHUYs3tUpymGvfdrH
 Td0bquei42dSERMKVk26e7a4t+WvrvCPqPEBV418UVG6VVr8+MJ9UxLyTD5+6l6Ii3sP
 CRG3auuvJiDIkmj5MSEx0IXmhG6oxAwySHKk6XNDiXXY8FtW9BH7aqZH6uXEnvfa+PtB
 DoVg==
X-Gm-Message-State: AOAM531j0i2qfDCr2SqEF8w9Q/lhIhetGnwKl4Vv4fCVWWUV13GCCu/E
 h2b4Od1rkCu2X5Jw3EdGAkw=
X-Google-Smtp-Source: ABdhPJxiMK7L6Tb8tUzoMTyhceXAALO4earsGxvwXEnQY8HP39HdYhYbxTFa/9sC2tjdLKB5KhLVRA==
X-Received: by 2002:aa7:9709:0:b029:196:45d6:88d4 with SMTP id
 a9-20020aa797090000b029019645d688d4mr5552982pfg.27.1605721199410; 
 Wed, 18 Nov 2020 09:39:59 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:43c:f24e:b031:6d03:e76d:9978])
 by smtp.googlemail.com with ESMTPSA id
 v191sm25684004pfc.19.2020.11.18.09.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 09:39:58 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Wed, 18 Nov 2020 23:09:50 +0530
Message-Id: <20201118173950.32660-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <357371d0-a445-181a-3565-a3ec0debc622@gmail.com>
References: <357371d0-a445-181a-3565-a3ec0debc622@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix option for
	NETWORKING_BLOCK_COMMENT_STYLE
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

Currently, checkpatch warns us for files in 'net/' and 'drivers/net',
if we use an empty '/*' line for comment and contents of comments are
in next line

E.g., running checkpatch on commit 0d52497ac8ee ("iwlwifi: pcie: remove
the refs / unrefs from the transport") reports this warning:

WARNING: networking block comments don't use an empty /* line, use /* Comment...
+		/*
+		 * If the TXQ is active, then set the timer, if not,

Provide a fix by appending the current line contents to previous line
and removing the current line

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
Changes in v2: modify commit message: add information about networking files in commit message

 scripts/checkpatch.pl | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index f61ac7456151..90e863d63097 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3629,8 +3629,14 @@ sub process {
 		    $prevrawline =~ /^\+[ \t]*\/\*[ \t]*$/ &&
 		    $rawline =~ /^\+[ \t]*\*/ &&
 		    $realline > 3) { # Do not warn about the initial copyright comment block after SPDX-License-Identifier
-			WARN("NETWORKING_BLOCK_COMMENT_STYLE",
-			     "networking block comments don't use an empty /* line, use /* Comment...\n" . $hereprev);
+			if (WARN("NETWORKING_BLOCK_COMMENT_STYLE",
+				 "networking block comments don't use an empty /* line, use /* Comment...\n" . $hereprev) &&\
+			    $fix) {
+				if ($rawline =~ /^\+[ \t]*\*\s*(.*)/) {
+					fix_delete_line($fixlinenr, $rawline);
+					$fixed[$fixlinenr - 1] .= " $1";
+				}
+			}
 		}
 
 # Block comments use * on subsequent lines
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
