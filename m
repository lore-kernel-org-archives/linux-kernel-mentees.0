Return-Path: <SRS0=gqjg=EX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA32C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 10:43:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 309F7222E9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 10:43:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grg9srC5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 309F7222E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BA21B866A3;
	Tue, 17 Nov 2020 10:43:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u9BozrDsnpJ5; Tue, 17 Nov 2020 10:43:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1E362866A1;
	Tue, 17 Nov 2020 10:43:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F3CDEC0891;
	Tue, 17 Nov 2020 10:43:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 658BAC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 10:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2A4F0860F9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 10:43:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gbUm7ZchnNmP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 10:43:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E19FC85D8D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 10:43:08 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id 35so5850684ple.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 02:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=MmCyrE3hf2M0vo+o59jQTL34aLaArEWfSqzooZT9tZc=;
 b=grg9srC5r0C31m+RLB8TbWgu8XSE8Y4mgV24Pg5JmbBGNaX2px/nA6gpmgkmN8b1R2
 E8JE34XZ3z5FkTRVBRulvL+gBsUhA0BA0ubId2ZBmBPqYHkmjUYpF8yhLUpej8QC27uG
 7NWeQ+4fd2/YsBDBvkCnVOBwz8tB70PxrhsNwFi2K1Y+mIPBV8DKMtVAZOuhKZlBXJ7K
 nx6dYHqrZol8oA2ggLX3X/kqwWN/0Ab4AoqQhiih/DWvMjRBP4GgQHn0D2OSwH+5mTtI
 NqGGO4TIrMcCyUggPJ65Kx/S73epOKDXoMHYOTMmjz03I/D+7+Hf6teXyOZkwpwi2e5p
 0jmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=MmCyrE3hf2M0vo+o59jQTL34aLaArEWfSqzooZT9tZc=;
 b=YBbEUEJwl2oP4zqprEkTLkGdykJKZ96ToAHbtP6W7mtFHzVMSesQ2f+2CHNzhoXg+u
 EBfE6r8Ko4Sie2Yn3KHcvYaC7UDBvcNSyfogAjiyaewCsjKV+QUNyHeqTqzvkoaIr+dK
 qUuwwW4FDC2p8GHo1dPQWwqIq8PBCyKi7SxUV2TfPBWKdywyOGDBJwL6RI7as2ERMQWW
 FQ4e0l5wpST8/vE5HJdGPH7Lgv64bfjLo+XhziYIRlO2YZgfVxvDlAUNQUbZBOvXzXD5
 A9ST8pNaH1DXym0DwIA0dcGMSpxhU9p3Fv+bElZdB2y9QE+ycKF0nAY46y+/Dfw2wCU7
 Kidg==
X-Gm-Message-State: AOAM530fO0KaUprgbifXYeBBpEmZUX2MDshbRlGWoatiCBHNaFaTuWsQ
 5l9/ip5+qCUnDKKfur0cI7M=
X-Google-Smtp-Source: ABdhPJycB8aWVMzRqsbatfd3DAJ9y4Yt7X6ki2mf+s2K/bXTypZzAkHVqbv/8oEN8t7AlqtdvIykUw==
X-Received: by 2002:a17:90a:f317:: with SMTP id
 ca23mr4020431pjb.141.1605609788302; 
 Tue, 17 Nov 2020 02:43:08 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:425:6282:bc1b:1de0:7718:e8a1])
 by smtp.googlemail.com with ESMTPSA id
 e17sm22432722pfl.216.2020.11.17.02.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 02:43:07 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Tue, 17 Nov 2020 16:12:59 +0530
Message-Id: <20201117104259.32753-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	LOGICAL_CONTINUATIONS
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

Currently, checkpatch warns if logical continuations are placed at the
start of a line and not at the end of previous line.

E.g., running checkpatch on commit 3485507fc272 ("staging:
bcm2835-camera: Reduce length of enum names") reports:

CHECK: Logical continuations should be on the previous line
+	if (!ret
+	    && camera_port ==

Provide a simple fix by adding logical operator at the end of previous
line and removing from current line, if both the lines are additions
(ie start with '+')

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 5b1a5a65e69a..f61ac7456151 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3553,8 +3553,14 @@ sub process {
 
 # check for && or || at the start of a line
 		if ($rawline =~ /^\+\s*(&&|\|\|)/) {
-			CHK("LOGICAL_CONTINUATIONS",
-			    "Logical continuations should be on the previous line\n" . $hereprev);
+			my $operator = $1;
+			if (CHK("LOGICAL_CONTINUATIONS",
+				"Logical continuations should be on the previous line\n" . $hereprev) &&
+			    $fix && $prevrawline =~ /^\+/) {
+				# add logical operator to the previous line, remove from current line
+				$fixed[$fixlinenr - 1] .= " $operator";
+				$fixed[$fixlinenr] =~ s/$operator\s*//;
+			}
 		}
 
 # check indentation starts on a tab stop
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
