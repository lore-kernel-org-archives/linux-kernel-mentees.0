Return-Path: <SRS0=TljZ=NE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B05C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 09:02:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 458AC6103E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 09:02:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 458AC6103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1957E80DEE;
	Fri, 13 Aug 2021 09:02:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UWBxnmSO4_ti; Fri, 13 Aug 2021 09:02:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3620C80E53;
	Fri, 13 Aug 2021 09:02:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16187C0010;
	Fri, 13 Aug 2021 09:02:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58A84C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 09:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 385944039A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 09:02:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kEd5wL6zMvvV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 09:02:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 152024015F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 09:02:41 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 mq2-20020a17090b3802b0290178911d298bso15083582pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 02:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O8WE4JThttpC0auzAMsH7OUVsbA+QtrsjGiuV7h3U84=;
 b=OEmLLlIzDteGG9Dhu0ASxOzJvr3+7CAUaXkCKVJaeO9WeM44o7ujRgwJ8jn842LJFY
 ufzi88H3ffOMaRfm5WIYCS6oEV6z/Ci5ZhnJD/s9uVrYGDdOIa/MJnv3gVqbnbQU3WGY
 LfJ2BCkh41/Ck5+SrcjS2RmBeOrZAKAEIsSjNu894bwi6p93N+JVR0XSvA+831BjWKyV
 vScPI10Jp30cAVfZAA6sPDZwNEoJ20vd7ONTgcILNJQWyzwyDb3kVHTYNrO3aX+Y5ufc
 Lu+nt6stw9tVAVB2DU3DrKWGYAY9hM4Io7JC6slFIAzM6173AxnW50LHpKIdqYrTU9hZ
 3JtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O8WE4JThttpC0auzAMsH7OUVsbA+QtrsjGiuV7h3U84=;
 b=bPwylQAbB8MfUS8GkwS0FNyL6jN8mWEgi9gyzRxgJ7MDy3G/vmc/cBVXgfa2Gg32en
 h+DDpwH1oi6SxUSSe2HflCr3G4S5NVsATD3zj1WzDPqnrEVNZUqgOQWyCSKIZ5eTKgAV
 HQOpkjJxOowOU5L9X/suGSSI4QVDQIr9Xse8w2x4IHX4NpCSq7199uQSSAW+jfuEqPxT
 DH1viwm4JmWZkRcjrgzhlxlzFPhHLqN/uSvoIgpwW/4zFKAzcY4Y5nLphGNYHI0g+H1O
 fi3IdjyqPzmdtAzY6sJjaFW9dQ1+RntUkseOrVNHjg+OWLeM2D+CR0hPJWhYyG1rDs5J
 WlnA==
X-Gm-Message-State: AOAM532uQqzUCgci42aMydI1aEgSVrtpdCbnSqri3C66huBivk0rZr5s
 mDP2Xn6PPd5hIgwwX/ujuSA=
X-Google-Smtp-Source: ABdhPJxCoxOtjobzjtFOX6Y1yM1ByjOfNZ3FaL0wJWPc7CI4WWs/SqYk4RakQhnBFzlFI/y5LUJafw==
X-Received: by 2002:a63:460d:: with SMTP id t13mr1441285pga.41.1628845360624; 
 Fri, 13 Aug 2021 02:02:40 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id 31sm1818428pgy.26.2021.08.13.02.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 02:02:40 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH 2/2] drm: unexport drm_ioctl_permit
Date: Fri, 13 Aug 2021 16:54:50 +0800
Message-Id: <20210813085450.32494-3-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210813085450.32494-1-desmondcheongzx@gmail.com>
References: <20210813085450.32494-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
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

Since the last user of drm_ioctl_permit was removed, and it's now only
used in drm_ioctl.c, unexport the symbol.

Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_ioctl.c | 15 +--------------
 include/drm/drm_ioctl.h     |  1 -
 2 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index eb4ec3fab7d1..fe271f6f96ab 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -522,19 +522,7 @@ int drm_version(struct drm_device *dev, void *data,
 	return err;
 }
 
-/**
- * drm_ioctl_permit - Check ioctl permissions against caller
- *
- * @flags: ioctl permission flags.
- * @file_priv: Pointer to struct drm_file identifying the caller.
- *
- * Checks whether the caller is allowed to run an ioctl with the
- * indicated permissions.
- *
- * Returns:
- * Zero if allowed, -EACCES otherwise.
- */
-int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
+static int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
 {
 	/* ROOT_ONLY is only for CAP_SYS_ADMIN */
 	if (unlikely((flags & DRM_ROOT_ONLY) && !capable(CAP_SYS_ADMIN)))
@@ -557,7 +545,6 @@ int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
 
 	return 0;
 }
-EXPORT_SYMBOL(drm_ioctl_permit);
 
 #define DRM_IOCTL_DEF(ioctl, _func, _flags)	\
 	[DRM_IOCTL_NR(ioctl)] = {		\
diff --git a/include/drm/drm_ioctl.h b/include/drm/drm_ioctl.h
index 13a68cdcea36..fd29842127e5 100644
--- a/include/drm/drm_ioctl.h
+++ b/include/drm/drm_ioctl.h
@@ -174,7 +174,6 @@ struct drm_ioctl_desc {
 		.name = #ioctl						\
 	}
 
-int drm_ioctl_permit(u32 flags, struct drm_file *file_priv);
 long drm_ioctl(struct file *filp, unsigned int cmd, unsigned long arg);
 long drm_ioctl_kernel(struct file *, drm_ioctl_t, void *, u32);
 #ifdef CONFIG_COMPAT
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
