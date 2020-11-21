Return-Path: <SRS0=QJT4=E3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3415C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 08:09:46 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E12B2223F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 08:09:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HrFGH+fX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E12B2223F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0CB2F86CB5;
	Sat, 21 Nov 2020 08:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2FDCoGZ-BCVe; Sat, 21 Nov 2020 08:09:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 328468547D;
	Sat, 21 Nov 2020 08:09:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21786C163C;
	Sat, 21 Nov 2020 08:09:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6E60C0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 08:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A84EC8707C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 08:09:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wj3vEotMfoyO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 08:09:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3231E86F86
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 08:09:29 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id v21so4899433plo.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 00:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lTLpqp7Aal91RYPJOEsqEB7xHK/i1gxcmA4vDgFrBlM=;
 b=HrFGH+fXl10KsZvrY9Kc6EU3McFKGCeUKPwEb7LQRV6hFYQ7YwWTPylzFCs3eiIPHR
 yt2dliT+w5+N0Dsqa1gFZYOlhW4RRB13XQTIfT2jCH5wYE/EQa4bkvN6pht7nnEBRz/g
 8UGrDfM7445LFbdwWkyS7g7ejrbi/a6sdxYiqszzBFKCCReTzFCjrc2P8OLwATBV9ZT+
 zfFyS4phJMEfWuxrROrF8KVfjo7avZtfPU72nsOG55rURch8s/siVlRJHxsJCZwVnGpw
 nvkumXHejzYZh+iTxK1qlr9wtPWUNvzEaDYQgWlQ+rIrWQkHYzvNZ3TyC5/omBpvAPdT
 3koQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lTLpqp7Aal91RYPJOEsqEB7xHK/i1gxcmA4vDgFrBlM=;
 b=a2MwQACBBdAbhe1hQX9VhhGHV801qX0XLXGnzUpsQUi8FmHVLCw0oBbUiGEgnURYQ6
 5T8tPLqop5rnetyrLIcTEYm2KkuzNzEUu7/gVu8IVxrfbCmqyqtSJDlVgMDDnokSB5Gh
 4zyY67Cy3KVptnI9WoXwwhuWg+EOE2tuBooRDxIlWWatG3+auXwJ+J1Z6e8zzKK7AVrf
 jNdIRZYhkT/nDcXg6vJAZlMdi4JrrPcpihRowhs8LmniCNLe0tRttNsqciBalI0v0ImI
 QTw+yyCaSlAxin7Ivbgv3w+ezPJ4V8MeK8KtqxU6Ep4B3Uvy7BHG82VLrLT+bnmMGfPu
 H7KA==
X-Gm-Message-State: AOAM533+PzmEM3hiUZ7MVYQIRPf75cSakGHEwPk94EFI7F7an48grPKJ
 /N6XWOpTsmcQRSzmkwVlvVU=
X-Google-Smtp-Source: ABdhPJxGPpcJSi7letXWi8/eW2gKXvzl3TJYsAZBQNm5HdhgF/f5qZHS9dN+3fWiZOUc0/kSUYp5Tg==
X-Received: by 2002:a17:902:6bc8:b029:d9:f448:b1af with SMTP id
 m8-20020a1709026bc8b02900d9f448b1afmr2775934plt.51.1605946169293; 
 Sat, 21 Nov 2020 00:09:29 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6897:89ae:e2b0:e24b:73e9])
 by smtp.gmail.com with ESMTPSA id w131sm6039302pfd.14.2020.11.21.00.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2020 00:09:28 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Sat, 21 Nov 2020 13:39:00 +0530
Message-Id: <20201121080900.17297-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add --fix option for
	INCLUDE_LINUX
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

Provide fix option to INCLUDE_LINUX check to replace asm
includes.

Macros of type:
 #include <asm/percpu.h>

are corrected to:
 #include <linux/percpu.h>

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 0da6422cd0fd..f852f130e065 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -5468,8 +5468,11 @@ sub process {
 						CHK("ARCH_INCLUDE_LINUX",
 						    "Consider using #include <linux/$file> instead of <asm/$file>\n" . $herecurr);
 					} else {
-						WARN("INCLUDE_LINUX",
-						     "Use #include <linux/$file> instead of <asm/$file>\n" . $herecurr);
+						if (WARN("INCLUDE_LINUX",
+							 "Use #include <linux/$file> instead of <asm/$file>\n" . $herecurr) &&
+						    $fix) {
+							$fixed[$fixlinenr] =~ s/\<asm\/$file\>/\<linux\/$file\>/;
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
