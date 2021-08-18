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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F72C4320E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 07:40:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A43FA606A5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 07:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A43FA606A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79E32403FC;
	Wed, 18 Aug 2021 07:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XllT8Wcren68; Wed, 18 Aug 2021 07:40:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 706844032C;
	Wed, 18 Aug 2021 07:40:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D21CC001A;
	Wed, 18 Aug 2021 07:40:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55294C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 07:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37CF8606BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 07:40:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4A516CuYwenD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 07:40:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE7A1606D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 07:40:27 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id g14so1268715pfm.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 00:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rPzlSJpSXI27Gad1u8smJdYmSOWjamjBkzviSiNS/Mc=;
 b=MIflcts7D1tN8J3RdN87d9ZHJdOVpi/Y7ERqfgGkMxAqizTDrZnC3zn84IGdMDNRG1
 TsFbeCSOdQo/Py1VHAlmJ2MwCLS58e8AwZ3j0AmDq2lZt9m0I0r4oz1W+KNW0xT6REua
 AI6k7qV4XuH6g9S6w8mtDN7gwjkQWEmR3Fxw92LdtRu9MxRBTRrZi0MJPXEAklNUzX+x
 x/F0npPWDZEuxnkDlDLzFPp7OPuMsmpLPntndLZBFDIjlhQ1TUX3UwYtEu5bOGfndBuw
 3iqn0xCowwCGjsX1K3etz2Bt2fKjWBrGnZTeAbNexlkiWTFYyIYQnvQRIt1410FKUqvh
 fIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rPzlSJpSXI27Gad1u8smJdYmSOWjamjBkzviSiNS/Mc=;
 b=tgdXqG5TetnYuPz2z4vO2JR1Bh76kgCVBFD8tdSBJtAEZFitfWxam54L1qRUlZSUkP
 ghfhajmBYKdf0tpaJhcoVaY4rvKxBodjAReSudFeL80fHl19XZpWMKEhFt64JQ1eyfyv
 pNrcrsd4302pMHdeNUDrF/kCL5weGrFX+xHI9kYGlcTuJAuEC1mOP6qekCPBX9f0s6S2
 jFbflYCQ3eDYWKaQr7FXoV//OjkMilc0YgaLdrg7REuy3y6bAJW1+Xp/u20RAxnZ+pLQ
 shfoYnuXMZrCleaD68Vfy8AuDb16srxRKtnRNJWuwicckP+i8qiQRB02eTnJIu2JCjQB
 h56Q==
X-Gm-Message-State: AOAM530QXGshye9XrDeb62rx28X5o6d63lcYnWBY8pPgk4dxmZ35K/qR
 yKvIlRvrPfJZ67p9KbyTwEM=
X-Google-Smtp-Source: ABdhPJy/fzSnhMD3q0lPJ928lvoZMJnf6R2L7yWez8jfwKjnKO8/BzrE5reAPVzX3+BXN8wNfdHHOQ==
X-Received: by 2002:a65:63d6:: with SMTP id n22mr5409905pgv.74.1629272427179; 
 Wed, 18 Aug 2021 00:40:27 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id u3sm3886729pjr.2.2021.08.18.00.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 00:40:26 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com, axboe@kernel.dk, oleg@redhat.com,
 tglx@linutronix.de, dvyukov@google.com, walter-zh.wu@mediatek.com
Subject: [PATCH v3 2/9] drm: hold master_lookup_lock when releasing a
 drm_file's master
Date: Wed, 18 Aug 2021 15:38:17 +0800
Message-Id: <20210818073824.1560124-3-desmondcheongzx@gmail.com>
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

When drm_file.master changes value, the corresponding
drm_device.master_lookup_lock should be held.

In drm_master_release, a call to drm_master_put sets the
file_priv->master to NULL, so we protect this section with
drm_device.master_lookup_lock.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 8efb58aa7d95..8c0e0dba1611 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -373,8 +373,11 @@ void drm_master_release(struct drm_file *file_priv)
 	}
 
 	/* drop the master reference held by the file priv */
-	if (file_priv->master)
+	if (file_priv->master) {
+		spin_lock(&dev->master_lookup_lock);
 		drm_master_put(&file_priv->master);
+		spin_unlock(&dev->master_lookup_lock);
+	}
 	mutex_unlock(&dev->master_mutex);
 }
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
