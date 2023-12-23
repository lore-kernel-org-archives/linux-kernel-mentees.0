Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8E76FB8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 07:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3O84oIu"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D484B60AFB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 07:12:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D484B60AFB
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P3O84oIu
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MUiFzKmMNe8z
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 23 Dec 2023 07:12:07 +0000 (UTC)
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A0B5360ADD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 07:12:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0B5360ADD
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-35d77fb7d94so10746145ab.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 Dec 2023 23:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703315526; x=1703920326; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gdq20GqT0V3FaSsYb4r80A7ENvWSSP5EMXwhIHB4x9c=;
        b=P3O84oIusNNU3iLF1Poz/k3bnNNBD5Y9ReQF2UXyF2kfxa9QeUMSGzegFIfXUQ0xaQ
         4lulG/7rWyOkcZAZeEVZQTiLfzn1hSRwn+oOx5qjppSRaZIUCCZk+2DED9Qts3ZWmq2y
         lQPkhcxPVgFhh+gcxh/4wwsqRqc3efMMQk7WUYFYoEeDEnKW/osnZB8AZqsBqZTCRMYA
         WcuqIpPj1zQRJKYM9gu5jCdprDlm1I7g6BUN1/hSkqvpQgaaR9DpMRQpCeiZAWmU1NYf
         kZPAl7qIwbyRe7LQzSo3wMI4qth4/9EZ4GaPB9DyWgfaUGEk2rezB68PkArw98rtvsJm
         sZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703315526; x=1703920326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gdq20GqT0V3FaSsYb4r80A7ENvWSSP5EMXwhIHB4x9c=;
        b=SHgS/vXhg+UMSOUE4vVN6qNHkm2/5jLkq41hppk2wscutr6Dl2Qobu9N5aOLLEJZxs
         wuzR0kl5mnq0Q5q/jL1UrcK+I8+EsIAYPE1EtoB3XDT4Dqo47C/1tJ96bb+ea1Iou2zF
         8q/Rt96SuKP2EJhTTqdPOXf2RaV9Y3UxCwZhCFW5qRItvY6gLkUjE9w4NJygh3ueBSUq
         NAybVH3a0E1Eibmb4HgqbxbLmpxM88jF/FToplNYcjwmgb+Rij1BuHenaSiRCK1Yg/Xy
         XmSc/cNbiHFlfXkrZTVaCdFAmOje8I3GkY+cWoFV8fWJIQA+nZRmRXNwOITehOn9kjdU
         7MYg==
X-Gm-Message-State: AOJu0YwmjZThFTcTMBeknNdJKtFzIGI0h7eT1kBmdWELVe3VcG+a0Qq5
	zEYHFQp6caafhXHXwyu8F7k=
X-Google-Smtp-Source: AGHT+IHgYkJh+MntoZJwAFW4c/GlkRitASejMY+WgAxbCAxYviF91k2BISccQHbOGesv8LalkuMPKA==
X-Received: by 2002:a05:6e02:338f:b0:35f:960e:c030 with SMTP id bn15-20020a056e02338f00b0035f960ec030mr3894872ilb.48.1703315526642;
        Fri, 22 Dec 2023 23:12:06 -0800 (PST)
Received: from localhost.localdomain ([2400:1a00:b060:2b26:f462:e3d9:c28:4c99])
        by smtp.gmail.com with ESMTPSA id w19-20020a170902d3d300b001d3eb987bb6sm4492132plb.149.2023.12.22.23.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 23:12:06 -0800 (PST)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	hpa@redhat.com
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] staging: media/atomisp/pci/runtime/queue/src: Fix spelling mistakes in queue.c
Date: Sat, 23 Dec 2023 12:56:57 +0545
Message-Id: <20231223071157.81082-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported following spelling mistake
in queue.c as below:

'''
./runtime/queue/src/queue.c:126: uncessary ==> unnecessary
./runtime/queue/src/queue.c:183: uncessary ==> unnecessary
'''
This patch fixes these spelling mistakes.

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
index 2f1c2df59f71..2c6c8fffc4e2 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
@@ -123,7 +123,7 @@ int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
 
 		/* c. Store the queue object */
 		/* Set only fields requiring update with
-		 * valid value. Avoids uncessary calls
+		 * valid value. Avoids unnecessary calls
 		 * to load/store functions
 		 */
 		ignore_desc_flags = QUEUE_IGNORE_SIZE_START_STEP_FLAGS;
@@ -180,7 +180,7 @@ int ia_css_queue_dequeue(ia_css_queue_t *qhandle, uint32_t *item)
 
 		/* c. Store the queue object */
 		/* Set only fields requiring update with
-		 * valid value. Avoids uncessary calls
+		 * valid value. Avoids unnecessary calls
 		 * to load/store functions
 		 */
 		ignore_desc_flags = QUEUE_IGNORE_SIZE_END_STEP_FLAGS;
-- 
2.39.2 (Apple Git-143)

