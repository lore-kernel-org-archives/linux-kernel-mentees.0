Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24267EB64DA
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 19 Jun 2023 14:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB39381DEF;
	Mon, 19 Jun 2023 14:17:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB39381DEF
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Ju6rdffI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jVSk4H4YDblr; Mon, 19 Jun 2023 14:17:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9625781F9C;
	Mon, 19 Jun 2023 14:17:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9625781F9C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70D4CC0037;
	Mon, 19 Jun 2023 14:17:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D8C6C0029
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jun 2023 14:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 480F7409A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jun 2023 14:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 480F7409A3
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Ju6rdffI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uCocQJENkBA6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jun 2023 14:17:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D1BD401D3
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D1BD401D3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jun 2023 14:17:18 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-25695bb6461so3113727a91.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jun 2023 07:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687184237; x=1689776237;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m462Io47RlCWBfDJCQFiCJnqNvxTLHRYWMF6j3UT8B0=;
 b=Ju6rdffIi4s6qEqyNIzu8niM8oNTnG/uxGon9J9yJLsdAboFnyUvOLZkm2VAGkd28j
 jpYhtbv4LmDpVqyiq+wq5Dep01gGsEkXNUBW93U/r2Ia7470KRRo1VwBogPKZxcuOsxC
 fN328Z2kg4U7T/G+1Jh7WkTrhwILEtmegjMJFaFR2assviRqYauOm9TrKLYWGIIF3Kcs
 aQOf+Q6a2zTlu3jGGvdXh4TUBois9K9qwxeAJkwiLoYDKUISG+UFdQOqJF8rZOAPJ+eG
 ReCPqBrGnU1e+tLqGjLEi2VIjc899vxQRmK2vbKZbodgv4yamLJYUQtVYJO1xMTicEkQ
 qSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687184237; x=1689776237;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m462Io47RlCWBfDJCQFiCJnqNvxTLHRYWMF6j3UT8B0=;
 b=AQP0h/e+8F/nGdLa5W/peyYrHW87xUzrX6Hr21a4yNZZDZmjKnIYqTZ8r3nE/cr2sH
 QH/Zw209IdhvVIBRkLdN6qQg02Qot7fQJRtj56SdGqfuXLO4GFi2qSDR7rlLAV2qYm+c
 BE2UqhvsYL/vo18faOBR4UBJF8JhsXGDovlL9LPw4Gp+9l24+mMYSiO6Cjug+Ht8xuuW
 O3G6XGaULFmCvX12r+zsi7ulI0S31TE78AEwKywW4wpnv7qwGUbXxEz2AaLkhiTqurWy
 zSkuRJbz7LjJdZnjNbMj8LWmZmGqRXWCNGXlv6vtaro8cD/Jb7kX5X4mOe1Xyzlv1aHB
 lgTA==
X-Gm-Message-State: AC+VfDzmgit85h4FlWfEW0jjk/Ut7KVk4q8C8XdcmIi5P4BYuF1m/Hwe
 j1joSkLNlLApxcs+LaQBAy0=
X-Google-Smtp-Source: ACHHUZ65D/W4si0E5ycCXfvGbSLyoUtFQJnN9DnqBS592C87gg9tWtlIWCnWgouDRpUYEDW9bNc8vQ==
X-Received: by 2002:a17:90a:6f43:b0:25e:fb6d:ce68 with SMTP id
 d61-20020a17090a6f4300b0025efb6dce68mr5438247pjk.6.1687184237181; 
 Mon, 19 Jun 2023 07:17:17 -0700 (PDT)
Received: from zephyrusG14 ([103.251.210.211])
 by smtp.gmail.com with ESMTPSA id
 bo24-20020a17090b091800b0025edb720cc1sm3731946pjb.22.2023.06.19.07.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 07:17:16 -0700 (PDT)
Date: Mon, 19 Jun 2023 19:47:11 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] Trivial code cleanup patches
Message-ID: <cover.1687183827.git.yogi.kernel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 philipp.g.hortmann@gmail.com, dan.carpenter@linaro.org
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

Rename variables in struct rtllib_device to avoid CamelCase which is not
accepted by checkpatch.

---

v4: Rebase to latest staging-testing branch as suggested by Greg Kroah-Hartman  
    <gregkh@linuxfoundation.org>.

v3: The driver is split into 2 modules, calling the functions directly which 
    the v2 of the patchset does breaks compile. So reverting back to v1 of 
    the patch as suggested by Greg Kroah-Hartman <gregkh@linuxfoundation.org>.

v2: Removed the variable and called the function directly instead of
    just renaming the variable as suggested by Greg Kroah-Hartman
    <gregkh@linuxfoundation.org>.


Yogesh Hegde (4):
  staging: rtl8192e: Rename variable SetWirelessMode
  staging: rtl8192e: Rename variable SetBWModeHandler
  staging: rtl8192e: Rename variable LeisurePSLeave
  staging: rtl8192e: Rename variable InitialGainHandler

 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c |  4 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   |  8 ++++----
 drivers/staging/rtl8192e/rtl819x_HTProc.c      |  4 ++--
 drivers/staging/rtl8192e/rtllib.h              | 12 ++++++------
 drivers/staging/rtl8192e/rtllib_rx.c           |  2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c      | 12 ++++++------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c   |  6 +++---
 7 files changed, 24 insertions(+), 24 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
