Return-Path: <SRS0=HxGY=LU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E7B5C49EA6
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 26 Jun 2021 20:58:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ECE161C32
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 26 Jun 2021 20:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1ECE161C32
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D92B0400C1;
	Sat, 26 Jun 2021 20:57:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2k1F_0OmF46U; Sat, 26 Jun 2021 20:57:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0FED8400C2;
	Sat, 26 Jun 2021 20:57:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D8160C001A;
	Sat, 26 Jun 2021 20:57:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7BC9DC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Jun 2021 20:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55E9583168
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Jun 2021 20:57:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NtqBTJ2Pi2Je
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Jun 2021 20:57:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D449983134
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Jun 2021 20:57:56 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id t9so11481305pgn.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Jun 2021 13:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kL8a5X8847gaiK8cm1v6YoBD+G5PGJOSZdwZTVAMOac=;
 b=Im8KCO09dnHkgi6D5ICIB9NGGQaLMkJx9+10Ko9+HHPEyCs3qx2WbDkz0qKxy8Xk7R
 ASslWM2cLEkC61O8gX7XU8LAwNF123aZC5/0XhhSalv8d3kISNUctvRH/K5k8N1j5gO7
 HRZ+kcPdf43jU+XNN9SKvfxMUHRY2Z8NYS1RnmJDwRYQ/+GNXnaPNratj48K0apw1jr5
 PUuqamElD7ioHzOc8gBvYykv64AjvnC5DClNJGa2hSaAm3Zx9XVQE1DbW56JIIPWicH/
 kPmIMmDr1FSNxeh8lZNaYQ+UoyZQiojsPGnswtwgiOmIRGMeFRCGfBystTaAZ+xr06Ea
 258w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kL8a5X8847gaiK8cm1v6YoBD+G5PGJOSZdwZTVAMOac=;
 b=XOAtqdJPfHOPGCcgTWfte3L6VEEHETQ2QwVu8RE6puU1AqTHACGgRlaHRDal2/+Lt5
 J2viwWZ7uHHyFRUxoucWFod+15jzjqWrA1k1jqjRk11zMbIfZVgVU9uujOlx4HdakByR
 A+SmrVFl48nFeop4iQpLS/HJHdR0scP6Ma4Fw9bqZpteEJEdRzNKewmziNYO+GcwTdYo
 fwhIFdGcy+yTLSxfpvSRnB/cAm/nDXPgipRehWZXI32GhSrtrj8tstuWqAAPIdm7HlH2
 ZP4CARPhQXvmFDKWOveScPK7Z67Bt2PW47WMFk48NWrm58UPdA8z5Srp9IOovOj/OVV0
 zUAQ==
X-Gm-Message-State: AOAM531/p1aYElmvxHs1mgy3MCrtU/Bn0ioY9hWVhdu9B/iwTkD64HhS
 t54zipQuFE+PfI0g24FTP1Y=
X-Google-Smtp-Source: ABdhPJz8gtEda/evPb5lW8OwWUD9DR8xplBbIiB6agd+6iY32dPxGWzlsjWgiVAmxYAhrQgLhGwoMw==
X-Received: by 2002:a62:ea18:0:b029:307:6f4:ee98 with SMTP id
 t24-20020a62ea180000b029030706f4ee98mr17054720pfh.29.1624741076276; 
 Sat, 26 Jun 2021 13:57:56 -0700 (PDT)
Received: from pn-hyperv.lan (bb42-60-144-185.singnet.com.sg. [42.60.144.185])
 by smtp.gmail.com with ESMTPSA id
 e1sm9616539pfd.16.2021.06.26.13.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jun 2021 13:57:55 -0700 (PDT)
From: Nguyen Dinh Phi <phind.uet@gmail.com>
To: johannes@sipsolutions.net,
	davem@davemloft.net,
	kuba@kernel.org
Subject: [PATCH] Fix possible memory leak in function cfg80211_bss_update
Date: Sun, 27 Jun 2021 04:57:51 +0800
Message-Id: <20210626205751.454201-1-phind.uet@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

When we exceed the limit of BSS entries, this function will free the
new entry, however, at this time, it is the last door to access the
inputed ies, so these ies will be unreferenced objects and cause memory
leak.
Therefore we should free its ies before deallocating the new entry, beside
of dropping it from hidden_list.
These stuffs could be done by using bss_free function.

Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
---
 net/wireless/scan.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/net/wireless/scan.c b/net/wireless/scan.c
index f03c7ac8e184..b5f62bbe539a 100644
--- a/net/wireless/scan.c
+++ b/net/wireless/scan.c
@@ -1761,9 +1761,7 @@ cfg80211_bss_update(struct cfg80211_registered_device *rdev,
 
 		if (rdev->bss_entries >= bss_entries_limit &&
 		    !cfg80211_bss_expire_oldest(rdev)) {
-			if (!list_empty(&new->hidden_list))
-				list_del(&new->hidden_list);
-			kfree(new);
+			bss_free(new);
 			goto drop;
 		}
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
