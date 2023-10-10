Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1A3CD98CA
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Oct 2023 22:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7528860E96;
	Tue, 10 Oct 2023 22:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7528860E96
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UV0/Yj5+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dfvdws70oh9z; Tue, 10 Oct 2023 22:46:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7972660AEF;
	Tue, 10 Oct 2023 22:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7972660AEF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53CD6C0039;
	Tue, 10 Oct 2023 22:46:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1917BC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 22:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB341820BB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 22:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB341820BB
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UV0/Yj5+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id umXkanmhz9zS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 22:46:46 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3AE8E820DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 22:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AE8E820DC
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-690d935dbc2so1222031b3a.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 15:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696978005; x=1697582805;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Yfc2ApoKjWF5pFCF6Ncuv8BWtgDho+97WSMGGN/f+Hw=;
 b=UV0/Yj5+6SB6gvpsua0bQ4TH013FcX7RGA3hn7CpI7NuaAGQ/a/95ipA9zGp5gETHV
 KgXKuhip411Wcb4ha0klkcFzSJ9kOcdeHdOc1OgiD+cQY41tBZnS+sK02JVYY9SCq75N
 rpm3Yb/01OauhEhe9kPSChhvnCA624umn+4luBHT+2UOF95V6iSrqu3jXMQzEW+wt/Pj
 IqR0Jugm5bDCInt2LhgbDvTVxQRg9/qbY86ARfee88WRkgM8gCkviN53uUNtlOPeISJF
 ytUY2oyxoZkfSxBM4npUjgXXW1lMhzEzEuZ6E8Oh8FsFFAMenOalygKLmcE5wcWPXUc3
 KRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696978005; x=1697582805;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yfc2ApoKjWF5pFCF6Ncuv8BWtgDho+97WSMGGN/f+Hw=;
 b=mSuaxOWtj+22hPL1peKsY+lHFJ30KMF97fX0XKmyWybrDLjYmNeCT/VBYK1OTx1/W3
 pJdPLGiQCanuHS2U4Cxxzh9U5tNmxsDc7L0l19MqhXUQ2BQDAItepIlZljrzesnP7Nln
 1ecg6JAnmjI7Pa4s+pKJaqcV0tZUXnmDWb9+P3chELIr69ZLHqPkQCLRYRW3kTGN82pA
 czRd52ghC8QEi/EHB2EkI370SsJsZRZgI05KGt5vIUDJ0Ss/wxOlrCYeIukm71w4kVHE
 GyAcepbbL5VytqRG6I/ha+XYRW0y0B6apqCX2wFKav+NZaIDOYNk5s95lG6m17Gc9EUU
 ZpNA==
X-Gm-Message-State: AOJu0YzZLaZJGM/rzk2tJCB54apAUg8kjGCWPgOEosjqtURgmai84xsU
 BW8N1tn0iLfjqUgOn//R7g8=
X-Google-Smtp-Source: AGHT+IFt9Myk9KUHdeA/2gFtXuUyoJ9lWC8rmYSHPW2LIP7dUo+hLgSjBkzvVkLLobEJ++Viinf8Ew==
X-Received: by 2002:a05:6a20:daa8:b0:171:947f:465b with SMTP id
 iy40-20020a056a20daa800b00171947f465bmr4587914pzb.4.1696978005607; 
 Tue, 10 Oct 2023 15:46:45 -0700 (PDT)
Received: from abhinav.. ([103.75.161.210]) by smtp.gmail.com with ESMTPSA id
 j13-20020a62b60d000000b0068fbaea118esm8692062pff.45.2023.10.10.15.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 15:46:45 -0700 (PDT)
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
To: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com
Subject: [PATCH] Remove extra unlock for the mutex
Date: Wed, 11 Oct 2023 04:16:30 +0530
Message-Id: <20231010224630.238254-1-singhabhinav9051571833@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Abhinav Singh <singhabhinav9051571833@gmail.com>
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

There is a double unlock on mutex. This can cause undefined behaviour.

Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
---
 net/ipv4/inet_connection_sock.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
index aeebe8816689..f11fe8c727a4 100644
--- a/net/ipv4/inet_connection_sock.c
+++ b/net/ipv4/inet_connection_sock.c
@@ -597,7 +597,6 @@ int inet_csk_get_port(struct sock *sk, unsigned short snum)
 	}
 	if (head2_lock_acquired)
 		spin_unlock(&head2->lock);
-	spin_unlock_bh(&head->lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(inet_csk_get_port);
-- 
2.39.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
