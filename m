Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D228C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 May 2022 18:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E7F961253;
	Tue, 24 May 2022 18:22:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YIYJlgfZQ3b8; Tue, 24 May 2022 18:22:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C61506124D;
	Tue, 24 May 2022 18:22:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9EC90C0032;
	Tue, 24 May 2022 18:22:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D838C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 May 2022 18:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BC4A840E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 May 2022 18:22:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f-qu-DZcDlxY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 May 2022 18:22:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F351C840DE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 May 2022 18:22:51 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso2966727pjg.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 May 2022 11:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NQ+IbxSoOWzvPpARlGDJuulp1WoAC1KNhcEUFQJVWLw=;
 b=YjX69PtOZfBAOveJE2bEYXqX+lWjUI0Kve/NDLqWuJsbYa9sTtwXg7YmPazee+niuT
 DW/VnXFP7ghPET8wm9rpnVi65J1KKjmpS9fWCO1txRyaVipScC494vSLj3km98F8+4RQ
 rsMiM4eaRCEWfEpoUoFPOjI+04QW1UXV1ggAhdaE0B9ONGHQbEe2/cNItxChTymcoH/M
 WnC8PRpqnMnbI+rjdvefwXoxgHJ40snKdlcF1u4Lf+WC+5UUzH9/PpupmhMvLC3dHP4g
 T7b7/g6IvIRZenL49Obh2mL5fP5fQZQZ09p0GDlvEZ6HsVUhRjV7KnPQxf6S6b1iFdIp
 u9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NQ+IbxSoOWzvPpARlGDJuulp1WoAC1KNhcEUFQJVWLw=;
 b=fJbQXxxzLpnhWx1hUGWmeBdJ95FInaL9YheC1Q268fLeihQOk7No55c1zSzSxqtGio
 YG6ch8OvpuqkFZSqN3oTTPhT38AlPqfNTk5dEXTv/YMKKXygt1UJa6wiwd19cB3bvQ9d
 ykHCAIh1cA+nKGu52vrOBAo+9xw60HqeLmkZjO8mBgJZVNibbjnrzM1vUmYzQqMfws2H
 I/1BA+I/SL7vjsc8VMPiSYOriW0sIE21hYjaDImGkGNqK70B/ZQFET/YagYW5DNJB3wO
 XTcU/doUMIqnHxhb1dM1n0eTZpHt9FtWFFGUKV8uF5vNteflJQh6K/dvXQRbbClxf1+i
 vbRg==
X-Gm-Message-State: AOAM530ZJVwA2+ciBp9Ua+NEhqg8iL/Wr62QSxoDXzFO1PmxTjfLj2DK
 5VFFMC46LaCfcScr4KKxE7c=
X-Google-Smtp-Source: ABdhPJw0pevw6L+J31pXA4AxzQC3sqeoJYUUppDxbwh0wnw4ck8awuR3dLEj2ejuHKgnYOaW5JOO5A==
X-Received: by 2002:a17:90a:b017:b0:1df:6f31:c273 with SMTP id
 x23-20020a17090ab01700b001df6f31c273mr5831197pjq.167.1653416571356; 
 Tue, 24 May 2022 11:22:51 -0700 (PDT)
Received: from ubuntu.localdomain ([103.230.148.185])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a170903110500b0015e8d4eb2b8sm7595714plh.258.2022.05.24.11.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 11:22:51 -0700 (PDT)
From: Gautam Menghani <gautammenghani201@gmail.com>
To: akpm@linux-foundation.org, shakeelb@google.com, vasily.averin@linux.dev,
 mhocko@suse.com, manfred@colorfullife.com
Subject: [PATCH] ipc: Remove dead code in perform_atomic_semop()
Date: Tue, 24 May 2022 11:22:44 -0700
Message-Id: <20220524182244.42987-1-gautammenghani201@gmail.com>
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

Remove the line which is dead code. Fixes the clang scan warning:
warning: Value stored to 'result' is never read [deadcode.DeadStores]
                result = curr->semval;

Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
---
 ipc/sem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/ipc/sem.c b/ipc/sem.c
index 0dbdb98fdf2d..156824bcda47 100644
--- a/ipc/sem.c
+++ b/ipc/sem.c
@@ -766,7 +766,6 @@ static int perform_atomic_semop(struct sem_array *sma, struct sem_queue *q)
 	for (sop = sops; sop < sops + nsops; sop++) {
 		curr = &sma->sems[sop->sem_num];
 		sem_op = sop->sem_op;
-		result = curr->semval;
 
 		if (sop->sem_flg & SEM_UNDO) {
 			int undo = un->semadj[sop->sem_num] - sem_op;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
