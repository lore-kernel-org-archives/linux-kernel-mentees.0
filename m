Return-Path: <SRS0=1Ivo=NJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 528F8C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 07:40:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05CD361076
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 07:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05CD361076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D008A40265;
	Wed, 18 Aug 2021 07:40:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QWcO5kbnJ59y; Wed, 18 Aug 2021 07:40:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B5848401CD;
	Wed, 18 Aug 2021 07:40:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94537C001A;
	Wed, 18 Aug 2021 07:40:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4E0AC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 07:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7D58606DF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 07:40:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e0MSTzG-Qn-k
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 07:40:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C1E3606D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 07:40:38 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id e19so1240943pla.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 00:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=he3hjgMVhcOXzxQ8ZzPKGe5qy8qOVQuZUYfKXwOfAPg=;
 b=V3ChonAMDLG13W4R9mt1UZfcDRlf3NYYG5Rp6zwLe9hoPv7kNaLSz1SBaGSu4gacb2
 IG7pihFofk738zo0sUjjMECc8BKbXHoRFgXUaz+rksmgG1umJdIhslaO4DouScE25nrz
 QhQN0KBGfOlxOAV5gm+r9YxMmPtBF13v/W8YFP2iCl19RlJ5zdD+L2hOm2sa+1iKHZGz
 CgFFYbvwQ/FegyZK22MDmuuW+iQHHAazsx4WnIW9u2x3s0WyVCRHOYH7otiYZitptlk3
 7J02sZUKJx/5shMUykUIDn5WogVBsFWvX2MIVtWcImlFFB8LyqmG2vbSKdj3J6amSb+W
 /hSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=he3hjgMVhcOXzxQ8ZzPKGe5qy8qOVQuZUYfKXwOfAPg=;
 b=rsAbSrtQCCJ42UJd1Ln7bNj9oiGWaB15fp/toakO5uidpkyuC7sFtAlc4KnGHoVETo
 u2mpYT315Ko01Nb2CESpbzicXUDL+ti07b1Ynp9+jcd7AxReQw9nlRxO3m1wzkB98N8o
 QoXdhYJZ96xZH/mhJ0BZve2HYFh6tn7DFELv4Rg/CCbTTX/vJEw3XCIcvGjV6Nni7KGZ
 z1x+IbWWFV2KEwedacjJXiZchVi9/5CrD1b9W/IBxyHWGpsuSirk7psdb7GoFEyhoBvz
 +rcjpNudiUOrcFRvi83GDBmo89wX0E4/AsPRIPo+0aKMPxZvex0P1b8KGaTl2c32lChq
 sHHg==
X-Gm-Message-State: AOAM530Q6krcRGQV96cGeNZpqY2dtPZWHAq0nmCrA7LO0UjpVv48LGka
 lQgegv4yiSCb5vIocROne8I=
X-Google-Smtp-Source: ABdhPJykotiJspllqjLdDweoNoswYBNnKnCEjOlyfwnrSucYaBkYPe1fsbb0KtPlQEnYeO0NwCNLag==
X-Received: by 2002:a17:90a:b009:: with SMTP id
 x9mr7893927pjq.97.1629272437819; 
 Wed, 18 Aug 2021 00:40:37 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id u3sm3886729pjr.2.2021.08.18.00.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 00:40:37 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com, axboe@kernel.dk, oleg@redhat.com,
 tglx@linutronix.de, dvyukov@google.com, walter-zh.wu@mediatek.com
Subject: [PATCH v3 3/9] drm: check for null master in
 drm_is_current_master_locked
Date: Wed, 18 Aug 2021 15:38:18 +0800
Message-Id: <20210818073824.1560124-4-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
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

There is a window after calling drm_master_release, and before a file
is freed, where drm_file can have is_master set to true, but both the
drm_file and drm_device have no master.

This could result in wrongly approving permissions in
drm_is_current_master_locked. Add a check that fpriv->master is
non-NULl to guard against this scenario.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 8c0e0dba1611..f9267b21556e 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -66,7 +66,8 @@ static bool drm_is_current_master_locked(struct drm_file *fpriv)
 	lockdep_assert_once(lockdep_is_held(&fpriv->minor->dev->master_lookup_lock) ||
 			    lockdep_is_held(&fpriv->minor->dev->master_mutex));
 
-	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
+	return (fpriv->is_master && fpriv->master &&
+		drm_lease_owner(fpriv->master) == fpriv->minor->dev->master);
 }
 
 /**
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
