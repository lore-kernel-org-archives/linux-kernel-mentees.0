Return-Path: <SRS0=n4Lq=Y6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA151C5DF63
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 Nov 2019 12:11:25 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A37EF21848
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 Nov 2019 12:11:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="S+4x+fUo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A37EF21848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5BD39C59;
	Wed,  6 Nov 2019 12:11:25 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 05342C4E
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed,  6 Nov 2019 12:11:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A380B196
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed,  6 Nov 2019 12:11:23 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id c184so18746605pfb.0
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 06 Nov 2019 04:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fvggoBmVPHsmq8MljpGEGs96jCpg2b7Ib4WvpQs+2nE=;
	b=S+4x+fUoX2Te9gAAKioxA/6aiwmDy1LJwKLNVbuddPUNqG+BlHLAZDZ3M8mOnnaQAQ
	z4k7Hqtl0uvCBIK7ohN2/mf3Y13MXKphlMsv0sAlf9anzW3hrLyt1ZdA6bvSOPfVHgbD
	Zgj5Ng8KGnwXlmXicQZ47JZ/BmPQexGqEJ+L6O4OR5QQQNhvZTlkZMv9+Vh4krk4wLbH
	22uceJ4m7i+E7nRrVa3gGiwHuRKpzKddyNDCzKDRAftOlpHrYv8coKONbN/BA24GoP8P
	MBjLW5MPqL68xzrwas3b4NRW+wdZZTxVUN9r+Jt4hpPlWfWybqM3Jp547oCT58qzseP3
	Cc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fvggoBmVPHsmq8MljpGEGs96jCpg2b7Ib4WvpQs+2nE=;
	b=rz2sfcUfj6NfX6BR5b2XT5tOXve7IWYSdDEi2mxMw/+ofXnip2dK8NZHdoGg3oK6U8
	nf3dZi7voaXsMq8NE+5iRW2s0XRYK7ncqQ+pSaDnNr9zi8KjES54LGbaYV26tEpNIGkC
	Mrp9iQi4G2jfewzRTC/Q2q3njIx7KbcS0dzN5Qy322TS++T8p8a066cJQK+HDFu48+P+
	Iq+StE7cjkkxTOd9cDbgih5yseH7SQtE6mnTjA1ueDjpPS8TKcbfJf0Va2AqTBc6ae6r
	EhBB/c9TjbLLsAKF50r+++/dTkv1W9phs9FA5cy32YXcm5/iOo423vyj7EJVhHxP/IVn
	PzKQ==
X-Gm-Message-State: APjAAAV4JG//lTK9+rN0/SyE/9fnraBya3yk4j4QjNgcyzPvgG6eCTrq
	8sP+BaGZReTnOVCf+wwEa7RlnHuXM5humDdxjHuBaw==
X-Google-Smtp-Source: APXvYqwSGbUjKhoe0EizJSFk5e2DKZ5IFkYWt+lZ/BAMoM2M2U/89OaTgLLxGdf13lyF6LBS3GXwfAHfxKSbRIFHb64=
X-Received: by 2002:a63:9d0f:: with SMTP id i15mr2563556pgd.286.1573042282725; 
	Wed, 06 Nov 2019 04:11:22 -0800 (PST)
MIME-Version: 1.0
References: <00000000000042d60805933945b5@google.com>
	<20191105233652.21033-1-tranmanphong@gmail.com>
	<CAAeHK+zKShqnZ=R8KQvVjsfOkAGrWW5jbsXRUnuEY8k4XN3+Fw@mail.gmail.com>
In-Reply-To: <CAAeHK+zKShqnZ=R8KQvVjsfOkAGrWW5jbsXRUnuEY8k4XN3+Fw@mail.gmail.com>
Date: Wed, 6 Nov 2019 13:11:09 +0100
Message-ID: <CAAeHK+zzio=k6aN8rX2meYk1bWiE_TvyzovRkGXm01fbCc_nwA@mail.gmail.com>
To: Phong Tran <tranmanphong@gmail.com>
Cc: alex.theissen@me.com, USB list <linux-usb@vger.kernel.org>,
	syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
	LKML <linux-kernel@vger.kernel.org>,
	syzbot+495dab1f175edc9c2f13@syzkaller.appspotmail.com,
	2pi@mok.nu, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] usb: appledisplay: fix
	use-after-free in bl_get_brightness
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>,
	<mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>,
	<mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
From: Andrey Konovalov via Linux-kernel-mentees
	<linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

On Wed, Nov 6, 2019 at 1:10 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Wed, Nov 6, 2019 at 12:37 AM Phong Tran <tranmanphong@gmail.com> wrote:
> >
> > In context of USB disconnect, the delaywork trigger and calling
> > appledisplay_bl_get_brightness() and the msgdata was freed.
> >
> > add the checking return value of usb_control_msg() and only update the
> > data while the retval is valid.
> >
> > Reported-by: syzbot+495dab1f175edc9c2f13@syzkaller.appspotmail.com
> > Reported-and-tested-by:
> > syzbot+495dab1f175edc9c2f13@syzkaller.appspotmail.com
> >
> > https://groups.google.com/d/msg/syzkaller-bugs/dRmkh2UYusY/l2a6Mg3FAQAJ
>
> Hi Phong,
>
> FYI, when testing patches with the usb-fuzzer instance, you need to
> provide the same kernel commit id as the one where the bug was
> triggered. Please see here for details:

https://github.com/google/syzkaller/blob/master/docs/syzbot.md#usb-bugs

>
> >
> > Signed-off-by: Phong Tran <tranmanphong@gmail.com>
> > ---
> >  drivers/usb/misc/appledisplay.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/misc/appledisplay.c b/drivers/usb/misc/appledisplay.c
> > index ac92725458b5..3e3dfa5a3954 100644
> > --- a/drivers/usb/misc/appledisplay.c
> > +++ b/drivers/usb/misc/appledisplay.c
> > @@ -164,7 +164,8 @@ static int appledisplay_bl_get_brightness(struct backlight_device *bd)
> >                 0,
> >                 pdata->msgdata, 2,
> >                 ACD_USB_TIMEOUT);
> > -       brightness = pdata->msgdata[1];
> > +       if (retval >= 0)
> > +               brightness = pdata->msgdata[1];
> >         mutex_unlock(&pdata->sysfslock);
> >
> >         if (retval < 0)
> > --
> > 2.20.1
> >
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
