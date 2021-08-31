Return-Path: <SRS0=gq+t=NW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C549C432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Aug 2021 06:14:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B77D160F4B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Aug 2021 06:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B77D160F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87A8940464;
	Tue, 31 Aug 2021 06:14:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WW0zTQxOvr2M; Tue, 31 Aug 2021 06:14:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A49D74030F;
	Tue, 31 Aug 2021 06:14:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83A09C0010;
	Tue, 31 Aug 2021 06:14:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D3F52C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Aug 2021 06:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6E1E81A5F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Aug 2021 06:14:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dE5NTaH5kqNN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Aug 2021 06:14:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 296B68197D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Aug 2021 06:14:47 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso1175694pjh.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Aug 2021 23:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tHn1bKbgKWkWnpZZfeyzrlp2g8PdlS3oPFK4wibr8zM=;
 b=eXIjFmJAssVk3qum2qiXCLhVDT8BHwEP00acuPJC6D3sWtXepsNRzl7WSa6QoQy99y
 dUAJT/Gv/isjtGOA3E207i4Tsg3jM8j5lwtN9mQ5mIE1L4CtzGYd9e/zLEhVdXiEHfEX
 MK3cuuw+X9WOT70++OXU9foFpZmdwQL8+ub9sVd8DFGdh2I4LBOAdF3P8oABbUdS/Y54
 4Qjd1EndwTYPXWN/mnR2yMNqh9M9wuTMFPtmjSuKYEHNCteFwK4boUyHPOoTuD7my/aS
 UQusq/C0g8X0wUQzNjsJflhtzcsL03ZTs8shCqEgQNJ4GLN+7wm4QawSviE32FE7ZpHH
 +2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tHn1bKbgKWkWnpZZfeyzrlp2g8PdlS3oPFK4wibr8zM=;
 b=OLv4bz2pA228bDOjM98y3YvKMH9159dUl87gUN00GeZhIq13AQnXO5qNt6dGU3OMnG
 yxuNWaxHEoIo7HlgWlUQ8yj0LMXH4zcMnIzFdScyYVG5Wuxm7S6shzzMStOjz7Lfpeg2
 UD0EEqvP+nNeT50hcJ1L7/bYjkbgfWhNOOa/tTgN0HviqpLYocRfeTXuzu3CLVWnT1ZQ
 EK/Sdk24TW6jKqzgx1XHJM52tgCOQCQm3vFK/oCrVMt0KBLkS/cICF/YctEZd+KPOYLD
 HXRAR3wWTnzIesyqaxTogZHqKhiwhrrVnfoVjTtcb+wgUcVn+x9ow440LAdaax0Ldz6S
 nnwA==
X-Gm-Message-State: AOAM531HhpE5IkS50hZNAZ6lS3jBluZsbqYfzd/nmbN9dWtdqJPt8gEv
 WBn1NTKnqLVFAPeU12WyMj8=
X-Google-Smtp-Source: ABdhPJzGmBXOz6okx6of+AFSntvusISTlHPl1xEvUsw8GRcQjM3xZQnn+uaj9N1kZDXhTmMeOXLoJw==
X-Received: by 2002:a17:90b:390d:: with SMTP id
 ob13mr3460845pjb.129.1630390486636; 
 Mon, 30 Aug 2021 23:14:46 -0700 (PDT)
Received: from sanitydock.wifi-cloud.jp ([210.160.217.69])
 by smtp.gmail.com with ESMTPSA id z7sm1405724pjr.42.2021.08.30.23.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 23:14:46 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v9 1/4] drm: fix null ptr dereference in drm_master_release
Date: Tue, 31 Aug 2021 14:13:45 +0800
Message-Id: <20210831061348.97696-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831061348.97696-1-desmondcheongzx@gmail.com>
References: <20210831061348.97696-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org,
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

Fixes: 7eeaeb90a6a5 ("drm/file: Don't set master on in-kernel clients")
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc: stable@vger.kernel.org
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
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
