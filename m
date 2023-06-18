Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62406EB64DA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Jun 2023 13:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 118F760FCC;
	Sun, 18 Jun 2023 13:03:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 118F760FCC
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Azw0dRns
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oV62yuYzEYek; Sun, 18 Jun 2023 13:03:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id F126760D78;
	Sun, 18 Jun 2023 13:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F126760D78
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1936C007A;
	Sun, 18 Jun 2023 13:03:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64E49C0029
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jun 2023 13:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1674160D78
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jun 2023 13:03:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1674160D78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r31xtELs17Im
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jun 2023 13:03:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01C5D61095
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 01C5D61095
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jun 2023 13:03:10 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-666ecf9a081so1624255b3a.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jun 2023 06:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687093390; x=1689685390;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z+3L0ggJSfWU7Zuqsbvu6xk0bd4fTGwDV0IPuzKiTyQ=;
 b=Azw0dRnsLrFwP4gVr4y9n+Yg7DuW/gctTRllmlendUKySevHv2a/ZO0ik9ygWV+AdE
 2Fjtsbb7RvxCB0XZI+LgW9p6Oi5X54ClLosqQaRIxO4eHoz+nCDtL4WSVV1xaRkj/Tqe
 0oysrWpvd5/69PqrMbL0JAxcH/xW1S/O3pZSQqPXNjjxHZjGxaBun671IVaSShlxw+0s
 IWz16xDcTMvcRr3T/bcQfbtncS08I3A1xqviCFHX3+n7WUbG/I7WejP+UtZ/2vMQCtBD
 PaUESH4cwO8eqkaFih2Pfc7eNW6+kCxj+XTMVPzfbhefyXqYTPz0Jl1LHR3MPEIICFrl
 taXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687093390; x=1689685390;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z+3L0ggJSfWU7Zuqsbvu6xk0bd4fTGwDV0IPuzKiTyQ=;
 b=UXpN6RIjjeLR4WaI+im/0Q1UKTaTL7zAczmQuME5urIFtMH6P0RCsV0AYWeQScFWYd
 41sKUqzF24E3GbhiHnDDkB1mVrR0Kbl3aKoXtC1JwRG5hJuk9g7uWJe5dF+7uo20p15p
 NCJu7jbMDhB8Z9wm064GlIwJJm+wMzR1PxRvPaJ3JtWH4Cg/fHAzS8jlhNjZm3biTiOX
 b+PHOvqZl4qNPsYgOWQ5egA1FYYyo1Jm8G0Dm3NRGkZPYOu3c9TNbpiopUsmpZwVhoN0
 orYhHqf7vpQfAM3F/h3/CaA+UQJnazSCHv3FUTj+Fep+QNV42PU6LgrVE1TlSIobNIvH
 lZYw==
X-Gm-Message-State: AC+VfDwPNkm85iN5ru0zNhnNpxYbeo/3sAqlYiP2fbK7keumW297UGYb
 P2YyBqzjj9TSuPq6F8/u7MA=
X-Google-Smtp-Source: ACHHUZ5PjksCNEFS21LbW7ZuJxv1PpDu7JK/ObVYUqOBKaf4J8GApVfQj7aqK3IM4tdHcguY+XlVAg==
X-Received: by 2002:a05:6a00:1891:b0:666:b0fb:fa8c with SMTP id
 x17-20020a056a00189100b00666b0fbfa8cmr11485609pfh.3.1687093390292; 
 Sun, 18 Jun 2023 06:03:10 -0700 (PDT)
Received: from zephyrusG14 ([103.251.210.211])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a635d03000000b005533dcb7586sm3241005pgb.20.2023.06.18.06.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jun 2023 06:03:09 -0700 (PDT)
Date: Sun, 18 Jun 2023 18:33:04 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] Trivial code cleanup patches
Message-ID: <cover.1687092111.git.yogi.kernel@gmail.com>
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
