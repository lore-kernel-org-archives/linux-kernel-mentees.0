Return-Path: <SRS0=U0Lt=CN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B339DC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Sep 2020 08:17:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75DC7206C9
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Sep 2020 08:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75DC7206C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 366D82E191;
	Fri,  4 Sep 2020 08:17:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6T0emZ0HAuno; Fri,  4 Sep 2020 08:17:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D214B2E190;
	Fri,  4 Sep 2020 08:17:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B7F06C07FF;
	Fri,  4 Sep 2020 08:17:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA6CBC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Sep 2020 08:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D98278748D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Sep 2020 08:17:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WXvzPR5HhCIe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Sep 2020 08:17:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1ECB1874F1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Sep 2020 08:17:06 +0000 (UTC)
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-aXVWeS9kMK-Fwa7NrahMMw-1; Fri, 04 Sep 2020 04:17:03 -0400
X-MC-Unique: aXVWeS9kMK-Fwa7NrahMMw-1
Received: by mail-pg1-f198.google.com with SMTP id z4so3252837pgv.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Sep 2020 01:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A7PJpPwsMtzBefMR1CLruzb/xgu5bpsDYQYJhcYPypU=;
 b=ONaxld2VOQFDlu1Z06TJ//aNeo6TjpMAdgHb98PRFQjjI1vwYbVE/J2C88WNDJUPdV
 tyo25RVhxziSS4lfM3k7khZEgOIVRC2ggz2sTSaZZqhDFrOWUzoNzDIu+k32rh21Azgr
 S3hmMRWb+sHXEb51ghlZuXLQUuKW/ceVIkaM3K+pEEcWtS7Tlz1T7pNkiSR5Q0p4Nqj2
 Ohy8/0JfSqY162n24kYW543QD9b0Oz0CLDbkDvDomdx6zRFJB8KzC7T0x9WXsqugn3IC
 t2FWr5v86vRMNX0sKIZi5xOhgQXtTIhmQPH7xx62skTSt5R47S/te+Rjy2BZJxuRszU/
 qsAQ==
X-Gm-Message-State: AOAM530edaIuiyY2/g1kyj0CeIIcvAmNtKykZ9fH6kLmkMRJZEKcLZtm
 F5xSUEvQEWOumGvwbEzKyZkzEOWadHzYQSI4pP+qGubfXdQRXcqIdogiBt4JtW7xsdiMDRwNcjx
 9wULeax5LurMwOW7hD8cSlUF5NGlHeCNZE3WAjSXp7780oZPHIS1JbYXdB0u4ixcF
X-Received: by 2002:a62:d456:0:b029:13c:1611:66c2 with SMTP id
 u22-20020a62d4560000b029013c161166c2mr5630510pfl.13.1599207422481; 
 Fri, 04 Sep 2020 01:17:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPSOGzY4hDYW8kAPmNPd3DYQ6NQ29GYTwuJV+5YB+XTVEKct/9nkHpz7EwlAGV00TYhYyFXjmr21j/frdgRcY=
X-Received: by 2002:a62:d456:0:b029:13c:1611:66c2 with SMTP id
 u22-20020a62d4560000b029013c161166c2mr5630491pfl.13.1599207422196; Fri, 04
 Sep 2020 01:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200811091445.erp2b23xmx3ceyzp@Rk>
In-Reply-To: <20200811091445.erp2b23xmx3ceyzp@Rk>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Fri, 4 Sep 2020 10:16:51 +0200
Message-ID: <CAO-hwJ+3LTUviWxDGQoXaBO-USwP4n6LRscJEzHJShqBEJ3oBg@mail.gmail.com>
To: Coiby Xu <coiby.xu@gmail.com>
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Cc: Jiri Kosina <jikos@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] Advice on fixing the bug of MSFT0001:00
 04F3:Touchpad being handled by hid_multitouch by mistake
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

Hi,

On Tue, Aug 11, 2020 at 11:15 AM Coiby Xu <coiby.xu@gmail.com> wrote:
>
> Hi,
>
> I'm working on a touchpad device issue as reported on
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1887190.
>
> This touchpad device MSFT0001:00 04F3:Touchpad should be handled by
> hid_rmi. But currently hid-core.c chooses hid_multitouch by mistake,
>
>      1. When scanning this device's report descriptor, HID_DG_CONTACTID
>         usage is found. Thus group HID_GROUP_MULTITOUCH is assigned to
>         the device.
>      2. The flag HID_SCAN_FLAG_MT_WIN_8 is also found. Thus group
>         HID_GROUP_MULTITOUCH_WIN_8 is assigned to the device.
>      3. hid-multitouch.c claims handling devices with the group of
>         HID_GROUP_MULTITOUCH_WIN_8
>
>          static const struct hid_device_id mt_devices[] = {
>                 /* Generic MT device */
>                 { HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH, HID_ANY_ID, HID_ANY_ID) },
>
>                 /* Generic Win 8 certified MT device */
>                 {  .driver_data = MT_CLS_WIN_8,
>                         HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH_WIN_8,
>                                 HID_ANY_ID, HID_ANY_ID) },
>                 { }
>          };
>
> There are several potential solutions,
>      - Let the device vendor fix this problem since this device's report
>        descriptor shouldn't have the HID_DG_CONTACTID usage.
>      - Make it a special case by setting the device's group to
>        HID_GROUP_RMI in hid_scan_report when vendor id and product ID
>        are matched.
>      - hid-quirks.c seems to be designed to handle special cases, is it
>        suitable for this case?

AFAIU, the touchpad doesn't work at all with hid-multitouch. So I
guess the best is to add the VID/PID to hid-quirks.c in
hid_have_special_driver[], and add it to the hid-rmi driver too.
This way, you will ensure hid-rmi will pick up the device all the time.

Cheers,
Benjamin

>
> Can anyone give an advice on which direction I should take? Thank you!
>
> --
> Best regards,
> Coiby
>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
