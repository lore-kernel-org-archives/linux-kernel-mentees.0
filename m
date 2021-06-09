Return-Path: <SRS0=caaf=LD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 099F4C47095
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Jun 2021 09:22:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5DA96120F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Jun 2021 09:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5DA96120F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7048B60888;
	Wed,  9 Jun 2021 09:22:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jgh_gq2CQVbH; Wed,  9 Jun 2021 09:22:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9D15D606D8;
	Wed,  9 Jun 2021 09:22:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70506C000E;
	Wed,  9 Jun 2021 09:22:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C2EFDC000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Jun 2021 09:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 990196082B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Jun 2021 09:22:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NVsMBIoDklK6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Jun 2021 09:22:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C29D7606D8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Jun 2021 09:22:00 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id y11so10797470pgp.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Jun 2021 02:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1HdeYeZU8aBbB01u3EptGGzTktTYXaU7YZzov/SDA8I=;
 b=b4EpkScIYTfhDr+1DMH9NGb/JEGCVMC9I0UEyR0v35fGLBQSlI8BS1JDdPwEi26sGQ
 KPb2AUw2GDSNvGJGPErFOeww/av+JYG7UmLiOxZgOlAggtefR5FUeMsoRoDKnhoHtI8u
 0E0v05ydQAErk3dBnyG43LsFRo9bYbJkhu+NdLUfvu+vjlDoM3ZknsyBXJ9NjBDzpAcr
 HLBi/331j1metmaNnix8gGpxm82JMyR1mV18SJZWKZJpLxC2uTO8gup6tbgZ003q4Of5
 MznuY50X/r972sJpUhon8MiAZUcUYmgfQTYatvtdKj6f1XI5znqAeyQ7060yHHdxWgGA
 rSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1HdeYeZU8aBbB01u3EptGGzTktTYXaU7YZzov/SDA8I=;
 b=XsxeKPLEVpY3M9t3wMFbZnt3Pswz5cAY3E1Tt8qIcS3b/wzOcsgh3+G2dMjW5XVDlL
 bSSuasyVz8pNs26Dlnfnr5YIFtz/njisHAJOv3HlG1MUy7kl4bkdRotWNSkJChyebdiB
 PpLqFGPylI2U/AQ7V7/sxR5fWZU6JpgJqkpQ3GGyEg9RMQ2K9Q9ynW7OxjYL/UUiAn9b
 InJJl2mVloIXiV6GWXy7RGoqOCZDwUDj4YZnWzWdGdLLvjFagdE6P6MIHx/eYG1nHvwJ
 Wu9Ox0nXCN3h9EJkJilJYGTGT1A7BhLDo6BGQ1ENMVQiH204RSR2wRM8540ZboJGfIr7
 B6Rw==
X-Gm-Message-State: AOAM533pZ4/8KImPzAEy4i00z7q/FjYSG1OmlqwlEnTUOdvpynYcypeb
 WwgnbC19ItG8uHuDBpdVp/c=
X-Google-Smtp-Source: ABdhPJwJbjQpq27OslPPl05sK51n7VSNJg+Oy499gokZlzfdlXjo0kUTNl8b19jl4Y/n4hNDMlA3Ow==
X-Received: by 2002:a65:4508:: with SMTP id n8mr2895991pgq.120.1623230520212; 
 Wed, 09 Jun 2021 02:22:00 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id z22sm13793464pfa.157.2021.06.09.02.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 02:21:59 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm: Lock pointer access in drm_master_release()
Date: Wed,  9 Jun 2021 17:21:19 +0800
Message-Id: <20210609092119.173590-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Dan Carpenter <dan.carpenter@oracle.com>
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

This patch eliminates the following smatch warning:
drivers/gpu/drm/drm_auth.c:320 drm_master_release() warn: unlocked access 'master' (line 318) expected lock '&dev->master_mutex'

The 'file_priv->master' field should be protected by the mutex lock to
'&dev->master_mutex'. This is because other processes can concurrently
modify this field and free the current 'file_priv->master'
pointer. This could result in a use-after-free error when 'master' is
dereferenced in subsequent function calls to
'drm_legacy_lock_master_cleanup()' or to 'drm_lease_revoke()'.

An example of a scenario that would produce this error can be seen
from a similar bug in 'drm_getunique()' that was reported by Syzbot:
https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803

In the Syzbot report, another process concurrently acquired the
device's master mutex in 'drm_setmaster_ioctl()', then overwrote
'fpriv->master' in 'drm_new_set_master()'. The old value of
'fpriv->master' was subsequently freed before the mutex was unlocked.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index f00e5abdbbf4..b59b26a71ad5 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -315,9 +315,10 @@ int drm_master_open(struct drm_file *file_priv)
 void drm_master_release(struct drm_file *file_priv)
 {
 	struct drm_device *dev = file_priv->minor->dev;
-	struct drm_master *master = file_priv->master;
+	struct drm_master *master;
 
 	mutex_lock(&dev->master_mutex);
+	master = file_priv->master;
 	if (file_priv->magic)
 		idr_remove(&file_priv->master->magic_map, file_priv->magic);
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
