Return-Path: <SRS0=Rn35=ZK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8EB3C432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 Nov 2019 09:43:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1A322073A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 Nov 2019 09:43:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D7j6LC5h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1A322073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6E1CA87B41;
	Mon, 18 Nov 2019 09:43:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZgTrUgEb6qmU; Mon, 18 Nov 2019 09:43:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 68E6487B1D;
	Mon, 18 Nov 2019 09:43:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5EBD8C18DA;
	Mon, 18 Nov 2019 09:43:39 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 100B6C07AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Nov 2019 09:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EE5F385BEE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Nov 2019 09:43:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GbAhDf6ZiYZm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Nov 2019 09:43:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E86F485BD1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Nov 2019 09:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574070215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2K0wvDeLJaW8sYE1jy+QQGz6cSrIUDN55exId+Sge8Y=;
 b=D7j6LC5htBBByzR4SJIWinAiI4mIkL7/q8XHLdaW4xHTWoKdMqrWR0p2mL7HwfC7CFwejF
 MrCtEHeS9s+wtRtbKq9X0syx/Hck+HWj5HfRRp9eYRdzjeI8vgKnetE9g4ZISr1e7vs+qH
 /Gq9wDMQCf4bR/3A2pxwa32LSdh1cnY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-C2z1AcP_Pqet9yEKHkFpCA-1; Mon, 18 Nov 2019 04:43:34 -0500
Received: by mail-qk1-f199.google.com with SMTP id 125so11128878qkj.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Nov 2019 01:43:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v6BPHFPKvorTEt7xRKiDYcS9E+a1exQkd1rgkDj9f8k=;
 b=S7i4s4xoUARfr64DXDFyVbclTGTvY4jvfx/Iq7R4fPJ4Y0MRjxPQBYx4pKQ3Ujhrk2
 uXVlafYgbssjgdElanVJ5fKDLWFPlQE2D6ofzRHl9oQzp9BNwRDrk0HTQ8ZT/WUDRMC1
 6CG000VyCETYigDxvPZXrB3DlQPe4OrlF+INt0RSRIyJWrHz3BZXg0MR2g4wk9ZyMdCU
 eJQEiS3y43tHxot6JK/diunAIMYX+4D+XlCzOlVp24VXw4KodZH/p6lTV0I7TjJFWCfe
 3o19zz7sr69g7A2kP9MGdYxYqylaim6B8l9b7Y1lYYaqug9SXCt/IwKm5uV7MPiWzGE3
 OjNw==
X-Gm-Message-State: APjAAAXcwld2LEfxP7ebJRqRJKUsdCFL5D3E8mAvRRdq8A5NhRKvUxc0
 IlHUtQqhZf2zpMEMjJlrM5MWyrBni3Ba2xC5y/r+orgwBU5Djo1likSI6hN6pEmWXrqV9Yfp6W2
 KGbiPwamo79xcH/Z2wPPBP2Yso/SXFRUvu/eKiiAIdU2Gl15UMtTtU/ZQxdWYJ0Uk
X-Received: by 2002:ad4:4042:: with SMTP id r2mr14849479qvp.196.1574070214015; 
 Mon, 18 Nov 2019 01:43:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqx71kYpokpYolgnoIGCviUOb0R7a7qr8hq+AWngDyS809ErQ8pbjgNF0TGZ3+0bjitznHrrNaWkVj/d0HliWew=
X-Received: by 2002:ad4:4042:: with SMTP id r2mr14849462qvp.196.1574070213673; 
 Mon, 18 Nov 2019 01:43:33 -0800 (PST)
MIME-Version: 1.0
References: <20191105141807.27054-1-tranmanphong@gmail.com>
In-Reply-To: <20191105141807.27054-1-tranmanphong@gmail.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Mon, 18 Nov 2019 10:43:21 +0100
Message-ID: <CAO-hwJ+cydMPQE_otc8-67=SDKmjac5RXsLs-9x6dH4YqA+DVQ@mail.gmail.com>
To: Phong Tran <tranmanphong@gmail.com>
X-MC-Unique: C2z1AcP_Pqet9yEKHkFpCA-1
X-Mimecast-Spam-Score: 0
Cc: syzbot+1234691fec1b8ceba8b1@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 lkml <linux-kernel@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] HID: hid-lg4ff: Fix uninit-value
	set_autocenter_default
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

On Tue, Nov 5, 2019 at 3:18 PM Phong Tran <tranmanphong@gmail.com> wrote:
>
> syzbot found a problem using of uinit pointer in
> lg4ff_set_autocenter_default().
>
> Reported-by: syzbot+1234691fec1b8ceba8b1@syzkaller.appspotmail.com
>
> Tested by syzbot:
>
> https://groups.google.com/d/msg/syzkaller-bugs/ApnMLW6sfKE/Qq0bIHGEAQAJ

This seems weird to me:

the syzbot link above is about `hid_get_drvdata(hid)`, and, as I read
it, the possibility that hid might not have an initialized value.

Here you are changing the initialized values of value, entry and
drv_data, all 3 are never used before their first assignment.

I have a feeling this particular syzbot check has already been fixed
upstream by d9d4b1e46d95 "HID: Fix assumption that devices have
inputs".

Cheers,
Benjamin

>
> Signed-off-by: Phong Tran <tranmanphong@gmail.com>
> ---
>  drivers/hid/hid-lg4ff.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hid/hid-lg4ff.c b/drivers/hid/hid-lg4ff.c
> index 5e6a0cef2a06..44dfd08b0c32 100644
> --- a/drivers/hid/hid-lg4ff.c
> +++ b/drivers/hid/hid-lg4ff.c
> @@ -468,10 +468,10 @@ static int lg4ff_play(struct input_dev *dev, void *data, struct ff_effect *effec
>  static void lg4ff_set_autocenter_default(struct input_dev *dev, u16 magnitude)
>  {
>         struct hid_device *hid = input_get_drvdata(dev);
> -       s32 *value;
> +       s32 *value = NULL;
>         u32 expand_a, expand_b;
> -       struct lg4ff_device_entry *entry;
> -       struct lg_drv_data *drv_data;
> +       struct lg4ff_device_entry *entry = NULL;
> +       struct lg_drv_data *drv_data = NULL;
>         unsigned long flags;
>
>         drv_data = hid_get_drvdata(hid);
> --
> 2.20.1
>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
