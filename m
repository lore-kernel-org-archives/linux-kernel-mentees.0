Return-Path: <SRS0=n4Lq=Y6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED94C5DF62
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 Nov 2019 12:11:10 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66822214D8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 Nov 2019 12:11:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="fA5EbDNN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66822214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4576BC4E;
	Wed,  6 Nov 2019 12:11:10 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8F648C11
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed,  6 Nov 2019 12:11:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 47A62189
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed,  6 Nov 2019 12:11:09 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id v19so18724395pfm.3
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 06 Nov 2019 04:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OEfw9cUz4TGuYkw6SKbOhoFYIK/OUoQLEjTHKdEArNo=;
	b=fA5EbDNNhUthKOfKfplHC/PC0ChmTlyF6fmMfBqXTprs8uRNto83kgWHVaS8OcRM4W
	PtnjGw4M/cfDVmAxqRXwpd9NczmkNfCR37ozIcvmzjr2X7cO2UFEL7KmJr+1+50w8OjU
	deNOf/rey23zka2vXis+c7yrfKPew7KFRjLXr7utYeN+7YLjLv3xfKMui7FXPmInxp/Q
	On2Dmvnc8TxwkGGjUYMsGTbXWJpqBe1KM6zzzWXxpNxOUDyLK+56AnnOV0rLPQxLnKQ9
	JbtS51kREKMexDTmZi4Ud4Dr9+BEtsSps39PGQA4C0wJ75PHunHRLAaUHKEGvanZURbg
	jlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OEfw9cUz4TGuYkw6SKbOhoFYIK/OUoQLEjTHKdEArNo=;
	b=jicS5UKN0PXyMmT2EcDF4rdhXjaQXDxUHdaQjwBKY/6Z3mCIa9qdvqsWmcOBENwHj3
	hUTucRgekwuAnFCPpIsl0VTBX2OHjOR7mnmT1CvPPDF66DrCnfGEFwJgfRpj74RuMGt/
	pxKeTLywCvY2LKELntpnVaVfGfGZOU6TByRG7kW3D/M+dP0ETYAYkl6gtcwnWaqdNHeI
	/QDvhhNtmpO5I/hPJkUCwZEwbjKC05NLRlrDp8EhTnbWRuL9jGvx/RtkEg89NzN9I5wy
	iXvsE1EsMy5uiyG1LZT/PGLtTzn4muOhUDlBM8hZ2JhUKc6/LjlWFYXpNltFW3nCRsck
	vihA==
X-Gm-Message-State: APjAAAUVMWleQM7uQeR2bJPiPm9ezp+Eubw6TLwu9fuTk43ZBBMRu70u
	6bdo5OZPUNiD8Fkfc33UEm54pzXvntsjG08V/kAeLw==
X-Google-Smtp-Source: APXvYqzNvoD7XYantgXwZkOZmcI65fkzmHQsoQLeCP54fkmsPfBgPqY9pqxrRXZplYktB1mgJjiBj6ZvU0+bmxy5IWI=
X-Received: by 2002:aa7:9ad0:: with SMTP id x16mr2953838pfp.51.1573042268452; 
	Wed, 06 Nov 2019 04:11:08 -0800 (PST)
MIME-Version: 1.0
References: <00000000000042d60805933945b5@google.com>
	<20191105233652.21033-1-tranmanphong@gmail.com>
In-Reply-To: <20191105233652.21033-1-tranmanphong@gmail.com>
Date: Wed, 6 Nov 2019 13:10:56 +0100
Message-ID: <CAAeHK+zKShqnZ=R8KQvVjsfOkAGrWW5jbsXRUnuEY8k4XN3+Fw@mail.gmail.com>
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

On Wed, Nov 6, 2019 at 12:37 AM Phong Tran <tranmanphong@gmail.com> wrote:
>
> In context of USB disconnect, the delaywork trigger and calling
> appledisplay_bl_get_brightness() and the msgdata was freed.
>
> add the checking return value of usb_control_msg() and only update the
> data while the retval is valid.
>
> Reported-by: syzbot+495dab1f175edc9c2f13@syzkaller.appspotmail.com
> Reported-and-tested-by:
> syzbot+495dab1f175edc9c2f13@syzkaller.appspotmail.com
>
> https://groups.google.com/d/msg/syzkaller-bugs/dRmkh2UYusY/l2a6Mg3FAQAJ

Hi Phong,

FYI, when testing patches with the usb-fuzzer instance, you need to
provide the same kernel commit id as the one where the bug was
triggered. Please see here for details:

>
> Signed-off-by: Phong Tran <tranmanphong@gmail.com>
> ---
>  drivers/usb/misc/appledisplay.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/misc/appledisplay.c b/drivers/usb/misc/appledisplay.c
> index ac92725458b5..3e3dfa5a3954 100644
> --- a/drivers/usb/misc/appledisplay.c
> +++ b/drivers/usb/misc/appledisplay.c
> @@ -164,7 +164,8 @@ static int appledisplay_bl_get_brightness(struct backlight_device *bd)
>                 0,
>                 pdata->msgdata, 2,
>                 ACD_USB_TIMEOUT);
> -       brightness = pdata->msgdata[1];
> +       if (retval >= 0)
> +               brightness = pdata->msgdata[1];
>         mutex_unlock(&pdata->sysfslock);
>
>         if (retval < 0)
> --
> 2.20.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
