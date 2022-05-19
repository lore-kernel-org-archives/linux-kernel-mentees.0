Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD3AC433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 May 2022 09:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69A9841C45;
	Thu, 19 May 2022 09:51:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lNA_LNIZN2Bx; Thu, 19 May 2022 09:51:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7938641C43;
	Thu, 19 May 2022 09:51:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 535AFC0032;
	Thu, 19 May 2022 09:51:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F2D5C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 May 2022 09:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6029084388
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 May 2022 09:51:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FnzdzJP2IM2s
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 May 2022 09:51:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD6B284376
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 May 2022 09:51:22 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id q18so4314561pln.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 May 2022 02:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=Kz0h8AVlhDxqu2fBv10G2DB8irasLWVcOGHbwSABuog=;
 b=j8zmNa4gMVNlK1u6bsG4t1uiZRogcunLjCd15/qrWM4n/t2ugaS7lRDlEPZ6jY+yIg
 mTkGGLdzW/XF1HzWzoin/UaQRAH1HC3QmvuecgIwR59XLaQAahzL2pgVCOsQvNZj7cdz
 VYmF4RqqxQQpgjr2ibTG/yK7t16feYxU3umPw8ojMW425llDHKVO+X5yB6azRO4u6S58
 UzattIxywCxCfAijShBykl2CXmkGvvOSVCsH94kEZkUjIFlVSSr3OA351Ri9HUtPyFhO
 1A35o6nL/k3nMH4PSxrKdHRFharWVdXlHgLosiZP6HKazU5lWFSTbsjROPCzR/ueoDD1
 zBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Kz0h8AVlhDxqu2fBv10G2DB8irasLWVcOGHbwSABuog=;
 b=t4Kf2O9AfxLqHNSYBtpUo+RJ+7EDaltv1FoMt/NhqEZ3cAq0dE2LFDsiYr0WAe47yP
 I5GBKqBvRSOCIY0KE1LOkPn344B3NrWhceNFhspsBQzZ39G7F5JbWvJhEoJ+CQM6eTwz
 SFnW8dwx1yNxyQlm8UJ291PPB+gOi0y4l7Y4j4P8g5sMaKG01VHJAqeBGg4bTJJfsrVA
 I/8xoxkcFf4RWPKKxl4Bc7VOmMh8P/Kq4+bzvyXG8AqRpSgdHJ9F7Qa2OmKeqgfxFqbs
 Tp5D+3ccEQncg5mEzgsfXjp4Rx84I7aArUtmlDaoKpDuXMCrOMv8GeiFMEawjDRGd39O
 +j4g==
X-Gm-Message-State: AOAM531uFj679C8/czImFlgerfT74m+PY4WnfqmjXZmkmnrZ+D4hyG+A
 aShmhfYZzGZd+57CQT8OjL0=
X-Google-Smtp-Source: ABdhPJw1fyrbaoYaCvEaPe+05dXjx+wf3KiemTb56WVrxGS0CtEIIiLvyqyF450u94ZVs2dzcF4H8w==
X-Received: by 2002:a17:90b:1d0b:b0:1df:b3dc:5140 with SMTP id
 on11-20020a17090b1d0b00b001dfb3dc5140mr4289320pjb.225.1652953882156; 
 Thu, 19 May 2022 02:51:22 -0700 (PDT)
Received: from Negi ([207.151.52.3]) by smtp.gmail.com with ESMTPSA id
 f186-20020a62dbc3000000b0050dc7628133sm3798073pfg.13.2022.05.19.02.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 02:51:21 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] staging: r8188eu: Remove multiple assignments
Date: Thu, 19 May 2022 02:50:11 -0700
Message-Id: <20220519095012.5619-1-soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-staging@lists.linux.dev, Soumya Negi <soumya.negi97@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

Conform to Linux coding style.
Issue found by checkpatch:-
CHECK: multiple assignments should be avoided

Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index e1b3e9d5250b..bca20fe5c983 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -53,7 +53,8 @@ static unsigned char *__nat25_find_pppoe_tag(struct pppoe_hdr *ph, unsigned shor
 	unsigned char *cur_ptr, *start_ptr;
 	unsigned short tagLen, tagType;
 
-	start_ptr = cur_ptr = (unsigned char *)ph->tag;
+	start_ptr = (unsigned char *)ph->tag;
+	cur_ptr = (unsigned char *)ph->tag;
 	while ((cur_ptr - start_ptr) < ntohs(ph->length)) {
 		/*  prevent un-alignment access */
 		tagType = (unsigned short)((cur_ptr[0] << 8) + cur_ptr[1]);
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
