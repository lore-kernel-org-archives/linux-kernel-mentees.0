Return-Path: <SRS0=pOiW=MX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50593C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Jul 2021 08:25:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0172C6101C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Jul 2021 08:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0172C6101C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA0BF8297F;
	Sat, 31 Jul 2021 08:25:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BUbfxoMh2Xmz; Sat, 31 Jul 2021 08:25:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D901282890;
	Sat, 31 Jul 2021 08:25:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE9B7C0010;
	Sat, 31 Jul 2021 08:25:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C75C6C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 08:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF2864026D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 08:25:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v6089YjlIC9i
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 08:25:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB0BB401C8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 08:25:26 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id t3so11751308plg.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 01:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mHdpvkbP+f+dtX797YzbOAyZjqosEwv+iX1MkyFepyo=;
 b=FgD1XECONq1EEacsOnbHTBSX9RTttVxZCK7tvs4bHdTD0PFR+DLQFGoGIB7yau7x3A
 aIjFV07RmNaD6CUmzpWt6gL0WCwibOpNLZs5IIRJEyAMGI/xeNOX6IXVyMQyWmgikBmr
 dtaxcd+sRmDLQk3l8YeRD9Zo7IoykCTeTLsfgeiAHBIcTbrSZf5a4B1Db/H06hWFzcQF
 B7Yexkb75+Yh8vk+ZKLhh2afiLafMC26x57vMDPdJOpdNxnSVayOemPL6NfTWIkfS5zv
 4JyUiwUYvvl3UE6C+W+Vm5m4Nfntb6R7jj2add3fXmLSrdvnLXCPvF4nyaIJiBndtd42
 /TJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mHdpvkbP+f+dtX797YzbOAyZjqosEwv+iX1MkyFepyo=;
 b=W+hIvpnvhbT/KAo/EldjOnQokabLJ8Og4mqbEvhI/M0gyxr3S+VzGbU1P+ej/JaYpq
 92oSX8ILFfzkFdaoY0kxdQr7GH0GTfyLsi7R1KR7j+ezGK7imj49D+iPhlAd+GsYE2uF
 oSBB79ratYC7kQaYa3sdhaeWvWb0Nk7YaVhGNkAGHABvZBBg8A+kY0xGPOeq4H90ef36
 o0CUx1DH/wjgxXLoVmvB87uO+Acd7B37Lp5bp7V175Wj9bNZDcfeuAKWbBhryLKo8es3
 pDcN63dUdQ/eMa18B8zAeUKxA3yRfAMKTKjhmXGUmtfeoDzAY+e/XN2rrssYEE2ra0Cu
 xXbw==
X-Gm-Message-State: AOAM531CHtsN6Gxlebuueut5TUsDk44g1nrkvQP8KuYuhKgT+Zv5e8kr
 IrjVp44qVxOARxX5GfUK2N0=
X-Google-Smtp-Source: ABdhPJzV88a/NgZkzpC2Uk3z53JeCgHQMRG5Zr9JcgffkGLRyOiiycYGDbfxycax3nceUGRo8HTqOQ==
X-Received: by 2002:a17:90b:f92:: with SMTP id
 ft18mr7360311pjb.31.1627719926122; 
 Sat, 31 Jul 2021 01:25:26 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id mq7sm3182124pjb.50.2021.07.31.01.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 01:25:25 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, peterz@infradead.org, mingo@redhat.com,
 will@kernel.org, longman@redhat.com, boqun.feng@gmail.com
Subject: [PATCH v2 0/2] locking/lockdep,
 drm: apply new lockdep assert in drm_auth.c
Date: Sat, 31 Jul 2021 16:24:56 +0800
Message-Id: <20210731082458.1962043-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

Hi,

Following a discussion on the patch ("drm: use the lookup lock in
drm_is_current_master") [1], Peter Zijlstra proposed new lockdep_assert
helpers to make it convenient to compose lockdep checks together.

This series includes the patch that introduces the new lockdep helpers,
then utilizes these helpers in drm_is_current_master_locked in the
following patch.

v1 -> v2:
Patch 2:
- Updated the kerneldoc on the lock design of drm_file.master to explain
the use of lockdep_assert(). As suggested by Boqun Feng.

Link: https://lore.kernel.org/lkml/20210722092929.244629-2-desmondcheongzx@gmail.com/ [1]

Best wishes,
Desmond

Desmond Cheong Zhi Xi (1):
  drm: add lockdep assert to drm_is_current_master_locked

Peter Zijlstra (1):
  locking/lockdep: Provide lockdep_assert{,_once}() helpers

 drivers/gpu/drm/drm_auth.c |  6 +++---
 include/drm/drm_file.h     |  4 ++++
 include/linux/lockdep.h    | 41 +++++++++++++++++++-------------------
 3 files changed, 28 insertions(+), 23 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
