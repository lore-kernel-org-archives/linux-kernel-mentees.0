Return-Path: <SRS0=59bo=NL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00CB9C4320E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Aug 2021 10:03:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96635610D2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Aug 2021 10:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 96635610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FFD240729;
	Fri, 20 Aug 2021 10:03:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bHyxVNgEDnC1; Fri, 20 Aug 2021 10:03:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 88A944035A;
	Fri, 20 Aug 2021 10:03:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74D41C001A;
	Fri, 20 Aug 2021 10:03:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 468F5C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 10:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35CDE4035A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 10:03:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A678UVZa3f7D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 10:03:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D689040724
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 10:03:38 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 qe12-20020a17090b4f8c00b00179321cbae7so6894753pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 03:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hm7YjUyiFZ/KTSC9DbXmgQsGRHrND7m8Eh1agHCitnc=;
 b=RRV2JyZgw8WjZHw+NGUYxj0uYQ4too9agb5VqtdVkn47PSkI01SJ8WjRPtsiVTKUtk
 r+OhkYkzHTR+/VNwcA8rc4OexXEeKCDdjdVcU+h/lxslrEmtdQk3ZCa5J9o6SSmLK4c9
 kiVACl2KhEeIgFzOwmHOM7mnMrBt83HsnrSmWTklRanG9qOgXEmAm5/W/VXjwXZzrfr/
 qXHv4Ejm9aMXIcVdfVeRqFxEYWff+6KMRPYaFijWp8tEWHAhzft0TKL2uND6h4sdO7g6
 94dElz0+iAOPKxI9r4gBUAXbBXWY2dxnG8Y0iAjcc5m0kTTI4UvwTztBnktQTI6NbUvJ
 t+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hm7YjUyiFZ/KTSC9DbXmgQsGRHrND7m8Eh1agHCitnc=;
 b=obXhVGzXRL+ZoEHrf/y8UWl/CJFOVc0Yfcb5nLZwr7Kv83w1nlQ/UXgntZoQwExR1V
 fzvPOg4DisFIihXtZTxz8Gv3Vu+D85LELzvJte5murJ9FFTWHrb9V6/OiReAnS+xBxKm
 Mb/q1qlyMzdJ9YQ7g+6kDatIJW/gRyeorIE1AKmD786D6aSCMZLRg6rDzDuo6hO9CQBP
 KmWIy4ya6cdJUaafjPI2mCOzjR+9DbQb0Mtw0ZxKQoRhfuAqssFk14ejApYDKpv0cR4N
 oPS2OEPL8+50/mLeOJxA/JY1kXWrg6mCl34GLEwwAEa1lnMVoBe2x4RbZgWYeR4f3NMn
 S/7g==
X-Gm-Message-State: AOAM530q/i2d0lQGAjcv0UBAziocr7I+hNcJZEwwsH5+nH2oo/gA6LG9
 JVFsf0PrQQNkLSknus/Ojgc=
X-Google-Smtp-Source: ABdhPJyAeCCNd+ZV72qw0T8ygRx7UffbRCyZoymA+AzlwiE7NY2E4dqxozaw/GJQAV5PfnujFnMZpQ==
X-Received: by 2002:a17:902:a503:b029:12b:2429:385e with SMTP id
 s3-20020a170902a503b029012b2429385emr15898527plq.64.1629453818332; 
 Fri, 20 Aug 2021 03:03:38 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id i8sm6503876pfo.117.2021.08.20.03.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 03:03:37 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v4 1/5] drm: fix null ptr dereference in drm_master_release
Date: Fri, 20 Aug 2021 18:02:47 +0800
Message-Id: <20210820100251.448346-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820100251.448346-1-desmondcheongzx@gmail.com>
References: <20210820100251.448346-1-desmondcheongzx@gmail.com>
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
