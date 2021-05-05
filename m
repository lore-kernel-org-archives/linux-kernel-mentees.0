Return-Path: <SRS0=XiGY=KA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BDCC433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 May 2021 13:25:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47DD761155
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 May 2021 13:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47DD761155
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6E82405E4;
	Wed,  5 May 2021 13:25:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oStnKH_cjmA6; Wed,  5 May 2021 13:25:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6D08405AB;
	Wed,  5 May 2021 13:25:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D9B3C000E;
	Wed,  5 May 2021 13:25:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A94FDC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 13:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2EC2607DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 13:25:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Km-DqK0w5OA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 13:25:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F410760660
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 13:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620221144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/bpFsXMdn5eaqmMBwGxqc2rlRW2ISNHWpOEm7J8RdOs=;
 b=PGeUyJkGaRWKAS7pRhItsg5qKX8ZxHnk7fbJGIv3k2/YAjzCjFsm8Ta7JCpHxStb1FSMD/
 p2RhQFtB9H4jiXDHADfJcJTXwFX7VSUZZWhIAsSzP8XFa1S0Pa+XraQDHKQDQFpSSm/yHX
 R6uaUHVWxG1YhoTKBg/IZPn0iasUIlw=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-e1e5a9vjMt-jH9wfT-jR_Q-1; Wed, 05 May 2021 09:25:43 -0400
X-MC-Unique: e1e5a9vjMt-jH9wfT-jR_Q-1
Received: by mail-pj1-f71.google.com with SMTP id
 g9-20020a17090a3009b029015bd2168cc2so860088pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 05 May 2021 06:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/bpFsXMdn5eaqmMBwGxqc2rlRW2ISNHWpOEm7J8RdOs=;
 b=Z4J4cdQ9bf6iBeyJnZLk8VPB8H8ticdsBqAjbVWs3eaZgnp/5acGy7kVUeIenCOT89
 zHAcI7BtPhLD5Irt5fx6jqzl52Ojy06CPy3Ywo2DzlqwPT2yakRtGWXjZBrOZejlqf5g
 j2GTu5NzNRN0NMnwHtTCflYibUPdBqOrYVpuQhCjef2WgEETF1rJTLwgGIlmjowa1jSn
 c0+opp/IpvzkdQqf9ghA+JHZNbkGT9dMdTbTgKUOZ8P3plmO82vgmGtkNVdAhQf3OSdq
 g1ejrj0wCi1O16Y9Ie41TQjcYwXcq0jgku89ViF/Nr9VMi1JaMQmnsDuKteHaJdvfNX8
 kJWw==
X-Gm-Message-State: AOAM532/v9k5FhPJvfx8tzls3eUEGTG2Tzf6s2EHWN6GXOpaKdGfg79f
 rG81IZWCQoGuBZv/6Wzsl754/S7dj3NYjmtz5ZwPbEC+ZftPrXYmZYhS9SIANKEWMEQVLu+fbax
 HbAn+4+DaeXJv8Jksb0gDq+eLo+gNK7ZQfqOkyFQQBSjHaps9vJ8IVPy6t7P7dhcb
X-Received: by 2002:a17:90a:bb0c:: with SMTP id
 u12mr34741904pjr.234.1620221141868; 
 Wed, 05 May 2021 06:25:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynLc8AHCVwjV7sToQg82XsVT77jGKQjpRW3gOLa+Ib3v9yJLpRKhvj1Cf0JJj43ujAwhVuVWLzaINnDBAk/eU=
X-Received: by 2002:a17:90a:bb0c:: with SMTP id
 u12mr34741885pjr.234.1620221141608; 
 Wed, 05 May 2021 06:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210425173353.10231-1-mail@anirudhrb.com>
 <nycvar.YFH.7.76.2105051442120.28378@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2105051442120.28378@cbobk.fhfr.pm>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Wed, 5 May 2021 15:25:30 +0200
Message-ID: <CAO-hwJJ4u5NZ-81Tq3PGu-F9r3iUSCiKp=JUsTfuVsyd-Sxsew@mail.gmail.com>
Subject: Re: [PATCH] usbhid: fix info leak in hid_submit_ctrl
To: Jiri Kosina <jikos@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=btissoir@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 syzbot+7c2bb71996f95a82524c@syzkaller.appspotmail.com,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
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

On Wed, May 5, 2021 at 2:42 PM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Sun, 25 Apr 2021, Anirudh Rayabharam wrote:
>
> > In hid_submit_ctrl(), the way of calculating the report length doesn't
> > take into account that report->size can be zero. When running the
> > syzkaller reproducer, a report of size 0 causes hid_submit_ctrl) to
> > calculate transfer_buffer_length as 16384. When this urb is passed to
> > the usb core layer, KMSAN reports an info leak of 16384 bytes.
> >
> > To fix this, first modify hid_report_len() to account for the zero
> > report size case by using DIV_ROUND_UP for the division. Then, call it
> > from hid_submit_ctrl().
> >
> > Reported-by: syzbot+7c2bb71996f95a82524c@syzkaller.appspotmail.com
> > Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
>
> Benjamin, could you please run this one through your regression testing
> machinery before we send it upstream?
>

I don't have a reproducer like syzbot has for the exact bug here, as I
am relying on one real USB device to check if usbhid is not too
broken.
However, the test suite should catch if there is an error implied by
the hid_report_len() change.

Anyway, I manually started the job and will report when it is done.

Cheers,
Benjamin

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
