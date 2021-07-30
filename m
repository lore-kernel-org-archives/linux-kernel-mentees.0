Return-Path: <SRS0=S3mN=MW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A412CC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Jul 2021 04:15:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C60F61008
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Jul 2021 04:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C60F61008
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AB784032B;
	Fri, 30 Jul 2021 04:15:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LSV-Xl6jTUv1; Fri, 30 Jul 2021 04:15:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 09946401B9;
	Fri, 30 Jul 2021 04:15:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D8481C0010;
	Fri, 30 Jul 2021 04:15:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62FBBC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 04:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49EE6402C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 04:15:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xHUP-Hzimoti
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 04:15:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B374401B9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 04:15:43 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 u9-20020a17090a1f09b029017554809f35so18863778pja.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 21:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ps4IOmc17WySeTSgvo3uD/BUf6CSyI+vUb3e7yZqyFw=;
 b=OUrY581BKpj1tZ35umAHWh0e42+XyE080rD3dk0rmx2YEf+L22+XObDcnJWZOf4+bB
 F4RVXAVGzALNEvXX5aKZSdADknVAT+gVJfBSmZJbL1jRpQ8cL5uiM0JVZWBdBAj06BNy
 1YiEUvKctStw3zvAOm/wS0Axwd6ExSoyNsGPuBWoFA0Hr1q0osa0+2ImFTtTv78Wn9On
 1pYLoNzShbUfviuLZxRdMeMar2lVVfkocmFkDP/1tnn8kWPvNLZZ8b6gEkMFs3hL0mC8
 VRC9zMg86AQAoFNtjwGVrpO9fOUg942dJ9jQQ8Vip4+6LCEXCUUjui5/suNmQvvjjlaK
 Xzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ps4IOmc17WySeTSgvo3uD/BUf6CSyI+vUb3e7yZqyFw=;
 b=aFnUuDB+Egchh1EMo2Br6KSEkbsRVAw/aoTQade4eEv4NuuQA4WQ71jflYC9RPctWh
 t2EYB/nLHVhHCgKhKCRvhWd8khFULn7zv0UqBi7JA2KI18f7/Mjk+eNGqIsR2XnjBRYz
 YKo4zn66yXPpKy4a1Rm6bLVBbJFW3KSNc+50ubo8VpKcrNRSeglnI4f8JsaWLOTNYx/7
 FZIwsZd5bYJg/dHpZWwBDgLo5l5pwD9gLJV3EH7KCmf/0gRrQ5NYfum4x/P0vHsFxcPs
 2ypyQn36jw3D7g2h5Dhgk6LQ1RuTN9rP2hL+Mb+yPaiKZoX8/69eB/NDMGFyiSHQoUet
 qIag==
X-Gm-Message-State: AOAM530MejIbMw08w51edoFDpaAd1Ii4etYMjiybXyv8CTb5kWZHb9zA
 IEbnXHghwh/C6Vqzsd7K47g=
X-Google-Smtp-Source: ABdhPJybNXzwf1afATACd4SoNNQWUK7gXTndoS2hYEHp5ijscoZl7YjagXGkzLzBsdMgVdCBa96Beg==
X-Received: by 2002:a17:90a:c902:: with SMTP id
 v2mr1012698pjt.136.1627618542716; 
 Thu, 29 Jul 2021 21:15:42 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id t19sm439322pfg.216.2021.07.29.21.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 21:15:42 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, peterz@infradead.org, mingo@redhat.com,
 will@kernel.org, longman@redhat.com, boqun.feng@gmail.com
Subject: [PATCH 0/2] locking/lockdep,
 drm: apply new lockdep assert in drm_auth.c
Date: Fri, 30 Jul 2021 12:15:13 +0800
Message-Id: <20210730041515.1430237-1-desmondcheongzx@gmail.com>
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

Link: https://lore.kernel.org/lkml/20210722092929.244629-2-desmondcheongzx@gmail.com/ [1]

Best wishes,
Desmond

Desmond Cheong Zhi Xi (1):
  drm: add lockdep assert to drm_is_current_master_locked

Peter Zijlstra (1):
  locking/lockdep: Provide lockdep_assert{,_once}() helpers

 drivers/gpu/drm/drm_auth.c |  6 +++---
 include/linux/lockdep.h    | 41 +++++++++++++++++++-------------------
 2 files changed, 24 insertions(+), 23 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
