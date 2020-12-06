Return-Path: <SRS0=OBpN=FK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9F9C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  6 Dec 2020 15:24:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 802102333C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  6 Dec 2020 15:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 802102333C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 07F368685E;
	Sun,  6 Dec 2020 15:24:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RtOQCxpW2RjC; Sun,  6 Dec 2020 15:24:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3BEE186807;
	Sun,  6 Dec 2020 15:24:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1FA68C0FA7;
	Sun,  6 Dec 2020 15:24:19 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA65CC013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Dec 2020 15:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BD77187527
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Dec 2020 15:24:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hg5b3OydhbRS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Dec 2020 15:24:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1A5E28758C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Dec 2020 15:24:17 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id t18so5815855plo.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 06 Dec 2020 07:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M3Ae2sgvqkoZXp5i3Cerbk2Tw31uQ8GglIS/QTIatns=;
 b=WsUKtZW38rRtzfcZQo6FIRiF4JYnnKe9UHQZJ/U2iV5QvQ8vLTZ8cvqPCF+fg7Ek91
 YGpLRv/VKRw9dS7zq5spTNG2/mZkrbXSDnASwtZXyPQZ49Ts1HEDkP9aVbaFxbrlxVkq
 rCTLti1/r9sBwzPvqZY/3BWsCFpECMlX3/1R29XCQn4eAWJsc45Cf3EbBW22aBeEgGkk
 rJP41SHZNWlBOZm/IMcD0Hz+J8twEaviAEeCLJYCJ4ykiqFyjPRY27CcycIjv624FWQP
 8Ru3frKOIF6kO9Y+MixbkUaNbVSdeEU2MihJw1m+GhxJJs7du6zV50YERy0hfm92GBN4
 juIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M3Ae2sgvqkoZXp5i3Cerbk2Tw31uQ8GglIS/QTIatns=;
 b=CsWVf7sCjBXE0aOyJhZQqm4y+yqvp/ZIUlveIQWxkIPqPh3qNJEBbOaNPGgEh5XsF1
 qvu0EYzlhoKtAWq6oHPpjjzM3yHGQbl3yX0QFLvXk9/tZGy9fdl5PleJG6pBXwf6jvik
 EFoEPHwN1qFZD75s6Tw9s0oi5lbwwOGvC1ozrZfLIrI4GEBmagFdlDqycnebMpRguln3
 0ZqHwMSnjYc1ZBcqRaXL6fN/Y/8zUtNO99sOGktIShWNPtzAKl74E5dNQp9CMGiHx7+N
 r+ndHELNMs1BrD+5Mh8NJFsvSPxCLdnqYgIEtDNB0rja3YJAgVcoLqpCRFWza/pB76a6
 p/uA==
X-Gm-Message-State: AOAM533Mj/XTfHfYxJiEMFSe3mAxPqCMhVLN4yJ1bFglSnCY1gAlQrF8
 tOiBQp8Ke5ANGMrQVTeza6I=
X-Google-Smtp-Source: ABdhPJwlGa/1BAFkTLHvDDyth1ifQyMiDlweqBP35eHkvHonneWefUHcNZfrhLKbM2TMmFrgoHneUw==
X-Received: by 2002:a17:902:ba8b:b029:d7:e6da:cd21 with SMTP id
 k11-20020a170902ba8bb02900d7e6dacd21mr12231554pls.38.1607268256572; 
 Sun, 06 Dec 2020 07:24:16 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:681b:efb7:be26:4d99:7d44])
 by smtp.gmail.com with ESMTPSA id m4sm12432863pfd.203.2020.12.06.07.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 07:24:15 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Sun,  6 Dec 2020 20:53:52 +0530
Message-Id: <20201206152352.35026-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v3] checkpatch: add --fix option to
	include linux checks
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

Add fix option to INCLUDE_LINUX and ARCH_INCLUDE_LINUX
checks to replace asm includes.

Macros of type:
 #include <asm/percpu.h>
 #include <asm/processor.h>

are corrected to:
 #include <linux/percpu.h>
 #include <linux/processor.h>

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
Changes in v3:
- Add --fix option to ARCH_INCLUDE_LINUX check

Changes in v2:
- Use \Q..\E quoting
- Use @ as regex delimiter

 scripts/checkpatch.pl | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7b086d1cd6c2..4aecc237ed38 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -5558,11 +5558,17 @@ sub process {
 				my $asminclude = `grep -Ec "#include\\s+<asm/$file>" $root/$checkfile`;
 				if ($asminclude > 0) {
 					if ($realfile =~ m{^arch/}) {
-						CHK("ARCH_INCLUDE_LINUX",
-						    "Consider using #include <linux/$file> instead of <asm/$file>\n" . $herecurr);
+						if (CHK("ARCH_INCLUDE_LINUX",
+							"Consider using #include <linux/$file> instead of <asm/$file>\n" . $herecurr) &&
+						    $fix) {
+							$fixed[$fixlinenr] =~ s@\Q<asm/$file>\E@<linux/$file>@;
+						}
 					} else {
-						WARN("INCLUDE_LINUX",
-						     "Use #include <linux/$file> instead of <asm/$file>\n" . $herecurr);
+						if (WARN("INCLUDE_LINUX",
+							 "Use #include <linux/$file> instead of <asm/$file>\n" . $herecurr) &&
+						    $fix) {
+							$fixed[$fixlinenr] =~ s@\Q<asm/$file>\E@<linux/$file>@;
+						}
 					}
 				}
 			}
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
