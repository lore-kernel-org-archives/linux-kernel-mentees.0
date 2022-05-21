Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7FEC433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 May 2022 14:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AAF241C5E;
	Sat, 21 May 2022 14:49:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id upibwbjQNOeo; Sat, 21 May 2022 14:49:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C3EB541C06;
	Sat, 21 May 2022 14:49:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 80008C0039;
	Sat, 21 May 2022 14:49:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6F043C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 14:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CF0360D5F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 14:49:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M6qXfXirelBk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 14:49:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CEE5E605AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 14:49:04 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id z11so479410pjc.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 07:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aEDSE1m+N2pYJdPG78Lh5a6q6esXpeyoa6uPZvrclFc=;
 b=kb9ZmcDvj5VJ4lpdrtpjOvjhyAPEsiwHmOCR2kpfa+vsxplXPgjOoutoI/rjKVNCPI
 KjcuKVWcB7a5bx2IsWpZAgRccdl9hlXyd4KiWlDkQQFrDWQ6qMbsP6kyckc20/R3pl6k
 xG/as0Q0yWJPpSNOv3DOchIHTJKgOJky9HM+ky9R7OHfyDjGMELp2OAWlj6mleMd8nvf
 7oyeVqweqCAKuWjXMwiLF9R/u9v3L73AokJnkWJLCAoMSPIghQcH8OtknirTtdDOz+IW
 H3EGKIXfm7zDx4PYPID7ajjiPdtWQNmUGZ8jBNcCZEPWP1Svn92DCcABxqKEHiYl8FpN
 N1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aEDSE1m+N2pYJdPG78Lh5a6q6esXpeyoa6uPZvrclFc=;
 b=ZQATVP0gMlRpci5gYbibPssDQLdUBpgfxg+BjvnVgn9b8LRwqH3GoS8PnFm7/rMMvM
 lRxmuzn0yTqIshQu67BZRcv/a1kC2TdiunRg2ftpFZ7NC0ygcA54qOr+H4HENBLoilDz
 xFPXeIFYB+ZR6WTbahly4U84MGESwos0Dx5fA900WMYbDKO/DwK/P2sLnpolq0vWm6dn
 P4yjIPkNgKAJKnrmDjg7QX5CkZ0wU0k+5tOjupCvkgV7oZoOja9LVUmWaAb30AsSRFKI
 mtUqI7c22kSsMeQC4jiD/3XSdJ4cE02xy0U5CEd3oX4h+vUsN+Nuurqmd++BFXBzyPzR
 BPAA==
X-Gm-Message-State: AOAM5307sYeVmLQQhsk1V2mbZJD4k0yrD9uMXb9Gbl8dhbp8GVe+kTx5
 FTdh+EEuy1iFWdcXXq12DphmJMXMpQspQA==
X-Google-Smtp-Source: ABdhPJweIG1odMEjxkG19mhDsemgTmxJXjxh0vDN9QHxD5/5kjm6SG9klmp/njsu9QE2v3z4H44UXg==
X-Received: by 2002:a17:90a:a384:b0:1dc:a407:b5ac with SMTP id
 x4-20020a17090aa38400b001dca407b5acmr16585135pjp.11.1653144544094; 
 Sat, 21 May 2022 07:49:04 -0700 (PDT)
Received: from localhost.localdomain ([103.230.104.50])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a17090a290800b001dc4d22c0a7sm3709572pjd.10.2022.05.21.07.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 07:49:03 -0700 (PDT)
From: Khalid Masum <khalid.masum.92@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] fscache: fix misdocumented parameter name
Date: Sat, 21 May 2022 20:24:46 +0600
Message-Id: <20220521142446.4746-1-khalid.masum.92@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com,
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

To fix warning generated by make docs in the file fscache.h:
The functions fscache_use_cookie and fscache_unuse_cookie have a
parameter named cookie. But they are documented with the name "object".
Which generates warning when creating docs. This commit will replace
the documentation with a better one named "cookie". This new
documentation
line is taken from the function fscache_update_cookie in the same
file.

Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
---
 include/linux/fscache.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index e25539072..32cf593b8 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -256,7 +256,7 @@ struct fscache_cookie *fscache_acquire_cookie(struct fscache_volume *volume,
 
 /**
  * fscache_use_cookie - Request usage of cookie attached to an object
- * @object: Object description
+ * @cookie: The cookie representing the cache object
  * @will_modify: If cache is expected to be modified locally
  *
  * Request usage of the cookie attached to an object.  The caller should tell
@@ -272,7 +272,7 @@ static inline void fscache_use_cookie(struct fscache_cookie *cookie,
 
 /**
  * fscache_unuse_cookie - Cease usage of cookie attached to an object
- * @object: Object description
+ * @cookie: The cookie representing the cache object
  * @aux_data: Updated auxiliary data (or NULL)
  * @object_size: Revised size of the object (or NULL)
  *
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
