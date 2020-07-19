Return-Path: <SRS0=eJeJ=A6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC1E5C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 19 Jul 2020 17:16:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EBA3208B3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 19 Jul 2020 17:16:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rn+hcmkU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EBA3208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 55A5C81D62;
	Sun, 19 Jul 2020 17:16:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GMLjHLX1Tqv6; Sun, 19 Jul 2020 17:16:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 86C4987AF4;
	Sun, 19 Jul 2020 17:16:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A14EC0890;
	Sun, 19 Jul 2020 17:16:05 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56F10C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jul 2020 17:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 52DB686773
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jul 2020 17:16:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BCgAf7RXWIoJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jul 2020 17:16:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B684C86762
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jul 2020 17:16:03 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id s26so7897242pfm.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jul 2020 10:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jluuUTdevNi+OhGASbZE6Sv7mwM7JdJgAbLh330Jkdc=;
 b=rn+hcmkUPSFkuIEH+iy3Hmw9CxxCfUQ1miMsh6u/h7cpjy4y2feL1872yuvQjVwFHL
 Th/YzXn11xhz9T4UZFuS3o5B1Sb39Uj5OaD5FU9vitxA6VncP0ldxi1wgVSvKDr9fn75
 xYN/sDmDyR1aAiua+G8R7A5Ff06N9aR75M96yNII6WWJEfu0BaEKRjWWzNA5AjpDyrvV
 47OuT1fLaoSMFJHrOzqn/7tnyzG96O1vPdIAxjeY62+LuT3RAAtxMTlhc8cDO3EBRhmU
 g+66tpJQLWeLPTWA4rrljvXOPtQ7plCI07mUPUaEnZZozCLo97VnBvP6jdveViWBKEOH
 lkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jluuUTdevNi+OhGASbZE6Sv7mwM7JdJgAbLh330Jkdc=;
 b=pJMa17eAsaHliWNkhqwj2nZFMqtp+2toKQlRfBk7B2v9U8rMdn3rHRILdQ7nAjsPPF
 FU4M6ZF0gJgy6aO4fwDNykWiYfQHHSxALJ4HviOl6tQBnLerJKxkl3Myj0zDUhWKdSro
 ZvDCQ7LtnD5IynnaH/b5ZvxumQ+SuXMkMNBHGYqNDam/jhdLy1v0uAtELDmyjZpiuP8s
 Cuj/xuKpgeocI2XsjGztP4ex7GH2j18r/+8Usl40+cvinvGT/cy1piIfEhcAHh8HuW5j
 CE5CFQEupqCTED305Pf6DxJ+a5iy8q62/hPoX5pcXHnQiZ+qtdhb/S51fMM+iWXVslWb
 xu5g==
X-Gm-Message-State: AOAM530EBLwWmrNppPCCuRuGxg2I0lv07SbW09vwu55EEkHEVHJ6UQzk
 Os4joZjitOs9Kw9nSflRMaY=
X-Google-Smtp-Source: ABdhPJw6//eGtHZaQfTTpDwUoCzN5NqLZqvvt6nxMUrjHMj8Lm4OeryyUGfiG2Ri6cAMjAgnyNhSeg==
X-Received: by 2002:a63:931b:: with SMTP id b27mr15461487pge.135.1595178963346; 
 Sun, 19 Jul 2020 10:16:03 -0700 (PDT)
Received: from endurance.iB-W4G311N.setup.in ([59.95.37.11])
 by smtp.googlemail.com with ESMTPSA id
 u73sm14225823pfc.113.2020.07.19.10.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 10:16:02 -0700 (PDT)
From: Nachiket Naganure <nachiketun8@gmail.com>
To: lukas.bulwahn@gmail.com,
	skhan@linuxfoundation.org
Date: Sun, 19 Jul 2020 22:45:54 +0530
Message-Id: <20200719171554.264462-1-nachiketun8@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <nachiketun8@gmail.com>
References: <nachiketun8@gmail.com>
MIME-Version: 1.0
Cc: NachiketUN <nachiketun8@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] Checkpatch: Disables commit length
	check/warning in commit log in case of valid signature tags
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

From: NachiketUN <nachiketun8@gmail.com>

Signed-off-by: NachiketUN <nachiketun8@gmail.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 197436b20288..8db0f26601c5 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2799,7 +2799,7 @@ sub process {
 
 # Check for line lengths > 75 in commit log, warn once
 		if ($in_commit_log && !$commit_log_long_line &&
-		    length($line) > 75 &&
+		    length($line) > 75 && $line !~ /$signature_tags/ &&
 		    !($line =~ /^\s*[a-zA-Z0-9_\/\.]+\s+\|\s+\d+/ ||
 					# file delta changes
 		      $line =~ /^\s*(?:[\w\.\-]+\/)++[\w\.\-]+:/ ||
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
