Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91FDC0015E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Aug 2023 05:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EA63417B6;
	Wed,  9 Aug 2023 05:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EA63417B6
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=MM7eLh7H
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KPNI8kxJNTqn; Wed,  9 Aug 2023 05:30:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E2172417A2;
	Wed,  9 Aug 2023 05:30:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2172417A2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5FC0C0071;
	Wed,  9 Aug 2023 05:30:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A97D6C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Aug 2023 05:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8221C417A9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Aug 2023 05:30:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8221C417A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GoWjkXlNIhxg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Aug 2023 05:30:43 +0000 (UTC)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF403417A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Aug 2023 05:30:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF403417A2
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-563dfffea87so4723165a12.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 08 Aug 2023 22:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691559043; x=1692163843;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jqVBe5pt9GZ7aYDqfwkD/WWrE8SCWRSIo2SjG3OVAgU=;
 b=MM7eLh7HIOK4VQ7mjvl2km+GxCVraxI3FmtGC/e1X2dlLHwM2wunzn0PO+39GW7XGB
 xYNheiS7f/b0DBUVWJLT+uSRKTs5Opoy5211SCFtPyrRspa8BbSjcq1V+nDofiWqI+jl
 ArdNg4OSo/89hx8QQRXKRV9ycRGdIEnzg2zlfHCGotYUJ1nq4Rh4cWvV+gCaLnnD5JWd
 rc1aWa3En8/OLn/pDEev6iep/0ZT2RXMU5tXzWxgnnDeyz2Is0CP/lQDHxTPz5kEZwd0
 bdZwToWnkeIEwhdTYcHCey4kJJXxIhdgXWDQeYK04ose9NlVPINiu06/waL5RuKHRDbI
 HW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691559043; x=1692163843;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jqVBe5pt9GZ7aYDqfwkD/WWrE8SCWRSIo2SjG3OVAgU=;
 b=UDfNu0pxC17dGxW3xGm/uYmwYMAFs7u4pTIrjGCDNdEf6u64TeWEiBD0DLbw/btWIZ
 RgBeJmNF3vXP0q2OehobJ2SVBphJr5BKmmTO5KSU+FRHQvidMqL7mj6zRKh6Cz3OwSfz
 0uCvKxYtKf5oAtPR44LZxPPrl70uZwUOHr04YG4nNQU3xqTinyBWWA+wvTG/YvxB+hTW
 J4bBh7QxettP0ZFeZJCv4AB/aWXuq0tmRs/HnaMMYVSEeOKSHc+uK2nualzQiTeCPDbH
 RBkPrXzvF+JJHvOD813bS3TKK+/SSCjPc6hfHkkROEQ4ybccgvuLjm8qERCGtvry/nEQ
 Xxog==
X-Gm-Message-State: AOJu0YzLTBv+a4VHd5Mo0DO3wvqGmeMmZ/lTMTuYddYws1TWYxQ7UvaU
 fdrdESdstekoPrXB5EL2uwU=
X-Google-Smtp-Source: AGHT+IF8YXJ5+u1OlAQhMTZIOC/FvpTkv+YYhZbdzEmzkD6hXk2WE0zkQSSRVA4O3SYOMJGDlXJtrw==
X-Received: by 2002:a05:6a20:3251:b0:13e:e053:1050 with SMTP id
 hm17-20020a056a20325100b0013ee0531050mr1475021pzc.56.1691559042883; 
 Tue, 08 Aug 2023 22:30:42 -0700 (PDT)
Received: from rajgad.hsd1.ca.comcast.net
 ([2601:204:df00:9cd0:d26e:9bde:5e8b:6cb6])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a62ee10000000b00686940bfb77sm8986255pfi.71.2023.08.08.22.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 22:30:42 -0700 (PDT)
From: Atul Raut <rauji.raut@gmail.com>
To: Felix.Kuehling@amd.com
Subject: [PATCH v2] drm/amdkfd: Use memdup_user() rather than duplicating its
 implementation
Date: Tue,  8 Aug 2023 22:30:18 -0700
Message-Id: <20230809053018.88004-1-rauji.raut@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 amd-gfx@lists.freedesktop.org
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

To prevent its redundant implementation and streamline
code, use memdup_user.

This fixes warnings reported by Coccinelle:
./drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c:2811:13-20: WARNING opportunity for memdup_user

Signed-off-by: Atul Raut <rauji.raut@gmail.com>
---
v1 -> v2
  caller checks for errors, hence removed
---
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 2df153828ff4..df9b618756e6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -2803,19 +2803,11 @@ static void copy_context_work_handler (struct work_struct *work)
 static uint32_t *get_queue_ids(uint32_t num_queues, uint32_t *usr_queue_id_array)
 {
 	size_t array_size = num_queues * sizeof(uint32_t);
-	uint32_t *queue_ids = NULL;
 
 	if (!usr_queue_id_array)
 		return NULL;
 
-	queue_ids = kzalloc(array_size, GFP_KERNEL);
-	if (!queue_ids)
-		return ERR_PTR(-ENOMEM);
-
-	if (copy_from_user(queue_ids, usr_queue_id_array, array_size))
-		return ERR_PTR(-EFAULT);
-
-	return queue_ids;
+	return memdup_user(usr_queue_id_array, array_size);
 }
 
 int resume_queues(struct kfd_process *p,
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
