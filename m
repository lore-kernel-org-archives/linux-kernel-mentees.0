Return-Path: <SRS0=Q5UI=MQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 094BCC432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Jul 2021 11:19:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6F0060E95
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Jul 2021 11:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A6F0060E95
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76DA1829DB;
	Sat, 24 Jul 2021 11:19:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2vecWUSnyyQk; Sat, 24 Jul 2021 11:19:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B190D82849;
	Sat, 24 Jul 2021 11:19:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B787C001A;
	Sat, 24 Jul 2021 11:19:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0D6EC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 11:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1AFB6071F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 11:19:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O4KlG1r2zrxv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 11:19:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59D8D606F8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 11:19:17 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso1258755pjf.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 04:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9YtTx2F8aCtjxUTXqe0aUtd1QKwb/HSkiydeejpIB4k=;
 b=DvPcmCPEmDyLe3TGFTP1QJeVA2WB+aAXO8mtDMt92/tIWfVwoxyj/t+ohBnZhllumo
 FE8nIVjaonsiw5dBGIuKHq5HwvCS+RUy7HQLPgjUJ2OG2ki1X2sPyNz9OTIz5RDCj/Q0
 TULtxmO2p7V7NaIniuhDYieJ05ETRDTZNH06S96TDnJAYDgnwUyK56O6hTnJIBCrZzbz
 oE2sV1ptouoT+cunTJ6XEJvbfVFqHx6uyfCFZdyW/zYc0CLRjOcIxxstpi8unewZ8ZMw
 CcMBMYraxUKiFmoranTvKMp1CVTb6CaPaHx45wcC25uTJLdvQmxvvr3oWnzD4gXSggTr
 5YEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9YtTx2F8aCtjxUTXqe0aUtd1QKwb/HSkiydeejpIB4k=;
 b=F3pPS9UMGSnCAtG7KxR9geQEtUpnOAdIrXDl611XpKlEbTY4FzWFBIUBp45YzNH9ji
 Q+qszQDN8kPL9eKADZmTmP2k3mZtuZbwoCGdJZUHihhMat1kbfFavYPDW1AcwCdniWCg
 2ayyu3IHWx7UQx1cDmBuzaTcdB+vJEICFN8zy861ZOIApiGMmZaU/etoZYAXkX8pr28h
 X0yGsZpQsRPchyqa9Aje1BP2K3GIAdFXOnAIKBoLEmoA3YCebo4YcZfO4Qkq9gVheqZ4
 0pWdj7F/+Wq/mKEASahzjJo/0MsfLSPCUuZ3Lvq6MD3ZIgoLVTb2ov0PB7jo4XTAHzAQ
 09JQ==
X-Gm-Message-State: AOAM533lZdXSB+yfaraAFFBSPwkUC9nSTFDLgipu3YiDzc0QS6ujRR6L
 XgDQfKUnb4+1kcX3bdhgEiM=
X-Google-Smtp-Source: ABdhPJyrONu1cda28NLCVz+hXTIkL/SdYozfXqjGTiFBPvzVDezB4CPrSnB9KOd278Mq2Mi/gub3UQ==
X-Received: by 2002:a17:90a:9ac:: with SMTP id
 41mr17424928pjo.97.1627125556886; 
 Sat, 24 Jul 2021 04:19:16 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id v15sm21310057pff.105.2021.07.24.04.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 04:19:16 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: linux-graphics-maintainer@vmware.com, zackr@vmware.com, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, corbet@lwn.net
Subject: [PATCH v2 1/3] drm: use the lookup lock in drm_is_current_master
Date: Sat, 24 Jul 2021 19:18:22 +0800
Message-Id: <20210724111824.59266-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210724111824.59266-1-desmondcheongzx@gmail.com>
References: <20210724111824.59266-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
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

Inside drm_is_current_master, using the outer drm_device.master_mutex
to protect reads of drm_file.master makes the function prone to creating
lock hierarchy inversions. Instead, we can use the
drm_file.master_lookup_lock that sits at the bottom of the lock
hierarchy.

Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_auth.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index f00354bec3fb..9c24b8cc8e36 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -63,8 +63,9 @@
 
 static bool drm_is_current_master_locked(struct drm_file *fpriv)
 {
-	lockdep_assert_held_once(&fpriv->minor->dev->master_mutex);
-
+	/* Either drm_device.master_mutex or drm_file.master_lookup_lock
+	 * should be held here.
+	 */
 	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
 }
 
@@ -82,9 +83,9 @@ bool drm_is_current_master(struct drm_file *fpriv)
 {
 	bool ret;
 
-	mutex_lock(&fpriv->minor->dev->master_mutex);
+	spin_lock(&fpriv->master_lookup_lock);
 	ret = drm_is_current_master_locked(fpriv);
-	mutex_unlock(&fpriv->minor->dev->master_mutex);
+	spin_unlock(&fpriv->master_lookup_lock);
 
 	return ret;
 }
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
