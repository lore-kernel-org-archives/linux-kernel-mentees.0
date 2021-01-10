Return-Path: <SRS0=byAB=GN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3531C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 10 Jan 2021 12:15:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DFDC206C1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 10 Jan 2021 12:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DFDC206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CDDAA20384;
	Sun, 10 Jan 2021 12:15:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qti+2GH6Vfxl; Sun, 10 Jan 2021 12:15:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 206F320381;
	Sun, 10 Jan 2021 12:15:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B14FC0893;
	Sun, 10 Jan 2021 12:15:42 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4054EC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 12:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 398D18689E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 12:15:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OCLQs8MptESY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 12:15:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BF2CC8685E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 12:15:39 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id c22so10732572pgg.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jan 2021 04:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iVUpnewCYxAmE3x0Y0aBU2Pf48lHqJK5gRlrTNmnLnw=;
 b=X03ytBtG1fgBmWRr0i9Y7/VHATIX3ymIHcmtUaQd+ObNkGfvlFja8/7VbQJbyTilQY
 QtKur3yHjvsIbQHGF4nhkjnihBRAJ4GhqF97E0Sgmu9II61ESzk7qeWByz6V3t93wDrx
 zkFvZdJ7vT23Kd1cPu+8Jo9BRI6waHtEAasImMPbChLey44H44LLYJVc3Y/NNPOvSANm
 eo15lPld4J1WmAJ9n9XADAGgYMM2ixtpy4lZ0GOOMBy7EuIP+sGZ86uUZ0QAEeDwfTok
 Llz9YXHEmfYmyE5Ai/7v9ZnkfMXEUtMh26AzZWK4Bj55XGUzaKObqfQ3Xls3RZhzZlKJ
 7skA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=iVUpnewCYxAmE3x0Y0aBU2Pf48lHqJK5gRlrTNmnLnw=;
 b=Ht8bYGCtcN7SMSKF1aMSEL/CakapAknN73Mq+iAusjdizyHFtBqHgf9NbnrO862nWV
 wfcV0g6XjlqnAm4bMFz+zrAvie+ijeEz2EsZsvKsLWvRgegpAA9/gJ4wXuHBBaWsXV4C
 ch0CrQcbyCmYNTeHt5xStI5IG6SUB6CJ2nuAgwPM7Clu5qL+dG6S2+bnf9DZlsSuR3mA
 lSXQ0t4XeLI6yVfCcI6cybimQQLI1njjV2II9jxyhijXrQ2h3flj847a1IzO9cyyuGpI
 WNK//Xe4gUb2TshA7B4AVvjitw4w9Qv2jrwwVSyp6R3emydp0oblpJ5YgPnL82etdY2F
 XF2A==
X-Gm-Message-State: AOAM53333lRH8XXlu8LKD6X33/HiSLkaNBr/LGQPKESaEl7OopkfMx7M
 yGswnSmRDKb8HlzgkNHqxVg=
X-Google-Smtp-Source: ABdhPJxUnAbYJooToG2g8hLQx/QHqJiwASfde63P/54nWB7MoIg3hAAwGqKEtMAUKUpHuxpNED4zCQ==
X-Received: by 2002:a63:545f:: with SMTP id e31mr15536593pgm.327.1610280939279; 
 Sun, 10 Jan 2021 04:15:39 -0800 (PST)
Received: from localhost.localdomain ([2405:201:600d:a089:381d:ba42:3c3c:81ce])
 by smtp.googlemail.com with ESMTPSA id y5sm10959791pjt.42.2021.01.10.04.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 04:15:38 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: linux-wireless@vger.kernel.org
Date: Sun, 10 Jan 2021 17:45:21 +0530
Message-Id: <20210110121525.2407-2-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210110121525.2407-1-yashsri421@gmail.com>
References: <3c121981-1468-fc9d-7813-483246066cc4@lwfinger.net>
 <20210110121525.2407-1-yashsri421@gmail.com>
Cc: pkshih@realtek.com, yashsri421@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net,
 kvalo@codeaurora.org
Subject: [Linux-kernel-mentees] [PATCH 1/5] rtlwifi: rtl_pci: fix bool
	comparison in expressions
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

There are certain conditional expressions in rtl_pci, where a boolean
variable is compared with true/false, in forms such as (foo == true) or
(false != bar), which does not comply with checkpatch.pl (CHECK:
BOOL_COMPARISON), according to which boolean variables should be
themselves used in the condition, rather than comparing with true/false

E.g., in drivers/net/wireless/realtek/rtlwifi/ps.c,
"if (find_p2p_ie == true)" can be replaced with "if (find_p2p_ie)"

Replace all such expressions with the bool variables appropriately

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 drivers/net/wireless/realtek/rtlwifi/ps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/ps.c b/drivers/net/wireless/realtek/rtlwifi/ps.c
index f99882255d48..629c03271bde 100644
--- a/drivers/net/wireless/realtek/rtlwifi/ps.c
+++ b/drivers/net/wireless/realtek/rtlwifi/ps.c
@@ -798,9 +798,9 @@ static void rtl_p2p_noa_ie(struct ieee80211_hw *hw, void *data,
 		ie += 3 + noa_len;
 	}
 
-	if (find_p2p_ie == true) {
+	if (find_p2p_ie) {
 		if ((p2pinfo->p2p_ps_mode > P2P_PS_NONE) &&
-		    (find_p2p_ps_ie == false))
+		    (!find_p2p_ps_ie))
 			rtl_p2p_ps_cmd(hw, P2P_PS_DISABLE);
 	}
 }
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
