Return-Path: <SRS0=w3Lu=NB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55329C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Aug 2021 11:59:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E671360EBD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Aug 2021 11:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E671360EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A538940249;
	Tue, 10 Aug 2021 11:59:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ATixhd2Ssj4A; Tue, 10 Aug 2021 11:59:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7FD4E4020F;
	Tue, 10 Aug 2021 11:59:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 52DFBC0010;
	Tue, 10 Aug 2021 11:59:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA5B0C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 11:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9574281CA3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 11:59:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YQRpevgE-E_0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 11:59:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 639DA81C67
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 11:59:42 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id p145so35580052ybg.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 04:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s2+bEfNurTKiM/3ySeHSOWTbuuy/sHjhtO0XzcLZJeU=;
 b=JBgjFBp9DXN/z9rmNrwn1aS1lR2WvPDnFSyOlPNhMMCE1aezK/Dqax3eKGvax5zy6k
 jPKi7P4R6x4dBx/lYJ5vd01Hf4IMeeZdAGqmS/cGe7YpYefiU1g05hZh8j4p2oci/Xs+
 0LZ71RDWs/rB8qpJ4Gl+68oCvwE4TCrMHqOLPYDKGu/0qf+qRZYUbvgeveckjEyH8Ddg
 d9t7D4sVusrcZjOhBPcBQM9eVt9T7mn5jha6gFrKXnOVgXoTQEN9/LVDIB0AKI4Wn0d2
 5JPh4GiSCv94OEmzzezdNQQizyDp9sezq9jp0KSHOlst9BPKkn+Rt1Yy95cEHpRd7CjG
 KS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s2+bEfNurTKiM/3ySeHSOWTbuuy/sHjhtO0XzcLZJeU=;
 b=jPfojCqL+KOAk/amSdiUiDzgcpnXBzN7CMio1GGLWE2wvZrmAaQuQKF7edT8ghkywW
 yeLGjB+U33QZU5x7AjJ6zjs0j0Q0EHvZ5fT+x5681Nlp4SBBwcTtsR+jFbPmH/GuGjwb
 lIxmxSNPEQHGsdNxVFQWiDWYrLWcDXMLnpL37PPKdeQgDKp9uwb3YCl5VauO8V2ZtRnl
 ncGpmoOlUlvHmWTtY7WB2D/VWIFrtQLYBFYttURWEb3xUKrRZE8bX0HYcuzAQa20KU/9
 dp9lcif5dHsUDvADglzeb0gaQOgH+vwTQXbFj1diEwA+UFSljUDXD2mc8X2Cg2q6bdfn
 Cq2Q==
X-Gm-Message-State: AOAM533ugfL8gmdeNalJ9UmNw+oxyCVoc713AskzCOWMMFD4m862SIj0
 suqImMKMdt7CWYJBIC7a+FoL9JBm+K4Ljdh0b2w=
X-Google-Smtp-Source: ABdhPJzAqE+/j987TSd2FrsiOVDu7DSZDI14GWqLobj93ng/HuWMF8R5gHdN8bCU2FOBt9cuEUaczHizV/YJkwSvgkc=
X-Received: by 2002:a25:505:: with SMTP id 5mr38449939ybf.157.1628596781213;
 Tue, 10 Aug 2021 04:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210803141049.80422-1-rahulbalaji78@gmail.com>
 <CADywMdpJjb8En5dh0mRVmRYEstZ6-ZsUM4X28dx71HB2oWkZoA@mail.gmail.com>
In-Reply-To: <CADywMdpJjb8En5dh0mRVmRYEstZ6-ZsUM4X28dx71HB2oWkZoA@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 10 Aug 2021 13:59:30 +0200
Message-ID: <CAKXUXMw-9K3Vw3NMkinJ=9BvvyG6r51eZEYzyqBQ0TeguXFSjQ@mail.gmail.com>
Subject: Re: [PATCH v2] Task2: checkpatch.pl documentation mentorship: Remove
 semicolon warnings
To: Rahul Balaji <rahulbalaji78@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
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

On Mon, Aug 9, 2021 at 11:17 PM Rahul Balaji <rahulbalaji78@gmail.com> wrote:
>
>
>
> On Tue, 3 Aug 2021, 6:11 pm Rahul Balaji, <rahulbalaji78@gmail.com> wrote:
>>
>> Signed-off-by: Rahul Balaji <rahulbalaji78@gmail.com>
>>
>> no functional changes.
>>
>>  drivers/gpu/drm/nouveau/nouveau_gem.c | 2 +-
>>  drivers/mtd/ubi/block.c               | 2 +-
>>  fs/block_dev.c                        | 2 +-
>>  include/trace/events/iocost.h         | 2 +-
>>  4 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
>> index 5b27845075a1..d476940ee97c 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
>> @@ -339,7 +339,7 @@ nouveau_gem_set_domain(struct drm_gem_object *gem, uint32_t read_domains,
>>         struct ttm_buffer_object *bo = &nvbo->bo;
>>         uint32_t domains = valid_domains & nvbo->valid_domains &
>>                 (write_domains ? write_domains : read_domains);
>> -       uint32_t pref_domains = 0;;
>> +       uint32_t pref_domains = 0;
>>
>>         if (!domains)
>>                 return -EINVAL;
>> diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
>> index e003b4b44ffa..e0402c2f8959 100644
>> --- a/drivers/mtd/ubi/block.c
>> +++ b/drivers/mtd/ubi/block.c
>> @@ -405,7 +405,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
>>         ret = blk_mq_alloc_tag_set(&dev->tag_set);
>>         if (ret) {
>>                 dev_err(disk_to_dev(dev->gd), "blk_mq_alloc_tag_set failed");
>> -               goto out_free_dev;;
>> +               goto out_free_dev;
>>         }
>>
>>
>> diff --git a/fs/block_dev.c b/fs/block_dev.c
>> index 9ef4f1fc2cb0..61b938fa5d5b 100644
>> --- a/fs/block_dev.c
>> +++ b/fs/block_dev.c
>> @@ -1268,7 +1268,7 @@ static int blkdev_get_whole(struct block_device *bdev, fmode_t mode)
>>         if (test_bit(GD_NEED_PART_SCAN, &disk->state))
>>                 bdev_disk_changed(disk, false);
>>         bdev->bd_openers++;
>> -       return 0;;
>> +       return 0;
>>  }
>>
>>  static void blkdev_put_whole(struct block_device *bdev, fmode_t mode)
>> diff --git a/include/trace/events/iocost.h b/include/trace/events/iocost.h
>> index e282ce02fa2d..6d1626e7a4ce 100644
>> --- a/include/trace/events/iocost.h
>> +++ b/include/trace/events/iocost.h
>> @@ -160,7 +160,7 @@ TRACE_EVENT(iocost_ioc_vrate_adj,
>>
>>         TP_fast_assign(
>>                 __assign_str(devname, ioc_name(ioc));
>> -               __entry->old_vrate = atomic64_read(&ioc->vtime_rate);;
>> +               __entry->old_vrate = atomic64_read(&ioc->vtime_rate);
>>                 __entry->new_vrate = new_vrate;
>>                 __entry->busy_level = ioc->busy_level;
>>                 __entry->read_missed_ppm = missed_ppm[READ];
>> --
>> 2.25.1
>
>
>
> Respected mentors,
>
> Please do find the changes in the same mail quoted as above.
>

Rahul, this is not the way to submit a patch to the kernel mailing list.

First, I do not see the "quote" in this email, I assume you mean the
email before in this email thread?

Second, the commit message in the patch needs to contain all
information relevant for exactly that one change you are proposing,
and should not just refer to other emails.

(And if you refer to emails, use links to lore.kernel.org and use the
Link: tag. Careful, that is already advanced knowledge for patch
submission; get the basics right first.)

I suggest you try with another PATCH v3 and then we see what we got here.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
