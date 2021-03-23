Return-Path: <SRS0=2Cfq=IV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0837FC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 23 Mar 2021 11:35:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ECEE619BB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 23 Mar 2021 11:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ECEE619BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B556404A8;
	Tue, 23 Mar 2021 11:35:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q0fEBS0xXmXt; Tue, 23 Mar 2021 11:35:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A17C40498;
	Tue, 23 Mar 2021 11:35:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20987C000A;
	Tue, 23 Mar 2021 11:35:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92030C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Mar 2021 11:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 804F540374
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Mar 2021 11:35:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Rr9mX3WEqQN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Mar 2021 11:35:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71C6E4036B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Mar 2021 11:35:49 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 nh23-20020a17090b3657b02900c0d5e235a8so10016715pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Mar 2021 04:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EEklaGbWfb1yo1FO7Z4wlaHPpfFsNPyJGcvRz1oeefM=;
 b=b5naPsgQpGmYSNTZQEtpOVUOEncxeX6nHd+zt5WJrai18i4iXngstNQKAZcgcgXW36
 oAUvlnuRnUWzIMG4JOvHaMPlshJwY7/rLJY4NKPei41RC8wofdNKmbPe7XAY9ocA9hUj
 Z5NylNkIvmpfwT/RE7dQBaqSDE0r5R3kGBXiBXwy4lGQok8qO0hRnAMfQUQd0c2nvX3R
 qKjqlQKHPfa3iWzGsPgZtMmxekYWahvC8VirPvT0mhucwlDqIZQGFFfXF1ubFIn9H/Tu
 KIwfOzdE4tq4CRX+S5iva+wc7PZYVNNm8ZqXFQ3B4s/zzn5E5R5lDMqYmG347gygEOix
 3BlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EEklaGbWfb1yo1FO7Z4wlaHPpfFsNPyJGcvRz1oeefM=;
 b=S9oBZrfz+v4BuWLt+6e+dhf3ikMDhDcQyXltl1SaJ76i9IHTwSaoFdegW4PugvlvVz
 KbNfuYVtvOI0lhzgDtxg7QWxWZcnPFP7aw+7xPQu3EvSm1NZEv0K1vU9lvRIWTfrTC4V
 kMZbvkBW6Imdf35C43ePG5XD/yrJ7gUx6tkTXyEDkV5y6c2hCqhPt/mZ4IMuY8Rn9MZ1
 o6M+j+JNiFbE6s0uZJDvJuGi4GuAOzWKEw9E9NAAel+ZqLakjHtU6jurtpbOP64BIGZF
 cPbkfSCWaUvVj1loOzS6hiQwYEMpeNJ+lbpuUAJNQ8UK0PO/nJq0m9L/Viz+8dJq88zv
 o4Bw==
X-Gm-Message-State: AOAM532/zLVlJtHigH5G6kM1nRH3NxemGTCbbUJUy0G7HlM0i9O1Pn1m
 HBQps877JzxIwmHPE8UZdNk=
X-Google-Smtp-Source: ABdhPJyfnT0JqtXQArzGmf6c+wju8uckrWOxq3OUqeecMhVAl0hDKux9CILkfrbFR7IfsAr+cqNMxQ==
X-Received: by 2002:a17:90a:9103:: with SMTP id
 k3mr4267739pjo.157.1616499348929; 
 Tue, 23 Mar 2021 04:35:48 -0700 (PDT)
Received: from localhost.localdomain ([122.174.244.83])
 by smtp.gmail.com with ESMTPSA id l22sm2750385pjl.14.2021.03.23.04.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 04:35:48 -0700 (PDT)
From: Atul Gopinathan <atulgopinathan@gmail.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2 2/2] staging: rtl8192e: Change state information from u16
 to u8
Date: Tue, 23 Mar 2021 17:04:14 +0530
Message-Id: <20210323113413.29179-2-atulgopinathan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210323113413.29179-1-atulgopinathan@gmail.com>
References: <20210323113413.29179-1-atulgopinathan@gmail.com>
MIME-Version: 1.0
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Atul Gopinathan <atulgopinathan@gmail.com>,
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

The "u16 CcxRmState[2];" array field in struct "rtllib_network" has 4
bytes in total while the operations performed on this array through-out
the code base are only 2 bytes.

The "CcxRmState" field is fed only 2 bytes of data using memcpy():

(In rtllib_rx.c:1972)
	memcpy(network->CcxRmState, &info_element->data[4], 2)

With "info_element->data[]" being a u8 array, if 2 bytes are written
into "CcxRmState" (whose one element is u16 size), then the 2 u8
elements from "data[]" gets squashed and written into the first element
("CcxRmState[0]") while the second element ("CcxRmState[1]") is never
fed with any data.

Same in file rtllib_rx.c:2522:
	 memcpy(dst->CcxRmState, src->CcxRmState, 2);

The above line duplicates "src" data to "dst" but only writes 2 bytes
(and not 4, which is the actual size). Again, only 1st element gets the
value while the 2nd element remains uninitialized.

This later makes operations done with CcxRmState unpredictable in the
following lines as the 1st element is having a squashed number while the
2nd element is having an uninitialized random number.

rtllib_rx.c:1973:    if (network->CcxRmState[0] != 0)
rtllib_rx.c:1977:    network->MBssidMask = network->CcxRmState[1] & 0x07;

network->MBssidMask is also of type u8 and not u16.

Fix this by changing the type of "CcxRmState" from u16 to u8 so that the
data written into this array and read from it make sense and are not
random values.

NOTE: The wrong initialization of "CcxRmState" can be seen in the
following commit:

commit ecdfa44610fa ("Staging: add Realtek 8192 PCI wireless driver")

The above commit created a file `rtl8192e/ieee80211.h` which used to
have the faulty line. The file has been deleted (or possibly renamed)
with the contents copied in to a new file `rtl8192e/rtllib.h` along with
additional code in the commit 94a799425eee (tagged in Fixes).

Fixes: 94a799425eee ("[PATCH 1/8] rtl8192e: Import new version of driver from realtek")
Cc: stable@vger.kernel.org
Signed-off-by: Atul Gopinathan <atulgopinathan@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index b84f00b8d18b..4cabaf21c1ca 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1101,15 +1101,15 @@ struct rtllib_network {
 	u8 hidden_ssid[IW_ESSID_MAX_SIZE + 1];
 	u8 hidden_ssid_len;
 	struct rtllib_qos_data qos_data;
 
 	bool	bWithAironetIE;
 	bool	bCkipSupported;
 	bool	bCcxRmEnable;
-	u16	CcxRmState[2];
+	u8	CcxRmState[2];
 	bool	bMBssidValid;
 	u8	MBssidMask;
 	u8	MBssid[ETH_ALEN];
 	bool	bWithCcxVerNum;
 	u8	BssCcxVerNumber;
 	/* These are network statistics */
 	struct rtllib_rx_stats stats;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
