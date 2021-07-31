Return-Path: <SRS0=pOiW=MX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6F0C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Jul 2021 08:27:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 919D860F39
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Jul 2021 08:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 919D860F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 506214028F;
	Sat, 31 Jul 2021 08:27:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z9BJyw8LaX1d; Sat, 31 Jul 2021 08:27:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3B6324026D;
	Sat, 31 Jul 2021 08:27:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19D7DC0010;
	Sat, 31 Jul 2021 08:27:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13B7FC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 08:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAE8583231
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 08:27:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lkm80JOns32g
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 08:27:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65E8183267
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 08:27:05 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id j1so18561433pjv.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 01:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y7LF0TOJBi8g9oPoxvzY/IMHVXJRvIokqXJgW7n6wWU=;
 b=RJZ+rGSe9MjdSJpshgn6FdDtxzCLxvmvsad50TODML9WAleAKQiueuhET8/vduh88F
 S3Xqko1C4QRjj8UG4Wji5ctfC1UfiIV6IuBkUa5GVC4yIbAN60i2NkHaPW4XoZPQFS65
 4wCuYy5XdHd1w9ZYa+56L8c2ofiod/VTV1cZEhZYPokwnz/Q2slvJjtd+JnfbTNdC56v
 P9L35LIukKhPtFZLpaHXBWYCrD5hBpoQ+I7DZnlBVasE9yHb0zuJyTQeLEMrU/wbfaxy
 baMBSXRZ4aOnXooLgYsykXafJY5MUEZkh5g9EZ+m5U0yN9CCpWoRLru57HYs6wf6U7/E
 ERrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y7LF0TOJBi8g9oPoxvzY/IMHVXJRvIokqXJgW7n6wWU=;
 b=aCpdGoMlef+Quc1LDLFlSamg6ZIQa/ni0NpAUcFsKf9VHK7ZITgXtodrUmrLJSHXzw
 oxwMVfSCRXGLiL0Ve27I2CDHLT0RKOwNpoVCBK6/01sx+3vlL0lvHDeYGHMllqc+pz4p
 rFHQKxty2LZadVBmhsGCL0dCT+W5Yk65JoRANv71k9lOasCbfBR4lcWAoyhoB9BaixEB
 9DbflH1yMX2gUV3HKDoVg3ZnVPEQR4YgoCIPKvdSSSsodAfWa7MaoJFhUqHkssR24DlO
 LG7jtJI8ypQ3oPFQO0RAnbiTb7PPlZKEDCpY8QPBluJk72KN1mkvcN5eQdOSioKSh5ri
 zY/A==
X-Gm-Message-State: AOAM533r+6wAp6PgI194A4wsiFn2fF2825qbmyfloaYC6EA4HS0Gu6DJ
 j5JRLQh+yOIYbwESZmrx7T3Dy3c2tDio5juoHms=
X-Google-Smtp-Source: ABdhPJzd5bUpeB5fpe0qkJXVTRCMKBesE410MgSb6QJZrGqvamH8Z/gVzFKaP0OmfXbgFlYSkhMzWg==
X-Received: by 2002:a17:902:d293:b029:12c:8bb3:7997 with SMTP id
 t19-20020a170902d293b029012c8bb37997mr6015717plc.36.1627720024937; 
 Sat, 31 Jul 2021 01:27:04 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id mq7sm3182124pjb.50.2021.07.31.01.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 01:27:04 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, peterz@infradead.org, mingo@redhat.com,
 will@kernel.org, longman@redhat.com, boqun.feng@gmail.com
Subject: [PATCH v2 2/2] drm: add lockdep assert to drm_is_current_master_locked
Date: Sat, 31 Jul 2021 16:24:58 +0800
Message-Id: <20210731082458.1962043-3-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210731082458.1962043-1-desmondcheongzx@gmail.com>
References: <20210731082458.1962043-1-desmondcheongzx@gmail.com>
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

In drm_is_current_master_locked, accessing drm_file.master should be
protected by either drm_file.master_lookup_lock or
drm_device.master_mutex. This was previously awkward to assert with
lockdep.

Following patch ("locking/lockdep: Provide lockdep_assert{,_once}()
helpers"), this assertion is now convenient. So we add in the
assertion and explain this lock design in the kerneldoc.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Acked-by: Boqun Feng <boqun.feng@gmail.com>
Acked-by: Waiman Long <longman@redhat.com>
---
 drivers/gpu/drm/drm_auth.c | 6 +++---
 include/drm/drm_file.h     | 4 ++++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 9c24b8cc8e36..6f4d7ff23c80 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -63,9 +63,9 @@
 
 static bool drm_is_current_master_locked(struct drm_file *fpriv)
 {
-	/* Either drm_device.master_mutex or drm_file.master_lookup_lock
-	 * should be held here.
-	 */
+	lockdep_assert_once(lockdep_is_held(&fpriv->master_lookup_lock) ||
+			    lockdep_is_held(&fpriv->minor->dev->master_mutex));
+
 	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
 }
 
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 726cfe0ff5f5..a3acb7ac3550 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -233,6 +233,10 @@ struct drm_file {
 	 * this only matches &drm_device.master if the master is the currently
 	 * active one.
 	 *
+	 * To update @master, both &drm_device.master_mutex and
+	 * @master_lookup_lock need to be held, therefore holding either of
+	 * them is safe and enough for the read side.
+	 *
 	 * When dereferencing this pointer, either hold struct
 	 * &drm_device.master_mutex for the duration of the pointer's use, or
 	 * use drm_file_get_master() if struct &drm_device.master_mutex is not
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
