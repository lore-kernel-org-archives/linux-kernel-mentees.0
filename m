Return-Path: <SRS0=6zuU=KL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D0A8C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 May 2021 12:31:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 411D761155
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 May 2021 12:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 411D761155
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C3F04040E;
	Sun, 16 May 2021 12:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TiS4CDyHZZNG; Sun, 16 May 2021 12:31:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60C7140423;
	Sun, 16 May 2021 12:31:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4A99AC000E;
	Sun, 16 May 2021 12:31:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C339C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 12:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DE34605F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 12:31:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w3oCtQIP9uY8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 12:31:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED1F760703
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 12:31:17 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id y32so2787137pga.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 05:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x0xy6PuUkITlQEfoESlbsWn5gMjHl7FnBihh8mzNu6Y=;
 b=s0wviXk7J29exHWufG/uNNIOdvGY09XnUQ5x82bdMbQp4sekj42F1o5BcwswmDkE/O
 Lfz3MRYdNpAzFBryF0SntQWSEoGmnJ7YD9MDlmjL3J8uTe1Q1iG4qR6wBjRw9JAr4tnZ
 8w6wbNPXMT0HnLQLTJ3jyMbV2J4IlISs9ADKHKY3LBenoy/J3d6jwzJ0aBBX661uD/98
 n1XpSAPvbHt/nQRWJJ55J9k3VLqszrYg+0+PP+XkdNchJh78NjZZeLbCczHHQeHAX/WZ
 luSrsSWQFP/c4Jct0/MVoHZfsKBdwofBw6UB7DfpkHByVHzBRdZHlZKD2N4m8riTgrcA
 qlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x0xy6PuUkITlQEfoESlbsWn5gMjHl7FnBihh8mzNu6Y=;
 b=psEp8cpt27Jd9Hrz2TsTKWBU0fwTRl4c3cr2/EuGaglpQKs1Oa4ZBuSKDkGJ0/9cUC
 JKl7RZ2Ozo5iX+rB6MvRZsA0bPQj/U/4JORcNDaQRF6FtXEHmjtY7lSGFAuQIJLBl2JC
 CPw0aCO6Cr8aeGM1lCzB5DIDWA1xtZV0ca4AO1wMSo0y/UDbEU6G6BXza+doB++CtXqn
 lb5cvfej0U8zRi1gGEJ7TZW+AQZFJ+Gt4mYKbvJZXcrAoDKo8AJaxVi7mcBzX2oTKYV9
 +9MWAdKW7GowkHVW8CwR7OSLrwPf+P8IOu/pcOPdcvnwdDMGjuGSBeuoYNoXMahKe6UI
 rNsQ==
X-Gm-Message-State: AOAM531G7vA25TJY4l1xzN+2hm79tA5UPjv69nlFnxy4QHpVkcmcttw2
 Jdj0KeG3hsx5wNsI+k8lbOc=
X-Google-Smtp-Source: ABdhPJxPq4HzW12Ya8whpnivanq2aAPrdMRCl7um6mnlk7hqM0KMJHtih/MYIonSSJ+A8X1G25nt+w==
X-Received: by 2002:a63:7e46:: with SMTP id o6mr37834009pgn.38.1621168277199; 
 Sun, 16 May 2021 05:31:17 -0700 (PDT)
Received: from localhost.localdomain ([111.223.96.126])
 by smtp.gmail.com with ESMTPSA id k186sm8004318pgk.82.2021.05.16.05.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:31:16 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: gregkh@linuxfoundation.org, marcocesati@gmail.com,
 dan.carpenter@oracle.com, fabioaiuto83@gmail.com, fmdefrancesco@gmail.com,
 eantoranz@gmail.com, hdegoede@redhat.com, Larry.Finger@lwfinger.net
Subject: [PATCH 7/7] Staging: rtl8723bs: fix block comment in HalBtc8723b1Ant.c
Date: Sun, 16 May 2021 08:29:27 -0400
Message-Id: <20210516122927.1132356-8-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516122927.1132356-1-desmondcheongzx@gmail.com>
References: <20210516122927.1132356-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel-mentees@lists.linuxfoundation.org,
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

This commit fixes the following checkpatch.pl warning:

WARNING: Block comments use * on subsequent lines
+		/*
+		CL_SPRINTF(cliBuf, BT_TMP_BUF_SIZE, "\r\n %-35s = 0x%x ", "Latest error condition(should be 0)", \

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index cc7f558903ac..87156b2cd1f0 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -2511,10 +2511,10 @@ void EXhalbtc8723b1ant_DisplayCoexInfo(struct btc_coexist *pBtCoexist)
 		CL_PRINTF(cliBuf);
 
 		/*
-		CL_SPRINTF(cliBuf, BT_TMP_BUF_SIZE, "\r\n %-35s = 0x%x ", "Latest error condition(should be 0)", \
-			pCoexDm->errorCondition);
-		CL_PRINTF(cliBuf);
-		*/
+		 *CL_SPRINTF(cliBuf, BT_TMP_BUF_SIZE, "\r\n %-35s = 0x%x ", "Latest error condition(should be 0)",
+		 *	pCoexDm->errorCondition);
+		 *CL_PRINTF(cliBuf);
+		 */
 	}
 
 	/*  Hw setting */
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
