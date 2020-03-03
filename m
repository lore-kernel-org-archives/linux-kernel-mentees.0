Return-Path: <SRS0=4Pq9=4U=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F172C3F2CD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Mar 2020 05:03:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E7E92173E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Mar 2020 05:03:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sL01+kyS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E7E92173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3A36C860E1;
	Tue,  3 Mar 2020 05:03:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rxkZd3D8zvBH; Tue,  3 Mar 2020 05:03:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CD64383FA2;
	Tue,  3 Mar 2020 05:03:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA9F2C07FE;
	Tue,  3 Mar 2020 05:03:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A47BFC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Mar 2020 05:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 91818204DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Mar 2020 05:03:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zteyhpBDYKsh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Mar 2020 05:03:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by silver.osuosl.org (Postfix) with ESMTPS id 0DA24203AD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Mar 2020 05:03:26 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id y1so755458plp.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Mar 2020 21:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KZLeL10yiQKICWQXqyAvMrywCfnXJptYMW6Zsbkw6Hc=;
 b=sL01+kySLKhWi3WTTqfnDZMkga2lYHMC8TJBX553wS9djxqe9SZh4xH1imjzVh9RS0
 iCx4fhWW+Yy3rgXr+FLGRTDUc1seqJ842iScTRyy3h6AqWgxCdcOR9LLSNUqcNlzeDHc
 R3M+nYFo4QstxDc5I7dBwW1kz9JcEhiBdPkS+/07KUOFBAr7H7TdoAaYKa6vZMjrN0Ai
 0MHunzlodKpY5ldfjaS63SGhpwJJ4mJdikPzMfSx3CEj0mQu5xJMrXO9cvITjuiqpUOe
 SlFL/KjFHk1YHzRKpPWBTp9mPJHsnr1dGNpc0EfBP46EUg3Ihb5XHqGRYIJ5Aa/WsJss
 e4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KZLeL10yiQKICWQXqyAvMrywCfnXJptYMW6Zsbkw6Hc=;
 b=magK7a+JD7YQSd3u5uvaPuO1rG+OLS74IXby9C/bL8sjH6B5lv7XU5uILK75lQqaOP
 qt0ZWabLs8wTmle2ana7UhqHM5HrHcOyo3wF3flDrWQXNFLVb2316M8C0loBbURDb8Ye
 LrjE1ApZ6OlAWs5t8Mqwe/sk2m7nELf+6m0DVzQGL4m0vRU/eXTcTf0pU7W5nsAycB5O
 hKrBNyyU/OyEKdtvUTF8bulRG4BkRyVxcwk/Hs0H7wbKbJDRdhla9se9tk+xCoY0hkCX
 yYVgDNZVxPf6I0CWqEkE6YoBo5fJ1JjMhQxhOnuqgcnHeFTU6sOVtg/uDFN+c8RQMC8A
 YuhA==
X-Gm-Message-State: ANhLgQ1EpToNRlMe9yVGvpEmfDqLcgqqVBqZpsFqgYECooJBN/5wYlus
 6wsb3JbMrxVnifpcZHMbCrQ=
X-Google-Smtp-Source: ADFU+vsKO4Rt6MZ8vsfQIweKuQFxfgCjHHs1pU7cbaRVbYq1XpuUPZ3rSM/ytzjSn1pxfhnctgGCtg==
X-Received: by 2002:a17:902:694b:: with SMTP id
 k11mr2531084plt.334.1583211805614; 
 Mon, 02 Mar 2020 21:03:25 -0800 (PST)
Received: from localhost.localdomain ([2405:205:c8aa:e481:f8d3:6de2:77f9:5602])
 by smtp.gmail.com with ESMTPSA id b2sm780446pjc.40.2020.03.02.21.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 21:03:25 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: corbet@lwn.net
Date: Tue,  3 Mar 2020 10:33:00 +0530
Message-Id: <20200303050301.5412-2-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303050301.5412-1-pragat.pandya@gmail.com>
References: <20200302114300.34875f69@lwn.net>
 <20200303050301.5412-1-pragat.pandya@gmail.com>
Cc: Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v3 1/2] Documentation: Add
	io-mapping.rst to driver-api manual
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Add io-mapping.rst under Documentation/driver-api and reference it from
Sphinx TOC Tree present in Documentation/driver-api/index.rst

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 Documentation/driver-api/index.rst                          | 1 +
 Documentation/{io-mapping.txt => driver-api/io-mapping.rst} | 0
 2 files changed, 1 insertion(+)
 rename Documentation/{io-mapping.txt => driver-api/io-mapping.rst} (100%)

diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index 0ebe205efd0c..e9da95004632 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -79,6 +79,7 @@ available subsections can be seen below.
    ipmb
    isa
    isapnp
+   io-mapping
    generic-counter
    lightnvm-pblk
    memory-devices/index
diff --git a/Documentation/io-mapping.txt b/Documentation/driver-api/io-mapping.rst
similarity index 100%
rename from Documentation/io-mapping.txt
rename to Documentation/driver-api/io-mapping.rst
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
