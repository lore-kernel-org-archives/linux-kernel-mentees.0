Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB799C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jun 2022 21:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72A3880ADE;
	Mon, 27 Jun 2022 21:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72A3880ADE
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WuBauiPH
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30o0U39G8_hu; Mon, 27 Jun 2022 21:43:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B5B7580ADD;
	Mon, 27 Jun 2022 21:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5B7580ADD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8EA85C0039;
	Mon, 27 Jun 2022 21:43:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8363C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jun 2022 21:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84A7C40181
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jun 2022 21:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84A7C40181
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WuBauiPH
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FH20eDG_rdmy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jun 2022 21:43:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E160C400D7
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E160C400D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jun 2022 21:43:42 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id g4so3397142pgc.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jun 2022 14:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tsp6NWTiXSJ0zfkiGxcTyiVcKEGRfQJ96DU5zcvmvhA=;
 b=WuBauiPHNgwaS1JBOh71BPtqPlPvMN2PZLdgBpcs5mPw/64QyyNNsRDE2I1oPamnWs
 yH+ZmYC/KFHskKTFDDEdMiU0/NfuQnu2oHb0uefxd60xIBhQ71G9FBVEMy7AsGxal8kE
 J2JxpnlGhPrn+Hd4W42EK0DRx3GbS6q/yAE4dEGqMzhwG3ipp7LrSkr/lzQ/I9QkWd50
 gia8mVit37kNI1HQn27DfOjb/D9Erex/iPtiA6HK+TonCT19ckW9/Sb8FklUtBsvlX+S
 zPMwAoqLSN9BfViwkfTSzOZ+US/n0ZJqCIIZZdOsNp8VfwpbxDgOB+P7mo3alFSdaGl9
 DmTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tsp6NWTiXSJ0zfkiGxcTyiVcKEGRfQJ96DU5zcvmvhA=;
 b=XXKl8DjDYovZ6hlS1sjWTfxaXWdHdicOIU9outoR/BD4/nwszHpDapH+duGUmRfhCK
 LMRbf2GgZNVPCu2PitOJHqOpbkYv20dBZAvrxV2eLbiA9L1QH46tYiL0c1yTRVIWDoRV
 3h8meCaXdCXNHAwoJnDUj5nO9UQT6BJwkGD36zQM9RVi4EsKSpxnlrDtVhiIiTGTPXD6
 lVO4pJDJlxrTbhwTjRpYLwh4yZYh2GIDk1kDuEj+HdlJahZFDZ001Z6kv+9VyTO8oehf
 tBDOlyytBNh6rOMDz+fjfzGAMN3bx8N3aP2zveH/yRFTZn2DudpkmAlPYA3Hb1NzYs58
 hawg==
X-Gm-Message-State: AJIora8zdQ5JDgmlUm+d7U9Nu0Eb7mxyGpsuFb+K7gyYkfOQtXE/oNEr
 yZMYxcfTr7xJ/ibGvFaZhag=
X-Google-Smtp-Source: AGRyM1sbLVHH/FJZe241zkPNZj4SGgeHPgS+lUiLtRFIreMiYU4bVWPssKK4vwZfhTUB/zhZEW+1Iw==
X-Received: by 2002:a63:d949:0:b0:408:870f:70d1 with SMTP id
 e9-20020a63d949000000b00408870f70d1mr14450923pgj.620.1656366222013; 
 Mon, 27 Jun 2022 14:43:42 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:e95:685d:6958:8e77:9c10:bd78])
 by smtp.gmail.com with ESMTPSA id
 bj12-20020a056a02018c00b003fbfe88be17sm7587529pgb.24.2022.06.27.14.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 14:43:41 -0700 (PDT)
From: Praghadeesh T K S <praghadeeshthevendria@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
 Praghadeesh T K S <praghadeeshthevendria@gmail.com>,
 linux-doc@vger.kernel.org (open list:DOCUMENTATION),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] docs: fix 'make htmldocs' warning in leds
Date: Tue, 28 Jun 2022 03:13:11 +0530
Message-Id: <20220627214311.7817-1-praghadeeshthevendria@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: praghadeeshtks@zohomail.in, linux-kernel-mentees@lists.linuxfoundation.org
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

Fix following 'make htmldocs' warnings:
./Documentation/leds/leds-qcom-lpg.rst: WARNING:
document isn't included in any toctree

Signed-off-by: Praghadeesh T K S <praghadeeshthevendria@gmail.com>
---
 Documentation/leds/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
index e5d63b9..b9ca081 100644
--- a/Documentation/leds/index.rst
+++ b/Documentation/leds/index.rst
@@ -26,3 +26,4 @@ LEDs
    leds-lp55xx
    leds-mlxcpld
    leds-sc27xx
+   leds-qcom-lpg
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
