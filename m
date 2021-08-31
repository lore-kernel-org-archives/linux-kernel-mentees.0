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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C729C432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Aug 2021 07:25:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 442C86101B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Aug 2021 07:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 442C86101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 154D6607CB;
	Tue, 31 Aug 2021 07:25:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gwwYIObSKBFj; Tue, 31 Aug 2021 07:25:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 272AB60645;
	Tue, 31 Aug 2021 07:25:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14205C0010;
	Tue, 31 Aug 2021 07:25:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 32F7EC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Aug 2021 07:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22BE140459
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Aug 2021 07:25:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LNZK3GBVVPdM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Aug 2021 07:25:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93FDC40436
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Aug 2021 07:25:37 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id d17so10056359plr.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Aug 2021 00:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tHn1bKbgKWkWnpZZfeyzrlp2g8PdlS3oPFK4wibr8zM=;
 b=pMjwOP/19qT52lkjXq8sDWHfx7YGZ8eUQGoIKFiBmpYZXRbATElia9k4erKkY4o+gx
 bPv9Q+ALqfj6l0g/7NXoYBsBaUHHT+6gpUJC0TZZA35oV6yJRINlv14SbH4wmA+hWnld
 A5j6PaQ1FR2HPB1VVcngEVYOmhQ+NpLjrks7l/GQz3GiD/Ij6t9cbltGAt9Ghki/8W2G
 8wonwnJqSZ31sN7su4nbQ9ehq6UPI2UCarkMqTB4TAcyt0O3UBFAOrpejOLa2u2DFQOG
 seyxkNmsGWqWrmFUoPEtoV5VSb1OXPvizXaVppaQ4FJhDNDk0jkvQTAQjwiWAZ/5FHb6
 r8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tHn1bKbgKWkWnpZZfeyzrlp2g8PdlS3oPFK4wibr8zM=;
 b=eQ2xQ21kUSfzhZn3OymqZVUH5C/VaBw3WcX7F02GBjGjy2D3dLRq/iZI6bznog4Bii
 dbTTaYf1ai4fohJzxX+R0QJzEe/2of8xBBmETYPv5c+7ZhEraKYz48P2cAclkTP42M+S
 JmsUIeb41pBmIkbsKWAJDH+ep17pBxUX+/qtzFKHOEZtk/wW/d9HfINatsh0/ahEKo0R
 3OVaoy9jnV6J2nzBmwRaBD8igq6TWJpPHVleSpSod/51LjdqfiUi7Ee2c6ZmbT5jZ6eg
 S31W5pW6gpZdYEx/cn9XFqr0t3kNBunNehsnozxbuRSvcy217AEbZLNy2Rw5tjvw3KCk
 MVZg==
X-Gm-Message-State: AOAM531D83s6ZOBxNvPzadqUNDNsfmN/CNMCTAcrXzAnplGl4trCeVrz
 gWlX5d6S8k4P8WL3k2r0Qyo=
X-Google-Smtp-Source: ABdhPJzpV2t1yFkjJNCWkF5oIEd1fc2kRhKJQqIj82vlMWjQvXBEEUimnllxLVlQqW5CEZE3+9QHpA==
X-Received: by 2002:a17:90a:2e88:: with SMTP id
 r8mr3698988pjd.169.1630394737112; 
 Tue, 31 Aug 2021 00:25:37 -0700 (PDT)
Received: from sanitydock.wifi-cloud.jp ([210.160.217.69])
 by smtp.gmail.com with ESMTPSA id m11sm1720724pjn.2.2021.08.31.00.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 00:25:36 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v10 1/4] drm: fix null ptr dereference in drm_master_release
Date: Tue, 31 Aug 2021 15:24:58 +0800
Message-Id: <20210831072501.184211-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831072501.184211-1-desmondcheongzx@gmail.com>
References: <20210831072501.184211-1-desmondcheongzx@gmail.com>
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
