Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2687DC77B7F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 May 2023 17:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A29B81CE7;
	Sun, 14 May 2023 17:24:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A29B81CE7
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ZmAk5vL9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L515MD88hJ2o; Sun, 14 May 2023 17:24:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3EF4381B72;
	Sun, 14 May 2023 17:24:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EF4381B72
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 138DFC0037;
	Sun, 14 May 2023 17:24:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38BDDC002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 May 2023 17:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C40641E4C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 May 2023 17:24:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C40641E4C
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ZmAk5vL9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 919hjShVVPbh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 May 2023 17:24:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 059B941E4B
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 059B941E4B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 May 2023 17:24:03 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-50bfd66ba3eso2703623a12.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 May 2023 10:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684085042; x=1686677042;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bhdn8N3vjt5NpRXjd0CXpQ3x1s9gcdBgiJ6kPjy6i+k=;
 b=ZmAk5vL9yNEtkeODSVlHMUipUbsEG3xzA46o8BdUVqDQlN3FKOxOxR2LMx9Dh682s7
 5VrOnk2VAhIsNq/cTrRLmgQ4gEhXB4FKbHK92rCi8pnrFZ/sDfDXGSAaiwq/UVlLvhkV
 wJ6tkyjX8LYHmS8t7bMawnus6kXhMOxQrj8XxCrguUOlECf7OlVomgE+bLbjVW9kDHMT
 wjMZic4f86Z276EgD0cBUhg6CXHnUtWH5+FvaoSvhpJX+fa5kxizw1WBXnBBLWDnALlP
 qi08IHgzKHYdsOY+72oUVlyKpFssCiLqNMoHzf6APU4s4VC+haT6QoZiQzuHjt0gPg0V
 J0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684085042; x=1686677042;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bhdn8N3vjt5NpRXjd0CXpQ3x1s9gcdBgiJ6kPjy6i+k=;
 b=FrveKRR2XIAdveVlaKrTWRiPjUnfNeE3JSeDETzAj7raGHvGqrVLdPZGMf5D62i2Mg
 bb0R2aQaPSOn82yKzdWdkGSwF+CqB1B1BNtJd1UiA/S7uFM7aMdZ0ilZDyeWAcKtWs4R
 8gSn7uaP36f+l+/CU6EEdtT0kQIkWDpopU4fHr1ZElbhmBBs7HF7oFgoSbRZzK9SFAV3
 MDsKqgfppXJ+X1HUcEyPyqMqAwMJSPv8pZAZZTk7que9AlOPS5EbwLuYWZi+gQVd6wlJ
 aVN1beX0UmTpqJC1JzjU4kgG4dcTwWvZ0v4FjjQH6nvd6ZbIdM+WblR17x+M6U/9/Fit
 MqVg==
X-Gm-Message-State: AC+VfDz/TdZn10ZALP2fz47Cqtc/y0tUgEbo4vpy8F7A6b0vw3MNQA8s
 JMBh0EtMpVdGKVX6dwkWwpU=
X-Google-Smtp-Source: ACHHUZ7V/E1SXJmh0CcocZMAWa/YKLC03nZJyLWERYojD9FXz+CaJzep3o7rHLaWpWdYTH0XHSlZmA==
X-Received: by 2002:a05:6402:510e:b0:506:c24e:667d with SMTP id
 m14-20020a056402510e00b00506c24e667dmr29993006edd.4.1684085041883; 
 Sun, 14 May 2023 10:24:01 -0700 (PDT)
Received: from ivan-HLYL-WXX9.. ([37.252.94.55])
 by smtp.gmail.com with ESMTPSA id
 ig13-20020a1709072e0d00b0096623c00727sm8405986ejc.136.2023.05.14.10.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 May 2023 10:24:01 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org
Subject: [PATCH] debugfs: Correct the 'debugfs_create_str' docs
Date: Sun, 14 May 2023 21:23:53 +0400
Message-Id: <20230514172353.52878-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Ivan Orlov <ivan.orlov0322@gmail.com>, linux-kernel@vger.kernel.org
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

The documentation of the 'debugfs_create_str' says that the function
returns a pointer to a dentry created, or an ERR_PTR in case of error.
Actually, this is not true: this function doesn't return anything at all.
Correct the documentation correspondingly.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
 fs/debugfs/file.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index 1f971c880dde..b7711888dd17 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -940,15 +940,6 @@ static const struct file_operations fops_str_wo = {
  * This function creates a file in debugfs with the given name that
  * contains the value of the variable @value.  If the @mode variable is so
  * set, it can be read from, and written to.
- *
- * This function will return a pointer to a dentry if it succeeds.  This
- * pointer must be passed to the debugfs_remove() function when the file is
- * to be removed (no automatic cleanup happens if your module is unloaded,
- * you are responsible here.)  If an error occurs, ERR_PTR(-ERROR) will be
- * returned.
- *
- * If debugfs is not enabled in the kernel, the value ERR_PTR(-ENODEV) will
- * be returned.
  */
 void debugfs_create_str(const char *name, umode_t mode,
 			struct dentry *parent, char **value)
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
