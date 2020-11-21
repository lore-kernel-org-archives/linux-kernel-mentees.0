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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AEB5C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 16:17:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1795720936
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 16:17:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9KqRypu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1795720936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B9C10873D7;
	Sat, 21 Nov 2020 16:17:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5w6uIOPRWn-V; Sat, 21 Nov 2020 16:17:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DED47873D2;
	Sat, 21 Nov 2020 16:17:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6116C1825;
	Sat, 21 Nov 2020 16:17:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 961D5C0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 16:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8B2DB86BE1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 16:17:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9OAPQo+ppT1P
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 16:17:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 803CF84AE3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 16:17:37 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id w6so10870621pfu.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 08:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lTLpqp7Aal91RYPJOEsqEB7xHK/i1gxcmA4vDgFrBlM=;
 b=c9KqRypuwX8EZSFaXesWM6JD4yA0cJ8DtxKCw5viXMvf6Su/16pEhzJg09gDDKx+wl
 9AYvL163o59c3Om3hfdBTOxoCMbHipPxQfQ2ANUlN+Tfrtp0x+f2+OrpvSqC0jc0YVoF
 hgp3MS7X9xDesjF5Yg0860TdCgNrnN9CrvhrLK0jOg5z3mhpqcEjvVBHCaLFmO3B8Bm6
 cZQnWfFdNeUWtiS3nQflKrU+a28kPHKgAS75KwxgGOotnI7gh8HoHJSrc3rys4EIUeS3
 YUbsfUB9rXU9bpBjsZ9BpejPPkgRvo3QITi7/2dOyjTPLBZTp+debhzVXqhX6NOHQtfb
 +qTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lTLpqp7Aal91RYPJOEsqEB7xHK/i1gxcmA4vDgFrBlM=;
 b=joTGuFiS8zdy7iazk+Dv7xaCCla3XHnAC2/JjVaIbN+bRZOpf+EghsbJ0pHWAr1ajr
 szZVF3YegCzMCAriTiZAUCGeZVNJrrLiP3ku+z3uTP4uUdj+gBkgD5Wfjc3Yk6PJH7iP
 yyos77JnyEIsDvLzWMd0LWO1rzkoWDJ1Dmrja1ZxU4U1msz6pHJXXLPN3/bitipkWPPw
 nGdxA7cRpzRLaOH04lFoL6Jnh+jMtPDwcEbkv0LJ72uW1EKq41P5ev2Amkpe1DygPqtx
 My9/rsen6G7/uJ80LNjbDBJcfKI1PHO7aDoqtcn/h8HM020m1pYEm9tXxXoX72/oGVXq
 BJ5A==
X-Gm-Message-State: AOAM530lkLdHNvPgefQ1ntfCoXpBiWkKZyhupfytjqOWiTz7A78DzKuK
 yyNkoouoqhikjUrekIy00vI=
X-Google-Smtp-Source: ABdhPJxd2xklANTvIuKL/UQpwphHJomdXZxXUwfOl+1XJL8WICOjvn1z1rHNP9rjFc7KeUcRD1OIUQ==
X-Received: by 2002:aa7:9e90:0:b029:18b:a94:3498 with SMTP id
 p16-20020aa79e900000b029018b0a943498mr18983836pfq.54.1605975456964; 
 Sat, 21 Nov 2020 08:17:36 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6897:89ae:e2b0:e24b:73e9])
 by smtp.gmail.com with ESMTPSA id y201sm7011342pfb.2.2020.11.21.08.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2020 08:17:36 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Sat, 21 Nov 2020 21:47:06 +0530
Message-Id: <20201121161706.104631-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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
