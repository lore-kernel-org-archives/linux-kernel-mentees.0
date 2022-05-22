Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F23C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 22 May 2022 06:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A751440545;
	Sun, 22 May 2022 06:18:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EewUQ_F1Fyrh; Sun, 22 May 2022 06:18:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BE8BB40364;
	Sun, 22 May 2022 06:18:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93A89C0032;
	Sun, 22 May 2022 06:18:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4364C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 May 2022 06:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B26106080B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 May 2022 06:18:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LPh0IPFg5w9O
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 May 2022 06:18:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93FB4606A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 May 2022 06:18:33 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id y199so11029499pfb.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 23:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2QVXkV0/Gu3+EZ1h7waZSTlenUDji+OovnP2hZNQeP8=;
 b=Tg6R7aem1l9dBFhfM+H83zHnr575D+IFv6s5mqEAfHkTSikCrOmWwoGsm7CUINrwVS
 bi3r/rWat9+gh3CTLF5mYjy+yDUKC4bJefJJO1+njuW9Pwr6hssczHliq1v4KD5TjOPs
 W8+ud0CnsUcjyC32jjSGnyiZpH5yAuaEj3qzIoM9L7V3JHDDWsH/zXIiVUj2O77087zx
 b/dPYfkaaIZ98Qxe9JJONcH8ZRC2/z6O7n8DVMBHhCLc3nKpGKqYV54a4ma4JaK+3Bt4
 fScUtqJ1uHCZu08KpK9xMW3K2flB0vUvHLfeebIUv+XI5OAA3QjW21jJw4d7TerqS5HX
 QADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2QVXkV0/Gu3+EZ1h7waZSTlenUDji+OovnP2hZNQeP8=;
 b=c7SN7O14qhzuEv+0LgpO3ZDpkPfEsPx99yZrvxPYHoxI3EsbfoScou8ZjlbjzV2YXY
 JXDIX1xk6FnrOAvX0MyI/xQ1KP6Au/oS7Wfop0JyYy449IPbbrbFjPvNRiGxB0itVg62
 CpHHHsCgiGJveBDOSBt9t5/D0pTCb91JPIzAP/32TeCsdeuLxOZrSk02Y9nsGwpTpyZr
 xwOOf2vN++0MU01rwsHZji6bEvzuI929xcwo2r5qXraqZFcEtZ+JCy0SqlZXpI2QO9gc
 x0LO/PAGazkM61tx7/mNcyq37aSI42EqKqyhE9/HGwWqiEDAT5TPzgGFV8XF01dzi+bR
 GUFg==
X-Gm-Message-State: AOAM531mwgvxHBHtf5guOPuyrB354Ht9aA8REcBd/eSuekK41wcYMsXi
 Lk3Zp53BwD5vJ7TUcpYX+7A=
X-Google-Smtp-Source: ABdhPJxl6wxOtTW6L9H85PHaGLlXkdI7IgyrnfDK/V4b8ff+doCUBQfWUJ7tkZkOixLifQUJ7okpCQ==
X-Received: by 2002:a05:6a00:88f:b0:510:7a49:b72f with SMTP id
 q15-20020a056a00088f00b005107a49b72fmr17956402pfj.21.1653200312891; 
 Sat, 21 May 2022 23:18:32 -0700 (PDT)
Received: from ubuntu.localdomain ([103.230.148.185])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a170902eccf00b0016170bb6528sm2543923plh.113.2022.05.21.23.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 23:18:32 -0700 (PDT)
From: Gautam Menghani <gautammenghani201@gmail.com>
To: rostedt@goodmis.org,
	mingo@redhat.com
Subject: [PATCH] kernel/trace: Initialize integer variable to prevent garbage
 return value
Date: Sat, 21 May 2022 23:18:26 -0700
Message-Id: <20220522061826.1751-1-gautammenghani201@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Gautam Menghani <gautammenghani201@gmail.com>
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

Initialize the integer variable to 0 to fix the clang scan warning:
Undefined or garbage value returned to caller 
[core.uninitialized.UndefReturn]
        return ret;

Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
---
 kernel/trace/trace_boot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_boot.c b/kernel/trace/trace_boot.c
index 0580287d7a0d..778200dd8ede 100644
--- a/kernel/trace/trace_boot.c
+++ b/kernel/trace/trace_boot.c
@@ -300,7 +300,7 @@ trace_boot_hist_add_handlers(struct xbc_node *hnode, char **bufp,
 {
 	struct xbc_node *node;
 	const char *p, *handler;
-	int ret;
+	int ret = 0;
 
 	handler = xbc_node_get_data(hnode);
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
