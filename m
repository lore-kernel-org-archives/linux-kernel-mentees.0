Return-Path: <SRS0=TF4G=HP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD2CFC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 13 Feb 2021 13:15:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 754B664E46
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 13 Feb 2021 13:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 754B664E46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 479F187610;
	Sat, 13 Feb 2021 13:15:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pQJMrUAHxtiW; Sat, 13 Feb 2021 13:15:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3F6BE873A5;
	Sat, 13 Feb 2021 13:15:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D9C9C0891;
	Sat, 13 Feb 2021 13:15:27 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 21627C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Feb 2021 13:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1E29186A15
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Feb 2021 13:15:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q34zwtimh5t4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Feb 2021 13:15:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BBAD0869E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Feb 2021 13:15:25 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d13so1290107plg.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Feb 2021 05:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T5UYTaCWBB2+LL3/tlIpAWg8VNUjtbCiU5GIunU3FQA=;
 b=FtSmFBNTznJDV3XVu/wjw/sH0sKR2tspk+989U4ZlsOIeNesWTaEoNFF6mHlEAcelZ
 QiXeJGQH2r3jmIU7yQ6aMGMgJ1EeDB5Ym7W8nNydVcVBFr84v6JjRnQVSNCtY7KFGXes
 zW2E2Vbeh7EU4o2sanPYBDOO2tn1utM4H7JK0Y43mbR70XkSUxlJVjOYu2YYGNIspHYN
 EuRxZrVu+PbQcHiJRv1XQtGpI1Dawlp/jOUyfcRi0AbI9cWrVXTyI/vNlQyzga7k8/AN
 sfycPprZkdv6MRQbjJSP6H32pnyksM+Rw28mauCzEynZw+r86A5+JlCQWcillFJHMISR
 Y2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T5UYTaCWBB2+LL3/tlIpAWg8VNUjtbCiU5GIunU3FQA=;
 b=UpiK5HulR01YqOG7DujDTunvY+jRz0P66N1lvCDlu5bHHvcuNwk5/qqJP+Pqmuh4Zy
 NGu8FH7QwHsoMU0KFEsGa8l9Aj1jdcviNepwHxs161ShAZferkC5+laVn54V21maC5bs
 Ukm+viQaLhzRKymq7GQw/8vcAFSspWiJpbUZtMOiKHtNjmTWVsxOpwyzbgllARY7VB8E
 9i1QyKd5ezOR/EHEbXTJ+30/8uYWslkfwx89iTv7rzzrdGSnEP1+BpnsYI+NiKNKo27A
 +tLUcQV27ZfEYA9Wty2+zA0GN+ZrlcC/v021P9wpftm6k3NgruAMDAZ9d4LP3b6vVK4q
 ga1A==
X-Gm-Message-State: AOAM533eVr0WCKq24IpEtjoikJBEkyrvG0L+yKsbRWsawui19ioww0Ak
 MK2FwcLOEG0YdW/GzS0s8BM=
X-Google-Smtp-Source: ABdhPJyush0sYA4KhVnvad+h1wrLqewQA8oXOXhF4Ob0C8WI0A8SF0z1ZRlOstVN7J9dBJYRyErdJQ==
X-Received: by 2002:a17:90b:17c8:: with SMTP id
 me8mr7450398pjb.197.1613222125217; 
 Sat, 13 Feb 2021 05:15:25 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6ab4:5c97:80e6:be35:2e49])
 by smtp.gmail.com with ESMTPSA id p11sm833533pjb.3.2021.02.13.05.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 05:15:24 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Sat, 13 Feb 2021 18:45:13 +0530
Message-Id: <20210213131513.51386-4-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210213131513.51386-1-dwaipayanray1@gmail.com>
References: <20210213131513.51386-1-dwaipayanray1@gmail.com>
MIME-Version: 1.0
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH RFC v3 3/3] docs: add documentation
	for checkpatch
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

Link the checkpatch documentation to the dev-tools index
for sphinx.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 Documentation/dev-tools/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
index 1b1cf4f5c9d9..43d28998118b 100644
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@ -14,6 +14,7 @@ whole; patches welcome!
 .. toctree::
    :maxdepth: 2
 
+   checkpatch
    coccinelle
    sparse
    kcov
-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
