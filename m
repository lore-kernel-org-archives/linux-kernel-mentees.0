Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D50C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 May 2022 20:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86EBB610F4;
	Mon, 23 May 2022 20:54:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DNyom2VNpgS2; Mon, 23 May 2022 20:54:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 878C760634;
	Mon, 23 May 2022 20:54:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54DCDC0039;
	Mon, 23 May 2022 20:54:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E788BC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 May 2022 20:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C89F482E1A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 May 2022 20:54:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UR3Wgyi7D_qy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 May 2022 20:54:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F68082E14
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 May 2022 20:54:06 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id 31so14656107pgp.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 May 2022 13:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PDfySpHTAY1V27s98c7xs1NvYXjrxFhQpygEToybb3Q=;
 b=dvZJy5o0Tw1ynrGSS7inBw5iv9tFjVGq53/IAKa6bvpKFKR7TW4l5v1Y5P2EGNWOhO
 YgOOBdhpKF+dzSkp6r8G70zmQy0aFsXHJSRIR0fLOkE2CSkRcLrzSZSf1rHWRwK2UXuC
 Pobs6dPmbbfPBMoGPZvHeTnsg0iiiiav1NhcOcpcaSvjy+B/XP5hVB1KM5+AssJqxtmd
 DvFmdEd9BKq5Sv13jQx+K9BXHw8990Cpgi0yXxOiNsL7gGikZG5Z5sKV53Go/llXJglD
 8F2wQfx6yTyuV3QP8Za5MCRBAPTdIQxXeVE3pPMnxAS+NS1lfPrNs45R9syLahVSha+i
 KDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PDfySpHTAY1V27s98c7xs1NvYXjrxFhQpygEToybb3Q=;
 b=4EwDS4VYaFk+K08OnMuNiy21VNHs28nXwAHsmN4N/JdRQ7EdLgJ7U6h1Qjze392vx8
 ilWG2SPHKgELUxtMWwLP21c6wgbI35SC6dh/rys/OMQtRIspq6M0zgZ4CK0yJ1zyV1r2
 dXAJLuq3CCerNQXQwMukg/IjZigJyfhLlpiHHZ+Wp/ChwL82iWy9nZUhtwOW5BOELtQW
 JTLAr9lNo7BGqWQqyzJazTgTW/VSsQGvAO3JxwELJjz8JCRYgZdxukj4isPaJfCaxgHp
 ogIfBkOovNdxorUxFTFd9ehM1G7ImoxlHOQ8D0uv2pqrNNPmlH/U4tIJ98hGcLUVSdic
 PWYw==
X-Gm-Message-State: AOAM533GshFgI/Tj2KtyOn27F5fauIBCwHtOv0IuIGEHsF3m4foXLfeP
 ZShYTyEI+o2JeLquatF69aGxErvJv28=
X-Google-Smtp-Source: ABdhPJxsZBfvuufUzKimg2Bn+Lpq5aGaq08FHon1wbRhJUS2t8M8+S+RsgJjqNq6K9SsQNXD9cpoww==
X-Received: by 2002:a05:6a00:140b:b0:4e1:2cbd:30ba with SMTP id
 l11-20020a056a00140b00b004e12cbd30bamr25227553pfu.46.1653339245651; 
 Mon, 23 May 2022 13:54:05 -0700 (PDT)
Received: from localhost.localdomain ([103.3.225.10])
 by smtp.gmail.com with ESMTPSA id
 e21-20020aa79815000000b005104c6d7941sm7623785pfl.31.2022.05.23.13.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:54:05 -0700 (PDT)
From: Khalid Masum <khalid.masum.92@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>, SeongJae Park <sj@kernel.org>
Subject: [PATCH] mm/daemon: describe NR_DAMON_OPS in damon_ops_id
Date: Tue, 24 May 2022 02:53:36 +0600
Message-Id: <20220523205336.2435-1-khalid.masum.92@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
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

NR_DAMON_OPS in the enum damon_ops_id is not described. Describe it for
better readability and also to fix a warning generated by make docs.

"NR" is described as "Total Number" and "DAMON_OPS" is described as
"Monitoring operations" in the same file. Hence describe NR_DAMON_OPS
as "Total number of damon operations".

Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
---
 include/linux/damon.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index f23cbfa42..9e9fb4d78 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -262,6 +262,7 @@ struct damos {
  *
  * @DAMON_OPS_VADDR:	Monitoring operations for virtual address spaces
  * @DAMON_OPS_PADDR:	Monitoring operations for the physical address space
+ * @NR_DAMON_OPS:	Total number of monitoring operations
  */
 enum damon_ops_id {
 	DAMON_OPS_VADDR,
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
