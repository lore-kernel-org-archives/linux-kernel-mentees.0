Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E869C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 08:11:35 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6184020656
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 08:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6184020656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5258785A56;
	Tue, 28 Jul 2020 08:11:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TFxibcF7ocvr; Tue, 28 Jul 2020 08:11:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A166985A37;
	Tue, 28 Jul 2020 08:11:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F019C0050;
	Tue, 28 Jul 2020 08:11:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 066B1C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 08:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0289E86294
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 08:11:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9dCln+bqGJ-2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 08:11:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7381A86256
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 08:11:29 +0000 (UTC)
Received: from mail-qt1-f173.google.com ([209.85.160.173]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MsI0K-1koAOy2xrO-00tmxx for
 <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Jul 2020 10:11:26
 +0200
Received: by mail-qt1-f173.google.com with SMTP id h21so7853717qtp.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 01:11:26 -0700 (PDT)
X-Gm-Message-State: AOAM531LX6bqKY7J94HL70UY2nGlQdV6i5uEyz2agYTCOxUWNKHqA9ou
 aC9YOHBg07sbE5NTby1khpT+N34rwFkNa3R1/MQ=
X-Google-Smtp-Source: ABdhPJxCGAB7BbsjfSD7bgaCnwv1WyrC1BKE9mDKkcAW39Ma3IJ37NCcsslzqEKXCuFNjQfzfNsrIHGbS8NsRXh+AwY=
X-Received: by 2002:aed:2946:: with SMTP id s64mr5570242qtd.204.1595923885496; 
 Tue, 28 Jul 2020 01:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200728014343.341303-1-yepeilin.cs@gmail.com>
In-Reply-To: <20200728014343.341303-1-yepeilin.cs@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 28 Jul 2020 10:11:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a29=CugbGtZRQc0abGXvexp=gBk+LwOCG3yNCPakup+NQ@mail.gmail.com>
Message-ID: <CAK8P3a29=CugbGtZRQc0abGXvexp=gBk+LwOCG3yNCPakup+NQ@mail.gmail.com>
To: Peilin Ye <yepeilin.cs@gmail.com>
X-Provags-ID: V03:K1:szPMkeVArdzGy9LzP1PHQgIMODVcJL8KKsGqWoh5YBzkyqlqAwu
 lvYhZIr1KMiENBfVBe+TmEPRQZy2L5/Yn/QPD06BzBxZXbJHP/w7zegn5dX94G2sfyhKvVe
 IDSfP9YlpT63B9dqT+zFIgWPWHDLtkqkYhMvDogIo5zlj+1X+9roY/QtkR0kkiiNFhB6sRD
 U9S3dLul+/WBZRmZwl2+Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:edApv2Srfos=:cedxa3vRTUFnXvql2rmQXk
 h156yI1/37fUjJBh4jwIOmv+7iakjL/Gp4Sl9hEa+ig2vVlxJiN9SoSkYP1jAs02EAFpj5jUw
 QYB1Vcd5sAlfU+6cSPwfDIv5VIdCstAQvtE5wqAxWDkMe8hf1ccGrpZ6L22ACxkY7sZnbXL4E
 /wPxvQY+MXbTJqxmf5yGV3q1Z/xLe8U8v/ZV7f/tzP6kqJptWdzd8TbqS0xR72Y4x2EJRbskS
 7rF2Eb2RoJPV6trLrg+DXaa2pt1VFrG0JyE9nC/vvOLM/T9La04YabmoKiNuRQseb1LoODT7z
 Zr9lwg4A3RlQPvNr+X3GkHbHgq7KLwjM4/9nu7ackBysQrhu5CrK39iPYISV6Y++z3ealta3U
 6muyFVqqNqB5je7SFF8tK04SBZfYlORJJavO2FKKEaLtJqA4FmjZxekxL1NE8GGhl6tLmx+JB
 qve8B1Tl7FIuOfhtbzNjbdZlqbOC2KoaB8SBkK4Kh6mUHc6sRMleCqbvqb8bp2sF9rANEsK/j
 Yr7kCkbxxjT5oDDKowfEuUbTWA9SaeznDWmNhT9m6bbgjR+VVwZtsQ+1tfeCCASzrd28I3Yaq
 wJo7w3pYBTpw/pK4zhhl6a1PIi8l3S1L/DAl6HM71QS69sYHRTH3wdBZCvdkBwHpmryMHrv0F
 zzkz3K1hGv+lQxrvxoL1+FkMIVPAhxiK5tU0yjQ3zmEUB2u9sFhV+qB2ysdLl6/L36xhCGiqe
 tXjUCvZhXJvHgOSizh6tZxvWT57hVcJHg2xZ2IxHaL2kxUXSMLfj9PPQ2JrSixmMrYRtivXBv
 xrmuyfwksMDolMUV07iEvt03t4pNCYY49HFXmMeCK/73+W8evD7CJKhiyK17X4gK7qhH4xduW
 /duzFXlT/PnoYBvkWBOivz7OGPWRpaGA8HYpVfLyg8Rw/Q2ZZmpcdw8ICvBgCN2Uo2n/7Cmpk
 k+GeuR+dVjFf0BKUuhiX1G/FA1sWP9o7lv2m6B2qy1TqljOweazJ3
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] drm/bufs: Prevent
 kernel-infoleak in copy_one_buf()
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

On Tue, Jul 28, 2020 at 3:45 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> copy_one_buf() is copying uninitialized stack memory to userspace due to
> the compiler not initializing holes in statically allocated structures.
> Fix it by initializing `v` with memset().

I would add 'potentially' somewhere in that description: it is architecture
dependent whether there are holes in this structure as 'enum' types
and 'long' are both dependent on the ABI, and even if there is a hole,
it is undefined behavior whether the hold gets initialized.

Other than that, the patch looks good.

> Cc: stable@vger.kernel.org
> Fixes: 5c7640ab6258 ("switch compat_drm_infobufs() to drm_ioctl_kernel()")
> Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

> ---
>  drivers/gpu/drm/drm_bufs.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
> index a0735fbc144b..f99cd4a3f951 100644
> --- a/drivers/gpu/drm/drm_bufs.c
> +++ b/drivers/gpu/drm/drm_bufs.c
> @@ -1349,10 +1349,14 @@ static int copy_one_buf(void *data, int count, struct drm_buf_entry *from)
>  {
>         struct drm_buf_info *request = data;
>         struct drm_buf_desc __user *to = &request->list[count];
> -       struct drm_buf_desc v = {.count = from->buf_count,
> -                                .size = from->buf_size,
> -                                .low_mark = from->low_mark,
> -                                .high_mark = from->high_mark};
> +       struct drm_buf_desc v;
> +
> +       memset(&v, 0, sizeof(v));
> +
> +       v.count = from->buf_count;
> +       v.size = from->buf_size;
> +       v.low_mark = from->low_mark;
> +       v.high_mark = from->high_mark;
>
>         if (copy_to_user(to, &v, offsetof(struct drm_buf_desc, flags)))
>                 return -EFAULT;
> --
> 2.25.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
