Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 931C7C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 13:13:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D3092074F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 13:13:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pL1VEAIF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D3092074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2C0D287F58;
	Tue, 28 Jul 2020 13:13:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TUARTgzCKvxg; Tue, 28 Jul 2020 13:13:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A1A21866F0;
	Tue, 28 Jul 2020 13:13:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95DB4C004F;
	Tue, 28 Jul 2020 13:13:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5DD94C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 13:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 542FB85187
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 13:13:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nVVqG-ZI5gwu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 13:13:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 945BD8511F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 13:13:32 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id u8so9037236qvj.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 06:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wVQ4PCIk/Mi+M+QeA/Wca4Cre04s8hgp15ZLx5XfDZg=;
 b=pL1VEAIFMSgD3WD2ciXOwyWiQoTMEvG6XL7SyqSWpiABvpcc2rO2EdXKjFV8xD1lYg
 GNa/yBNZnQO2TMGeoptsApl90kDiJxOFe560qW2avPXvLhtuSxr6PM56HqH/D2yTpR4W
 A9lumU99tKynCllpYhOZmqFC/txXwd22MAwmMG97kVlSetVIujR6IJvngw3jd54H5N5u
 DB+ALBuED2jut236BveYoqI8QiicwZetSaW70xlO3Gd0FhzHhQ3tIJHNkYtNKHtniOYR
 O808Xsd7dyg9KQZUtMVz2awkTt7J0OHzoTs0lTRBcG6LVGKz+tvke6GYErsCZHpsZ4ia
 JT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wVQ4PCIk/Mi+M+QeA/Wca4Cre04s8hgp15ZLx5XfDZg=;
 b=FB1LB6RQ5llp+STHpEVQs3PBmBqdVlislpRN8eyp9jjgPs+3ez0FST/l9p2wKv8LQR
 uuFQo3VQSLAEkzW8A+bVPVAgHLRterKzu+y2zPBTZ1GA0HtuEWSlMtlA3y813vDWTpS5
 tt3OE+767KNik/RbEYfJCoYH5EPTxClz54NTVsMpDjzMfVaAne2+6ULFIHkvdyI48Xys
 d0t5QUQx6UKoA6FihWwDy9ZhvRSJXbiHnzRReUkNhfTVtauHufJua29DpAcecykrpB6F
 2cTB5a2fcnN2C5L+9F/hct3v7mpZoR2cGOCr2SzHpqZ0gF9HIQDf2pN2ztYi4wvahrry
 XA/Q==
X-Gm-Message-State: AOAM531tbPxLvNfuky38D3ADRrYvZUv+3qDeoG6fbB9CDh7ICBm6TLg8
 H88v1GJFQglkPhFqJF109w==
X-Google-Smtp-Source: ABdhPJy6Yk6QbdnipbQ8OQ58GUMrB3Xz1lgcBJcOXLEaYFkhBZnlkY1lFBZAQIoTm0QmsSp5YAdNfQ==
X-Received: by 2002:ad4:5912:: with SMTP id ez18mr25898937qvb.24.1595942011649; 
 Tue, 28 Jul 2020 06:13:31 -0700 (PDT)
Received: from PWN (c-76-119-149-155.hsd1.ma.comcast.net. [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id 65sm18057540qkn.103.2020.07.28.06.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 06:13:31 -0700 (PDT)
Date: Tue, 28 Jul 2020 09:13:28 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200728131328.GA410244@PWN>
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam> <20200727223357.GA329006@PWN>
 <20200728094707.GF2571@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728094707.GF2571@kadam>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
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

On Tue, Jul 28, 2020 at 12:47:07PM +0300, Dan Carpenter wrote:
> On Mon, Jul 27, 2020 at 06:33:57PM -0400, Peilin Ye wrote:
> > On Mon, Jul 27, 2020 at 04:16:08PM +0300, Dan Carpenter wrote:
> > > drivers/block/floppy.c:3132 raw_cmd_copyout() warn: check that 'cmd' doesn't leak information (struct has a hole after 'flags')
> > 
> > (Removed some Cc: recipients from the list.)
> > 
> > I'm not very sure, but I think this one is also a false positive.
> 
> No, it's a potential bug.  You're over thinking what Smatch is
> complaining about.  Arnd is right.
> 
>   3123  static int raw_cmd_copyout(int cmd, void __user *param,
>   3124                                    struct floppy_raw_cmd *ptr)
>   3125  {
>   3126          int ret;
>   3127  
>   3128          while (ptr) {
>   3129                  struct floppy_raw_cmd cmd = *ptr;
>                                               ^^^^^^^^^^
> The compiler can either do this assignment as an memcpy() or as a
> series of struct member assignments.  So the assignment can leave the
> struct hole uninitialized.

I see, I didn't realize this line could cause the issue. Thank you for
pointing this out, I will do this then send a patch:

diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index 09079aee8dc4..398c261fd174 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -3126,7 +3126,8 @@ static int raw_cmd_copyout(int cmd, void __user *param,
        int ret;

        while (ptr) {
-               struct floppy_raw_cmd cmd = *ptr;
+               struct floppy_raw_cmd cmd;
+               memcpy(&cmd, ptr, sizeof(cmd));
                cmd.next = NULL;
                cmd.kernel_data = NULL;
                ret = copy_to_user(param, &cmd, sizeof(cmd));

Thank you,
Peilin Ye

>   3130                  cmd.next = NULL;
>   3131                  cmd.kernel_data = NULL;
>   3132                  ret = copy_to_user(param, &cmd, sizeof(cmd));
>                                                   ^^^^
> potential info leak.
> 
>   3133                  if (ret)
>   3134                          return -EFAULT;
>   3135                  param += sizeof(struct floppy_raw_cmd);
>   3136                  if ((ptr->flags & FD_RAW_READ) && ptr->buffer_length) {
>   3137                          if (ptr->length >= 0 &&
>   3138                              ptr->length <= ptr->buffer_length) {
>   3139                                  long length = ptr->buffer_length - ptr->length;
>   3140                                  ret = fd_copyout(ptr->data, ptr->kernel_data,
>   3141                                                   length);
>   3142                                  if (ret)
>   3143                                          return ret;
>   3144                          }
>   3145                  }
>   3146                  ptr = ptr->next;
>   3147          }
>   3148  
>   3149          return 0;
>   3150  }
> 
> regards,
> dan carpenter
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
