Return-Path: <SRS0=1Ivo=NJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 979EBC432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 07:41:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 629AA60FDA
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 07:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 629AA60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C8E980D37;
	Wed, 18 Aug 2021 07:41:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1typCmHwuwn3; Wed, 18 Aug 2021 07:41:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9595780D2D;
	Wed, 18 Aug 2021 07:41:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71A9AC001A;
	Wed, 18 Aug 2021 07:41:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6CA16C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 07:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69AE180D2D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 07:41:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OAWR0yO3D--4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 07:41:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1C3A80D1C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 07:41:20 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 fa24-20020a17090af0d8b0290178bfa69d97so1835546pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 00:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E3tKLo4xSINmwLRhCWFdK6hj3HPWsZp310jfHIOH2bI=;
 b=eYlqI7+uh+RIUCvEG+ElTKQ65oYiO/7b9n5s4gD+lLB6dI3+1tBTrfM+E9gHq8+ghC
 pG+mnIdCtT+Qw/TcAMOTN1jsKNfeHJwUKNjPciJDepeHxgQuMRRs7kyHxyN3OR70HFEk
 fH+FOFElAQ4Gsek+UHpdno02wP1O8QQA6kKroGAfCuSk73VvPdce0uYe68NM9b0/lhWN
 +ViMb30Poox2EIE3XtkHQvZtKdTkqedODzSILqubxYNdgynB3qc8Ix+Nz5Uqdi4f6qGm
 3QkmjB9cvkubT2qFaKfHNev6sn1lvzQ9lLvI0mmtvOsFiagT4KeuiRaSXnwiqAQmm3v2
 i6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E3tKLo4xSINmwLRhCWFdK6hj3HPWsZp310jfHIOH2bI=;
 b=g9IyUCwo7T2Jz3Lf/DyA1UFrmXNUvx9o1yAq6GkD5i1nRU1W9+gtIV+FaUAqMlvl22
 ZwP8WVfI37tQiVqoQmOPEASTyYYGncASe8BLlcBH1XeYigDMPLaXE9wrLYc09oaWVDBe
 zJv8zG2mjuVNB5WBQS7rSLW+IZXLdLqfWW5xwo5Mr1SZ7DG+nCJAtlUctFa3LRoWTFp1
 voZBbuEYXsX9gEhAgGLH9pfGL5LlLKMSKxfzuvHJZmf4t+9nmeDNSGcJ6l0/rH1V5v51
 he2Rl9cVw3fAGsnFEB0s6tWIK36SeSMTWbl6VZZmiXan/1kqDLUb4EWdlA91ouaAe5zD
 kaUg==
X-Gm-Message-State: AOAM531z4euKuElj/ZwtCGEsFbn4Zk+lcBlk8CO/8scJZZbvkQG7YkeV
 wJKdbY0ursB5YmSvt8U/RTM=
X-Google-Smtp-Source: ABdhPJyntCa9RBP+wiR85wtfYtfjM9dTewB7E46OvMfEVp35CNo8y0LFchz5LQwPRQnlto9UE/Tv5g==
X-Received: by 2002:a17:902:a406:b029:12b:c50a:4289 with SMTP id
 p6-20020a170902a406b029012bc50a4289mr6303191plq.56.1629272480446; 
 Wed, 18 Aug 2021 00:41:20 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id u3sm3886729pjr.2.2021.08.18.00.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 00:41:20 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com, axboe@kernel.dk, oleg@redhat.com,
 tglx@linutronix.de, dvyukov@google.com, walter-zh.wu@mediatek.com
Subject: [PATCH v3 8/9] kernel: export task_work_add
Date: Wed, 18 Aug 2021 15:38:23 +0800
Message-Id: <20210818073824.1560124-9-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: kernel test robot <lkp@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
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

The task_work_add function is needed to prevent userspace races with
DRM modesetting rights.

Some DRM ioctls can change modesetting permissions while other
concurrent users are performing modesetting. To prevent races with
userspace, such functions should flush readers of old permissions
before returning to user mode. As the function that changes
permissions might itself be a reader of the old permissions, we intend
to schedule this flush using task_work_add.

However, when DRM is compiled as a loadable kernel module without
exporting task_work_add, we get the following compilation error:

ERROR: modpost: "task_work_add" [drivers/gpu/drm/drm.ko] undefined!

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 kernel/task_work.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/task_work.c b/kernel/task_work.c
index 1698fbe6f0e1..90000404af2b 100644
--- a/kernel/task_work.c
+++ b/kernel/task_work.c
@@ -60,6 +60,7 @@ int task_work_add(struct task_struct *task, struct callback_head *work,
 
 	return 0;
 }
+EXPORT_SYMBOL(task_work_add);
 
 /**
  * task_work_cancel_match - cancel a pending work added by task_work_add()
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
