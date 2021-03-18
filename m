Return-Path: <SRS0=jPrV=IQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C9DC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Mar 2021 17:26:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8B5964EF2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Mar 2021 17:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8B5964EF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D40683F8B;
	Thu, 18 Mar 2021 17:26:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cOOhx91uDFOI; Thu, 18 Mar 2021 17:26:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9854983F00;
	Thu, 18 Mar 2021 17:26:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7E182C000B;
	Thu, 18 Mar 2021 17:26:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18E55C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 17:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FA5A400BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 17:26:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GSuXwvoK951j
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 17:26:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B377400B5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 17:26:41 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id g1so1645070plg.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 10:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sHweBOu87N9g9RKv5TWD5Rj8wEEJ3GYvvqd55wtZEbI=;
 b=TQvJIdX/XWX8GGUYM9ea2FwlskID9/bCoUtkfBR8qYG1RG15oIc1wNmyqgfPCmhryI
 jbQxvqFeo1ynfoIXHNONifPkZwqFWIs00ILSclsv4bV/nURB3xYTC+bnFOEbtCHQ4qZA
 wFDk50SAkiROguF+LuHIdBpm6I4scBRk9ZUeVn5BqeHk9kEdipEBcLQPCB8CRS0/dRPP
 +U1Zi8qOH3aZiD2HnRG11ULlvsj3Be9QQ0NxsScYaHgC8v37uc7mr6rZZVBB5NJZsCYA
 9XL+XbJpmUy7q9u8HU0kBt5AujhPkpiSIfdhD+5BP74Lm9e7SwxwPkFsOam62ya1qg0t
 aGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sHweBOu87N9g9RKv5TWD5Rj8wEEJ3GYvvqd55wtZEbI=;
 b=VFfHlZNmGRx8X12Spzyw6B2oKEfsn7CFndMPzuMPAzf4/WcFpqdMANPEI9Q7iYakbK
 Mqyn9i0yizHYphy9OZjeKv9AhGtj6SL+zh5An0PBi/6zPtMVRRNb3SITCDwGUg2FMvQY
 S4hfA0PBdsXE2dVHgjXA2Mt+ih+V5wb86A0bXtSngCSaRGzc5+6BqTg7CUhV1vwib03M
 9+2yKjTNXY5JSexDEuOmQK/3ITisT6kdN3khDKtH9WEqf3EVN2iq9AZ4nksMOocCxCbs
 MwccTHEQpX1wBuM+YrBTtcozwacrz1ahCofG1D7Nu+KY2Qq8ohq4aJ5K1FL3gbYrpWFr
 WWWw==
X-Gm-Message-State: AOAM530VBVrUf8Oj8rUVgYHY9YwXymBUHsAWFtOw6uGPE+VnvRdjh0TF
 npA+zjW3Z7x6e2GxSHXA3y8=
X-Google-Smtp-Source: ABdhPJwVIyl5FoWv3FG2mTLwetmTy19oZ5LMGtWOYkVvVW0mFKLaDdrgf3sUmkMpw7OVMTNQEW5E8A==
X-Received: by 2002:a17:902:dac2:b029:e6:30a6:4c06 with SMTP id
 q2-20020a170902dac2b02900e630a64c06mr10850318plx.65.1616088400873; 
 Thu, 18 Mar 2021 10:26:40 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:6aa2:3e25:28b1:e7b3:767e])
 by smtp.gmail.com with ESMTPSA id bk8sm2751442pjb.13.2021.03.18.10.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 10:26:40 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Subject: [PATCH] checkpatch: remove check for include/asm modifications
Date: Thu, 18 Mar 2021 22:56:29 +0530
Message-Id: <20210318172629.123182-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Dwaipayan Ray <dwaipayanray1@gmail.com>
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

include/asm/ got removed over a decade back. checkpatch
still has a check for it: MODIFIED_INCLUDE_ASM

Remove the check as it is no longer useful.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index f42e5ba16d9b..798e2236b1a3 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2799,10 +2799,6 @@ sub process {
 				     "patch prefix '$p1_prefix' exists, appears to be a -p0 patch\n");
 			}
 
-			if ($realfile =~ m@^include/asm/@) {
-				ERROR("MODIFIED_INCLUDE_ASM",
-				      "do not modify files in include/asm, change architecture specific files in include/asm-<architecture>\n" . "$here$rawline\n");
-			}
 			$found_file = 1;
 		}
 
-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
