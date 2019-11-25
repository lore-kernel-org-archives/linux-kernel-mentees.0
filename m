Return-Path: <SRS0=mcle=ZR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52253C43141
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 Nov 2019 15:14:51 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24D8F2082F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 Nov 2019 15:14:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D80KvJ64"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24D8F2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F322B2011B;
	Mon, 25 Nov 2019 15:14:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gBBY5Qv6Mb6i; Mon, 25 Nov 2019 15:14:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 56A132010A;
	Mon, 25 Nov 2019 15:14:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42040C0881;
	Mon, 25 Nov 2019 15:14:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91776C0878
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Nov 2019 15:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7286D2010D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Nov 2019 15:14:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WgMt8itCwJOn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Nov 2019 15:14:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 59FC62010A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Nov 2019 15:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574694885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UsViNUF8R5vNPI8HMF3+qgqlgoEtqHxa8xpNMwJsggY=;
 b=D80KvJ64TMw1+BpxQDYdi+0d1NNWmmG1QHuE3j0I8h7+4m7wtOk3F+QQI1hZbEyALHGiDT
 TJ6clvIqM1+4ttI+lT4w7ZPo55hfijdICY3i1IriDcfxNtOAUzhnHPIoQgncjwAJP+JTA3
 8thz74J0O6AcB4rtTQgzhjKC9SrQsE8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-22ClGwiIO2yQEDbcj-S_XQ-1; Mon, 25 Nov 2019 10:14:43 -0500
Received: by mail-qv1-f70.google.com with SMTP id b1so10495434qvm.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Nov 2019 07:14:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U8eb8wa21YsOeZ9EHNPAieCGqRK3RoFp6IWeODBsRdM=;
 b=RIuOiMQOP+LyAuJhHQbDC9G1ufF1KKx+AiBg8CezrwyT52350prB7cM3lsWb64NYzL
 PsjZ1N2TDQjiMiznDRoskvSPnnilzL9fV0Lv7DpCMV8DYy2s0f7SPQWIHyV0GvewXzAm
 Exfyd58QCpcDncZAWamL+eXOxl+6h05agQqCE1p34ZmpwGjZHevXa9GChSCgKVoUUQDS
 2AAGcF2UI9OV+wDfF1+YK8e6hfNMU3CSNFNiHmLKvgEr3sFwBNaJF/irjNvxLjiRr6jO
 f7dztal4wbP3K7H2TSzsL8flZI3vqjZLW82KYO6/dTLeCrcYG1iMkNluLPOhJLPHS+fu
 J3+g==
X-Gm-Message-State: APjAAAVlRcOjjcgd43XNTiLnKgFzTB6F1ITV0hvmkpfuIJp+/oQgIdM6
 u6JX1HIPZ71NpVT5NsUyI+wSwv26NV0ZKJEPo3GfYVGXFPmGi9c7oOtL8gbnhbLWXHStblvtVj6
 bm0NH1pDYyHHOTKLtUTINE6323flDjx5IZsdMl0udQGHQGky8znMGUC3eTYXQipTU
X-Received: by 2002:a0c:e085:: with SMTP id l5mr28250898qvk.138.1574694883179; 
 Mon, 25 Nov 2019 07:14:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqz231nFYrEpCOtVtPCVvxtw8KqhWa9u2D2TL5w9YZ3DcpHEw3DlDKnUGv/FxcjKOG+Qo5fUmUbxnHwBsYq8Spw=
X-Received: by 2002:a0c:e085:: with SMTP id l5mr28250865qvk.138.1574694882877; 
 Mon, 25 Nov 2019 07:14:42 -0800 (PST)
MIME-Version: 1.0
References: <20191105141807.27054-1-tranmanphong@gmail.com>
 <CAO-hwJ+cydMPQE_otc8-67=SDKmjac5RXsLs-9x6dH4YqA+DVQ@mail.gmail.com>
 <0407e8bb-bbf5-ec64-cdac-ef266f1ab391@gmail.com>
In-Reply-To: <0407e8bb-bbf5-ec64-cdac-ef266f1ab391@gmail.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Mon, 25 Nov 2019 16:14:31 +0100
Message-ID: <CAO-hwJ+r+n4Dy+jqSuCk-vApfP-PR4o2oTzt4XWxH5jUQOeFwA@mail.gmail.com>
To: Phong Tran <tranmanphong@gmail.com>
X-MC-Unique: 22ClGwiIO2yQEDbcj-S_XQ-1
X-Mimecast-Spam-Score: 0
Cc: syzbot <syzbot+1234691fec1b8ceba8b1@syzkaller.appspotmail.com>,
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

On Tue, Nov 19, 2019 at 2:30 PM Phong Tran <tranmanphong@gmail.com> wrote:
>
> On 11/18/19 4:43 PM, Benjamin Tissoires wrote:
> > On Tue, Nov 5, 2019 at 3:18 PM Phong Tran <tranmanphong@gmail.com> wrote:
> >>
> >> syzbot found a problem using of uinit pointer in
> >> lg4ff_set_autocenter_default().
> >>
> >> Reported-by: syzbot+1234691fec1b8ceba8b1@syzkaller.appspotmail.com
> >>
> >> Tested by syzbot:
> >>
> >> https://groups.google.com/d/msg/syzkaller-bugs/ApnMLW6sfKE/Qq0bIHGEAQAJ
> >
> > This seems weird to me:
> >
> > the syzbot link above is about `hid_get_drvdata(hid)`, and, as I read
> > it, the possibility that hid might not have an initialized value.
> >
>
> In the dashboard [1] shows
> BUG: KMSAN: uninit-value in dev_get_drvdata include/linux/device.h:1388
> [inline]
> BUG: KMSAN: uninit-value in hid_get_drvdata include/linux/hid.h:628 [inline]
> BUG: KMSAN: uninit-value in lg4ff_set_autocenter_default+0x23a/0xa20
> drivers/hid/hid-lg4ff.c:477
> base on that I did the initialization the pointer in the patch.
>
> > Here you are changing the initialized values of value, entry and
> > drv_data, all 3 are never used before their first assignment.
> >
> > I have a feeling this particular syzbot check has already been fixed
> > upstream by d9d4b1e46d95 "HID: Fix assumption that devices have
> > inputs".
> >
>
> I think the commit d9d4b1 fixed this report [2] by syzbot.
>
> [1] https://syzkaller.appspot.com/bug?extid=1234691fec1b8ceba8b1
> [2] https://syzkaller.appspot.com/bug?extid=403741a091bf41d4ae79

As you can see in my long discussion with syzbot today, d9d4b1 also
fixed that one.

https://groups.google.com/forum/#!msg/syzkaller-bugs/ApnMLW6sfKE/Qq0bIHGEAQAJ

Cheers,
Benjamin

>
> regards,
> Phong.
> > Cheers,
> > Benjamin
> >
> >>
> >> Signed-off-by: Phong Tran <tranmanphong@gmail.com>
> >> ---
> >>   drivers/hid/hid-lg4ff.c | 6 +++---
> >>   1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/hid/hid-lg4ff.c b/drivers/hid/hid-lg4ff.c
> >> index 5e6a0cef2a06..44dfd08b0c32 100644
> >> --- a/drivers/hid/hid-lg4ff.c
> >> +++ b/drivers/hid/hid-lg4ff.c
> >> @@ -468,10 +468,10 @@ static int lg4ff_play(struct input_dev *dev, void *data, struct ff_effect *effec
> >>   static void lg4ff_set_autocenter_default(struct input_dev *dev, u16 magnitude)
> >>   {
> >>          struct hid_device *hid = input_get_drvdata(dev);
> >> -       s32 *value;
> >> +       s32 *value = NULL;
> >>          u32 expand_a, expand_b;
> >> -       struct lg4ff_device_entry *entry;
> >> -       struct lg_drv_data *drv_data;
> >> +       struct lg4ff_device_entry *entry = NULL;
> >> +       struct lg_drv_data *drv_data = NULL;
> >>          unsigned long flags;
> >>
> >>          drv_data = hid_get_drvdata(hid);
> >> --
> >> 2.20.1
> >>
> >
>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
