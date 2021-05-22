Return-Path: <SRS0=hd2V=KR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BCF6C2B9F2
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 May 2021 11:52:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23044611CB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 May 2021 11:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23044611CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9C1540422;
	Sat, 22 May 2021 11:52:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AZIf881BSxV5; Sat, 22 May 2021 11:52:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAAEE4056F;
	Sat, 22 May 2021 11:52:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95311C000E;
	Sat, 22 May 2021 11:52:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0A1AC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 11:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99D5A6065F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 11:52:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O9U6_YMjIH4m
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 11:52:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3DDCD60656
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 11:52:40 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 cu11-20020a17090afa8bb029015d5d5d2175so8706722pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 04:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=52w1nKRxofCzX5SRZgG/obCfCwe0ck/dt1IKXt95vIk=;
 b=GsZe8mzZSi1aOKcxTzn+4sh/ULmoYyjEiO4ljmi9YBfDQXX8bAWPiIEph73rmrwFvP
 /tAnFPyeC2srYXifqO33574v+5tY+HzS3PuE8w3gzRHjJbuVZWmOuMhWfOQ8ud3O/Yal
 PWISbI7/1gjluDMBmIcc6mekZE5R+EmqXUSer3xljY/FCVM2POCJqo3sxq+wmUSzvn6/
 5v5q4PxtEinL7s0+qexx7ecqqVjy7N4hQSyDYGHXqoehbgAEGKCmBgoM5UZ4tJ5vhVO5
 jEVicYI9tGJHdBP2HejSnFUJzJOs7ku1Zm36DBtyuaTiH5O7H4Mu+6bxzKB94nGBmGPn
 pX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=52w1nKRxofCzX5SRZgG/obCfCwe0ck/dt1IKXt95vIk=;
 b=V26sAxm/kEeWrS2wkqDzki1PKi6smXM8T7vbRkm5ar+3FIArLmOrSRjj8xYHBh/cNl
 xGLawZ2diIqbkjHQY813ZMXd8QWb2jO2+fO1ANdWJ1XcHpwsZIW0yvbmwE1moao7nzv+
 Sapw3HQfyAPJYOpeZAEC0OqL6KQr1XLC5LMvYWNjYzu1+e2LD2zZM87ulbS0h2y88Obv
 UPsUzrc6T+uzfhWDVFlifTRuh5NeELZw/Wa2MraPZ+F5GbbL0wdbDNglOyiWQP/DokQX
 ATKabIo9ntVvI3pPtvQ7gVx/M3cS4o+R3wpXfVa/sgjrVaiWfm44MfMbvKcCbGSoSiNl
 OscQ==
X-Gm-Message-State: AOAM530j7TfJEQj7w3j3e4mF24Sn5+GyEtd867X/Mb7EIZtn/lHqpyMn
 ecH5e7/Dq6Vyf/GnZor9fbc=
X-Google-Smtp-Source: ABdhPJxFFfyGvd2lXag1q0u/oQOUE4PevFZVDv7hrOReZ7HC14fXNlE6iwwnRYb+Gz/21eoF3LSnAw==
X-Received: by 2002:a17:90b:3905:: with SMTP id
 ob5mr15594611pjb.94.1621684359571; 
 Sat, 22 May 2021 04:52:39 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a93f:d9c2:4477:9177:8c76])
 by smtp.googlemail.com with ESMTPSA id n6sm7144007pgm.79.2021.05.22.04.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 May 2021 04:52:39 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: balbi@kernel.org
Subject: [PATCH] USB: gadget: udc: fix kernel-doc syntax in file headers
Date: Sat, 22 May 2021 17:22:27 +0530
Message-Id: <20210522115227.9977-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-usb@vger.kernel.org, linux-doc@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

The opening comment mark '/**' is used for highlighting the beginning of
kernel-doc comments.
The header for drivers/usb/gadget/udc/trace files follows this syntax, but
the content inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warning from kernel-doc.
For e.g., running scripts/kernel-doc -none drivers/usb/gadget/udc/trace.h
emits:
warning: expecting prototype for udc.c(). Prototype was for TRACE_SYSTEM() instead

Provide a simple fix by replacing this occurrence with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 drivers/usb/gadget/udc/trace.c | 2 +-
 drivers/usb/gadget/udc/trace.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/trace.c b/drivers/usb/gadget/udc/trace.c
index 7430624c0bd7..19e837de2a20 100644
--- a/drivers/usb/gadget/udc/trace.c
+++ b/drivers/usb/gadget/udc/trace.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * trace.c - USB Gadget Framework Trace Support
  *
  * Copyright (C) 2016 Intel Corporation
diff --git a/drivers/usb/gadget/udc/trace.h b/drivers/usb/gadget/udc/trace.h
index 2d1f68b5ea76..98584f6b6c66 100644
--- a/drivers/usb/gadget/udc/trace.h
+++ b/drivers/usb/gadget/udc/trace.h
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * udc.c - Core UDC Framework
  *
  * Copyright (C) 2016 Intel Corporation
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
