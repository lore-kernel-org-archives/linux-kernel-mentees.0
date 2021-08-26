Return-Path: <SRS0=MGRu=NR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2CCFC432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Aug 2021 02:02:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AABEA60F5C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Aug 2021 02:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AABEA60F5C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7624A406C1;
	Thu, 26 Aug 2021 02:02:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aVA9At7JR7Q0; Thu, 26 Aug 2021 02:02:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id AD55F4053E;
	Thu, 26 Aug 2021 02:02:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B25BC0010;
	Thu, 26 Aug 2021 02:02:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F8D4C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Aug 2021 02:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E63EE81CAD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Aug 2021 02:02:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6NMgXPUPLdHL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Aug 2021 02:02:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5681B81BF5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Aug 2021 02:02:16 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id mq3so1083856pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Aug 2021 19:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hm7YjUyiFZ/KTSC9DbXmgQsGRHrND7m8Eh1agHCitnc=;
 b=eL86sOSM38lNhD9QERUYW9QJOWqzwM9yMC5ODYSiS76jzKuzhpocylCwBl3NYLBrhn
 CeZZ4obH8pfh7ioTZINC44g6DS/7JTSqG0kgSxGe9myG/dr2y8wVsOgoBI+/pKmRnBeM
 I3kuQlSagQ+4bgPn4qboJAwIyFgI3YNHtEYvxollzFxBLnnpDmI8mUFXPVAMvkAjB15T
 8BYytvAIw9PXoJ7uR0L0hE+3UX56DgQ39jwoAEkDoqWst2RDm09ZvG7KzJxL69ttDEfN
 1moZPEAzMaCIbqb/GuJFOkzzdjqLI0J/MayaGM/DIJ+Il2kFxUyqRptnbPkIYceKYwfM
 hWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hm7YjUyiFZ/KTSC9DbXmgQsGRHrND7m8Eh1agHCitnc=;
 b=FFvCYOkeJno9AreWIMi8fyIY6zjaB8aLSqIV88+Xb7VQDFS+bqPn9Z7RMG1lGLHlXD
 Jua8kFX6bK2SWKQYKLAnmk/mQQXoITYJJxs2MgU6UINfQwCDqc1qp9PRQmgHm4yf+z29
 lNCbUwhnidN1oWegtIyKLGoSiaq9Bwcu9HutX6ikhzsj3btgsiRf8YIwjBReu6wATarD
 slRNEoBshtBSd2Z101B2JuEkk4xwO9RgUlvmcFuSPhL/fkGXkrgIgKKvTRhMtfqOVBts
 JM7MtNvHklrZhRrtk9WSy4SX9lvvy0G1fl55YgMJycg2t6l36En6ZxpjyFfAlnRRszGj
 iQGA==
X-Gm-Message-State: AOAM532iPLkqo4QTIwNn9LS+xnqhBrmifWhgkuTlg0R8lhgtF8XLl8NB
 SWdI7fLZM4b0TaHgxWJoO2A=
X-Google-Smtp-Source: ABdhPJxe7t5OmIkGit7oUHWuu+mWVsnNAK5sHRclsy4or+MfmMDi12IoLs2rUt7azoHz5WvKKkFx+w==
X-Received: by 2002:a17:902:e891:b029:12d:6824:9d28 with SMTP id
 w17-20020a170902e891b029012d68249d28mr1344605plg.23.1629943335829; 
 Wed, 25 Aug 2021 19:02:15 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id i11sm721973pjj.19.2021.08.25.19.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 19:02:15 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chris@chris-wilson.co.uk, ville.syrjala@linux.intel.com,
 matthew.auld@intel.com, dan.carpenter@oracle.com, tvrtko.ursulin@intel.com,
 matthew.d.roper@intel.com, lucas.demarchi@intel.com, karthik.b.s@intel.com,
 jose.souza@intel.com, manasi.d.navare@intel.com, airlied@redhat.com,
 aditya.swarup@intel.com, andrescj@chromium.org,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com
Subject: [PATCH v8 1/7] drm: fix null ptr dereference in drm_master_release
Date: Thu, 26 Aug 2021 10:01:16 +0800
Message-Id: <20210826020122.1488002-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210826020122.1488002-1-desmondcheongzx@gmail.com>
References: <20210826020122.1488002-1-desmondcheongzx@gmail.com>
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

drm_master_release can be called on a drm_file without a master, which
results in a null ptr dereference of file_priv->master->magic_map. The
three cases are:

1. Error path in drm_open_helper
  drm_open():
    drm_open_helper():
      drm_master_open():
        drm_new_set_master(); <--- returns -ENOMEM,
                                   drm_file.master not set
      drm_file_free():
        drm_master_release(); <--- NULL ptr dereference
                                   (file_priv->master->magic_map)

2. Error path in mock_drm_getfile
  mock_drm_getfile():
    anon_inode_getfile(); <--- returns error, drm_file.master not set
    drm_file_free():
      drm_master_release(); <--- NULL ptr dereference
                                 (file_priv->master->magic_map)

3. In drm_client_close, as drm_client_open doesn't set up a master

drm_file.master is set up in drm_open_helper through the call to
drm_master_open, so we mirror it with a call to drm_master_release in
drm_close_helper, and remove drm_master_release from drm_file_free to
avoid the null ptr dereference.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_file.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index ed25168619fc..90b62f360da1 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -282,9 +282,6 @@ void drm_file_free(struct drm_file *file)
 
 	drm_legacy_ctxbitmap_flush(dev, file);
 
-	if (drm_is_primary_client(file))
-		drm_master_release(file);
-
 	if (dev->driver->postclose)
 		dev->driver->postclose(dev, file);
 
@@ -305,6 +302,9 @@ static void drm_close_helper(struct file *filp)
 	list_del(&file_priv->lhead);
 	mutex_unlock(&dev->filelist_mutex);
 
+	if (drm_is_primary_client(file_priv))
+		drm_master_release(file_priv);
+
 	drm_file_free(file_priv);
 }
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
