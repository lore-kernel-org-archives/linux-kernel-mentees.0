Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE16C001DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Jul 2023 02:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD61540167;
	Mon, 31 Jul 2023 02:46:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD61540167
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fBWuJ/VA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B2iISbxKaEDQ; Mon, 31 Jul 2023 02:46:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BD2F0402A8;
	Mon, 31 Jul 2023 02:46:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD2F0402A8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8D44DC0071;
	Mon, 31 Jul 2023 02:46:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4BE07C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 02:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11C77819D6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 02:46:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11C77819D6
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=fBWuJ/VA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TM-fDrdkn5V5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 02:46:05 +0000 (UTC)
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4C3C817EB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 02:46:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4C3C817EB
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6bca5c71a6aso303721a34.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 19:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690771563; x=1691376363;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lLnxhTOK8CR7EOKXVMtGvf6ZSiJOcPXDQqy3TBSI8eI=;
 b=fBWuJ/VArlePTzAu+Lv1gqnlPm1ITSafKrNAnGpysA0wqm5h+7D28oOsXmzHfQteCo
 O3gq/1b1LaWqVu0Iq8Z1hBFo97dQQkyf8rPeoYBwT9pCQ+9LSFSCGzTxcIHXmwawqLZ6
 2jMnKnKGwWltp0uBK1kBYf5TUMDex7bpwzMF9OkbcWZoU4UOHGayozhDgvub93GChaf9
 2Bc/NesvHzpTquzJev3zGxoYOfP7nrE2w1N+dcFAflHCEDqmxpC9VUc7poptzT9m/2v8
 +DEnp9f6nM/mZrzjFYzERwxXXJV9WOd1FWxZ5vutlN/TtOTA1O3ofTMYDyILNdEm2/rr
 OUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690771563; x=1691376363;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lLnxhTOK8CR7EOKXVMtGvf6ZSiJOcPXDQqy3TBSI8eI=;
 b=AuAo56mGZ5ESA3U7OygU8r2pNYVRkKE47rFAbMh2JbwJHHq8KSuSuiwjbHHSQUZRHY
 TPCqtkhHW+nKYt/fq/kGNMuBDNP7S4CboaDOiv/5NZloYKEbjOQXxUGv3AtlpO8t0041
 CGocng7y/Vb26EanrAxuEDXDj/2BcB8ToFpWvjKslV3qOASDerLOVnZM/aMUnBSJJ7A7
 fDea00/VmcDQ/B9fvESQJ8LMKA5yuRVUSsr77XRdh6GosN2Tzzs5Av+hr9RWxwzEstDk
 ygbCMVHk5zMSMsXPu3b4Y7X+aEFWRSSYsqZjWmGFmZ98QQCO7ZwIR+GlgSh5m7Y1HTUt
 7O7A==
X-Gm-Message-State: ABy/qLYq6/d548pW2zJO9UL9H9THKgi44896uzIZ2DVgwyWDW6ZowkjJ
 m1DUCqCOlZxuhR8I4/achMU=
X-Google-Smtp-Source: APBJJlGX6gf6keMnZy5xVRbtRtp1qIpjbNHpcHhZQJEad9kWQQ8T7vWppcBE7i3cScDh4yAuD2TZIQ==
X-Received: by 2002:a05:6358:249f:b0:135:515c:38ee with SMTP id
 m31-20020a056358249f00b00135515c38eemr9782752rwc.25.1690771563460; 
 Sun, 30 Jul 2023 19:46:03 -0700 (PDT)
Received: from rajgad.hsd1.ca.comcast.net
 ([2601:204:df00:9cd0:f50b:8f24:acc4:e5c])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a63d601000000b0055be951145csm7045301pgg.36.2023.07.30.19.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jul 2023 19:46:03 -0700 (PDT)
From: Atul Raut <rauji.raut@gmail.com>
To: kvalo@kernel.org
Subject: [PATCH] ath6kl: Fix debugfs_create_dir error checking
Date: Sun, 30 Jul 2023 19:45:42 -0700
Message-Id: <20230731024542.27248-1-rauji.raut@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
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

The debugfs_create_dir function returns ERR_PTR
in case of error and the correct way to check an
error is 'IS_ERR' inline function.
This patch will replace the null-comparison with IS_ERR

This issue was found with the help of Coccinelle.
./drivers/net/wireless/ath/ath6kl/debug.c:1796:6-21: Wrong debugfs call error processing on line 1796

Signed-off-by: Atul Raut <rauji.raut@gmail.com>
---
 drivers/net/wireless/ath/ath6kl/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath6kl/debug.c b/drivers/net/wireless/ath/ath6kl/debug.c
index 433a047f3747..505af195e299 100644
--- a/drivers/net/wireless/ath/ath6kl/debug.c
+++ b/drivers/net/wireless/ath/ath6kl/debug.c
@@ -1793,7 +1793,7 @@ int ath6kl_debug_init_fs(struct ath6kl *ar)
 {
 	ar->debugfs_phy = debugfs_create_dir("ath6kl",
 					     ar->wiphy->debugfsdir);
-	if (!ar->debugfs_phy)
+	if (IS_ERR(ar->debugfs_phy))
 		return -ENOMEM;
 
 	debugfs_create_file("tgt_stats", 0400, ar->debugfs_phy, ar,
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
