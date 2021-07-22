Return-Path: <SRS0=qmss=MO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00973C63797
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Jul 2021 12:33:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7DBD6135C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Jul 2021 12:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7DBD6135C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anirudhrb.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DFC740373;
	Thu, 22 Jul 2021 12:33:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u__cCuCmkWzX; Thu, 22 Jul 2021 12:33:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B4F1D40243;
	Thu, 22 Jul 2021 12:33:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B560C001A;
	Thu, 22 Jul 2021 12:33:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DCADAC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 12:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC1A0831C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 12:33:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=anirudhrb.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xqF9n19OMa1h
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 12:33:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com
 [136.143.188.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18A97831AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 12:33:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1626957177; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=N8+s10UUCPrRTIHdZ7+OXEAAsibFuDaBZwR9+CkOhjV3SfkXgJRMR+RQfw5uwN6ADhVzQ3c0DwBoaTA4/JU5rT1hXE8u7rEI6A9QEcyvNWwhZ05Wu3WXT2ZgYoIO5ZYfCGkX1hltn6UK/MAtOklGbvOLBWdT1aSYbLAekMnYWuQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1626957177;
 h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=8n8UvWi3wpZJmjoxSKsVTa3O3ZF6lWqEJEHCJt2hUds=; 
 b=iqAwkD9Zuzy28JOqN3DKQN7063Pk6FOJFPJJe4yXH2GhHmYOfGLo7obb6jkSut0aXeveu2F2NnG5iGyytxxHPQlYQlFIdzJ4jd537khQV19sY/Sh2fFJGMXFhEI9zoQN0UVYMid6PiqLWlFKklsXHmEyAvAwFkPelSr+d+prXzE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=anirudhrb.com;
 spf=pass  smtp.mailfrom=mail@anirudhrb.com;
 dmarc=pass header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1626957177; 
 s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=8n8UvWi3wpZJmjoxSKsVTa3O3ZF6lWqEJEHCJt2hUds=;
 b=RwrPsltVo5Od/zPEBzcTzBBFderlhEGYB6BY407iMEdhpe4GkmCFyI0YQaYsc/rY
 xGsqL5w6Aggt5v//6i9lktlkkyETy6X/Y//EnaMVQiu0EYD1eaQTMfa8zTAL+GPh3c6
 eiT+5I7cZEJOrUywunIZFnpRpEMf4PonjQl2Z6rY=
Received: from localhost.localdomain (49.207.63.174 [49.207.63.174]) by
 mx.zohomail.com with SMTPS id 1626957174048539.5192747039472;
 Thu, 22 Jul 2021 05:32:54 -0700 (PDT)
From: Anirudh Rayabharam <mail@anirudhrb.com>
To: mcgrof@kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org,
 skhan@linuxfoundation.org
Subject: [PATCH v6 1/2] firmware_loader: use -ETIMEDOUT instead of -EAGAIN in
 fw_load_sysfs_fallback
Date: Thu, 22 Jul 2021 18:02:28 +0530
Message-Id: <20210722123229.8731-2-mail@anirudhrb.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210722123229.8731-1-mail@anirudhrb.com>
References: <20210722123229.8731-1-mail@anirudhrb.com>
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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

The only motivation for using -EAGAIN in commit 0542ad88fbdd81bb
("firmware loader: Fix _request_firmware_load() return val for fw load
abort") was to distinguish the error from -ENOMEM, and so there is no
real reason in keeping it. Keeping -ETIMEDOU is much telling of what the
reason for a failure is, so just use that.

The rest is just trying to document a bit more of the motivations for the
error codes, as otherwise we'd lose this information easily.

Suggested-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
---
 drivers/base/firmware_loader/fallback.c | 34 +++++++++++++++++--------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/base/firmware_loader/fallback.c b/drivers/base/firmware_loader/fallback.c
index 91899d185e31..1db94165feaf 100644
--- a/drivers/base/firmware_loader/fallback.c
+++ b/drivers/base/firmware_loader/fallback.c
@@ -70,7 +70,29 @@ static inline bool fw_sysfs_loading(struct fw_priv *fw_priv)
 
 static inline int fw_sysfs_wait_timeout(struct fw_priv *fw_priv,  long timeout)
 {
-	return __fw_state_wait_common(fw_priv, timeout);
+	int ret = __fw_state_wait_common(fw_priv, timeout);
+
+	/*
+	 * A signal could be sent to abort a wait. Consider Android's init
+	 * gettting a SIGCHLD, which in turn was the same process issuing the
+	 * sysfs store call for the fallback. In such cases we want to be able
+	 * to tell apart in userspace when a signal caused a failure on the
+	 * wait. In such cases we'd get -ERESTARTSYS.
+	 *
+	 * Likewise though another race can happen and abort the load earlier.
+	 *
+	 * In either case the situation is interrupted so we just inform
+	 * userspace of that and we end things right away.
+	 *
+	 * When we really time out just tell userspace it should try again,
+	 * perhaps later.
+	 */
+	if (ret == -ERESTARTSYS || fw_state_is_aborted(fw_priv))
+		ret = -EINTR;
+	else if (fw_priv->is_paged_buf && !fw_priv->data)
+		ret = -ENOMEM;
+
+	return ret;
 }
 
 struct fw_sysfs {
@@ -526,20 +548,12 @@ static int fw_load_sysfs_fallback(struct fw_sysfs *fw_sysfs, long timeout)
 	}
 
 	retval = fw_sysfs_wait_timeout(fw_priv, timeout);
-	if (retval < 0 && retval != -ENOENT) {
+	if (retval < 0) {
 		mutex_lock(&fw_lock);
 		fw_load_abort(fw_sysfs);
 		mutex_unlock(&fw_lock);
 	}
 
-	if (fw_state_is_aborted(fw_priv)) {
-		if (retval == -ERESTARTSYS)
-			retval = -EINTR;
-		else
-			retval = -EAGAIN;
-	} else if (fw_priv->is_paged_buf && !fw_priv->data)
-		retval = -ENOMEM;
-
 	device_del(f_dev);
 err_put_dev:
 	put_device(f_dev);
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
