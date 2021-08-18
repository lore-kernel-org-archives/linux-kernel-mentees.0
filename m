Return-Path: <SRS0=1Ivo=NJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F3CEC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 11:06:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35EE661056
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 11:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35EE661056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3CC94028A;
	Wed, 18 Aug 2021 11:06:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a-Ajp_qWRcWX; Wed, 18 Aug 2021 11:06:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CE5AE40283;
	Wed, 18 Aug 2021 11:06:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93EE7C001C;
	Wed, 18 Aug 2021 11:06:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53E0BC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 11:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F05740283
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 11:06:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wk3tztQLoolQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 11:06:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C91D40281
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 11:06:41 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q6so2873003wrv.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 04:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=NPOr3Gsm++Jn+YbgaVuAdXWQs+lGHRq4aVwKxZvTaSw=;
 b=Gb+bX/DMqPhU/Gs13lF8AY1wqU95YsbV5W+CDvEpOSq0hnHYwwvnW6d/lNA9UADnZX
 09wq+/BL4admOxeXXY4T1RPPuMJyOhLwUN6623S+X/BbKTRUPVQ4UIq69HbzA1KcPZ+B
 Hjsq2uYLK6ZiY0UjkL8U9aT8QL0lkk0TXVXCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=NPOr3Gsm++Jn+YbgaVuAdXWQs+lGHRq4aVwKxZvTaSw=;
 b=lmKDSQJ8tKVIpEPrw7I0HRIYihzfGknFcsPoA5W3PEm4kSD9AFN6QivoYYoMFeeFoJ
 34dP0EVvQH1g4UktLDF+hSOBRh+ACmD4vhBR2aYuNfAlBjkLDzY/MBgineHXoIEcwxZA
 1J78LpKcBM2ISQxQmeopqR/N76wXy0cYAIblvB6EroPOOhckbWBmzwTc7MashljxrwxK
 9h7HWvs80GFSb21RZJ9x3ZkqQ3l0lD8lvkGbo03kd0c88s1fUn0GEY0/SQ9hIxE07bHV
 iukbJkgvUufIecvbp4F58Dz5G9K1CPLvQLcutY8s/Cq707lKfFSduEzIfsckevldIh1p
 E2fA==
X-Gm-Message-State: AOAM531J41OXHP8m2qtJRvGjNobAt1SZUmJneR5G4EE9WK+6Twg3ztmU
 nKtpVdo8JrXpLsVJz12t6UVEFQ==
X-Google-Smtp-Source: ABdhPJy3direa3AYQ9AORP/zJ+ru6FCIsPvkYBAl/d0IdWCjpdrItlf4YzM0hadmH90C6qm9MQnNjg==
X-Received: by 2002:adf:f282:: with SMTP id k2mr9819865wro.255.1629284799276; 
 Wed, 18 Aug 2021 04:06:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d8sm5575127wrx.12.2021.08.18.04.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 04:06:38 -0700 (PDT)
Date: Wed, 18 Aug 2021 13:06:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH v3 8/9] kernel: export task_work_add
Message-ID: <YRzpvHBQuq0kFtzH@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
 christian.koenig@amd.com, axboe@kernel.dk, oleg@redhat.com,
 tglx@linutronix.de, dvyukov@google.com, walter-zh.wu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 kernel test robot <lkp@intel.com>
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
 <20210818073824.1560124-9-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210818073824.1560124-9-desmondcheongzx@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Cc: axboe@kernel.dk, walter-zh.wu@mediatek.com, tzimmermann@suse.de,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 oleg@redhat.com, mripard@kernel.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, kernel test robot <lkp@intel.com>,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, tglx@linutronix.de,
 linux-kernel-mentees@lists.linuxfoundation.org, sumit.semwal@linaro.org,
 dvyukov@google.com, linux-media@vger.kernel.org
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

On Wed, Aug 18, 2021 at 03:38:23PM +0800, Desmond Cheong Zhi Xi wrote:
> The task_work_add function is needed to prevent userspace races with
> DRM modesetting rights.
> 
> Some DRM ioctls can change modesetting permissions while other
> concurrent users are performing modesetting. To prevent races with
> userspace, such functions should flush readers of old permissions
> before returning to user mode. As the function that changes
> permissions might itself be a reader of the old permissions, we intend
> to schedule this flush using task_work_add.
> 
> However, when DRM is compiled as a loadable kernel module without
> exporting task_work_add, we get the following compilation error:
> 
> ERROR: modpost: "task_work_add" [drivers/gpu/drm/drm.ko] undefined!
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

Just realized another benefit of pushing the dev->master_rwsem write
locks down into ioctls that need them: We wouldn't need this function here
exported for use in drm. But also I'm not sure that works any better than
the design in your current patch set ...
-Daniel

> ---
>  kernel/task_work.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/task_work.c b/kernel/task_work.c
> index 1698fbe6f0e1..90000404af2b 100644
> --- a/kernel/task_work.c
> +++ b/kernel/task_work.c
> @@ -60,6 +60,7 @@ int task_work_add(struct task_struct *task, struct callback_head *work,
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL(task_work_add);
>  
>  /**
>   * task_work_cancel_match - cancel a pending work added by task_work_add()
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
