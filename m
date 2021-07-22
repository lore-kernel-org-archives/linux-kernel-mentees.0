Return-Path: <SRS0=qmss=MO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2083AC63798
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Jul 2021 09:30:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCA4F6121E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Jul 2021 09:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCA4F6121E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EB334033D;
	Thu, 22 Jul 2021 09:30:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GQdSzGFij_Oh; Thu, 22 Jul 2021 09:30:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id ACA5F4031E;
	Thu, 22 Jul 2021 09:30:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A752C0010;
	Thu, 22 Jul 2021 09:30:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20A92C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 09:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F8B76079F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 09:30:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2_QiboTMaS3a
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 09:30:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03F3F6074A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 09:30:11 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 i16-20020a17090acf90b02901736d9d2218so4656051pju.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 02:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RSgVdB0+HpET8iLINuWOoeOWDDxUJjmmluxZNEz35KA=;
 b=o6LJ/myMP6JO8ChH8dYoqq21TZnuVfWqQC7aMNZVbEwvgt/wmupSJe5X7mUycZZ1OP
 wZUOpxPzR0Di4iK476owf2txOnd8aRvZIuWOSyNSQwF8qAfJx1gZjc1rqQNENDcoU4k8
 pWfm16Rm2AyVdjC+e3kTofDMg7W/f1X4eU9NPEhv7mUcvN6ebC/kCdQLgGMJIgNOCd38
 Z79Cpgk8vmBkJLmcW9tTTfCW8TJv/6nRrpzuj2HycvK3LMZlVo0xpmCpHif6k1kmeqBf
 /hzT0Pmizi11dqx4L91lE1OKq6ULDL3w/A5pjP58k83vlOPYfDR9I9UDXt06Iw0JzA4O
 hv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RSgVdB0+HpET8iLINuWOoeOWDDxUJjmmluxZNEz35KA=;
 b=KN2/QPHwusYLn7ultgmgzXUvsIxzRX/N66p+gUsQ0yn8WXkm57gMWuNJbcfG38kFmj
 Vni4aCZRYWn3RASAYwkc3gRUS18fVeH7K223vkq5oIt5w2zq0jJHXWHnV6ZHKlxM3n2E
 Zd9vEIv/zGkTbjslw4UVVJzszI/VIQUjgtf585CJYRvERnBRnvBx8nxGqQ7Hb5LmMjpI
 BuxYM81V2GLguhKnV0T6zqlGDQTqVr6BCRCvgQwhqY+7BD8WFoLBkjsYYtHwef4dLK+5
 1aL3rdFc1b20BIOx25+AmP1pPek7/dupZiXfFQWoJ7sScWJl8wE0DN8sG+wz7qksV4fA
 /Nsw==
X-Gm-Message-State: AOAM531KTWsguwxqCgjCunrJIEmeEPgCOZk40/d8gkmrnutp5N21obEW
 HXfp9jKHEFeaEbhM9gZ2BDk=
X-Google-Smtp-Source: ABdhPJyscK7c550TzHfpDv1WRnYYvoBsSoBWYdMCW0natilUebpT1uRY7os1lbemOjfZnuzWFb0RqA==
X-Received: by 2002:a05:6a00:2306:b029:331:ebe8:a4b4 with SMTP id
 h6-20020a056a002306b0290331ebe8a4b4mr39978184pfh.15.1626946211504; 
 Thu, 22 Jul 2021 02:30:11 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id q5sm1069592pjo.7.2021.07.22.02.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 02:30:11 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: linux-graphics-maintainer@vmware.com, zackr@vmware.com, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de
Subject: [PATCH 1/3] drm: use the lookup lock in drm_is_current_master
Date: Thu, 22 Jul 2021 17:29:27 +0800
Message-Id: <20210722092929.244629-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722092929.244629-1-desmondcheongzx@gmail.com>
References: <20210722092929.244629-1-desmondcheongzx@gmail.com>
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
