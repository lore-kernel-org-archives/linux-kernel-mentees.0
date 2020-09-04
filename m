Return-Path: <SRS0=U0Lt=CN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E95BC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Sep 2020 16:48:04 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EC902064E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Sep 2020 16:48:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ms2vVqMx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EC902064E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D060A86EC0;
	Fri,  4 Sep 2020 16:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g57MmFZ96o3i; Fri,  4 Sep 2020 16:48:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 158CD86E1C;
	Fri,  4 Sep 2020 16:48:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2CB7C07FF;
	Fri,  4 Sep 2020 16:48:02 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61E7BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Sep 2020 16:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4F57686EBA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Sep 2020 16:48:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LSjulSW7A-dY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Sep 2020 16:48:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 01FC186E1C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Sep 2020 16:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599238079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PJ4hSEKWKSTrxjSP7x9HCXuDYemLPEO7rW3O3QQ6gNo=;
 b=Ms2vVqMxgYaZHFh4TGi1iU3r+lRwHkgQnU2faqV06vNrrPswgZrd+6wfXI4H9sYlzxWRKW
 JGyi8xzkbahQ1K8qH4kNvZ0HQarf+kPg9tzUmuoM2X3X99/EoYiFkQFP2Bm9SIzpsBb5IK
 qDosDQ+QOHGO6YJMcCzYT7PCNudyaL0=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-PgLF3ZWfPxi0xzeEeL6M4A-1; Fri, 04 Sep 2020 12:47:54 -0400
X-MC-Unique: PgLF3ZWfPxi0xzeEeL6M4A-1
Received: by mail-pf1-f198.google.com with SMTP id c197so4168847pfb.23
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Sep 2020 09:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PJ4hSEKWKSTrxjSP7x9HCXuDYemLPEO7rW3O3QQ6gNo=;
 b=CNaL5GYNGbQAssFMVscqT3qYW+uzKmCgVhSNP2lyQiGpErK7wUOJmuYmoNmm3mqjd8
 5qXt61mILSGeUjPSQEKtkL0Cp2LXHgE//oo6RYt205lwARXQFCpESSP8SaovF/bwSRMf
 TtGW0N3A9Y0Rt5IOOeR4yAKiKqBTZ6gmhwfT69e4xWsJiaqESQ6LpZ8jIR3J6gW0xTtI
 nwARilomv7O7KqNilWqOesKAQ89zoj4f4P8mzc2Mw+UnzR9gSW1rg0Z2cy/P1f7VAWWO
 32pCUzwmExwcftZ4xl8mnviYxS+F4RpKpayU8fyX9WjUgiozGqpJNin1asF/7H5zhfG8
 FDtg==
X-Gm-Message-State: AOAM5328M7k8UaHfilgNrxbtlhPsir+WOfbxqLSw2OsZjDsxut7umwAv
 8EIfAMQ8c3WhPcUtBVcOW8vX5ir1B/Y7aVpcgwf3wrvGQdVoK7cCcgE/KXjP631lIXTCgL6Gg4i
 GtRf/WcTokw9EgnQRMGtBynfLadpcKHsIMGKDRGNqr+cdZcz1LNL5u65FsdbuL3Xz
X-Received: by 2002:a63:42:: with SMTP id 63mr1715315pga.419.1599238073671;
 Fri, 04 Sep 2020 09:47:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZx7/tsrodaThOaKdQwDjWvk+9amCWwGSoO/9TeDKrT3cHH1VCT4WCkdP9A6+QouFvnfW+rldoDYFQSc3b8Hg=
X-Received: by 2002:a63:42:: with SMTP id 63mr1715295pga.419.1599238073319;
 Fri, 04 Sep 2020 09:47:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200811091445.erp2b23xmx3ceyzp@Rk>
 <CAO-hwJ+3LTUviWxDGQoXaBO-USwP4n6LRscJEzHJShqBEJ3oBg@mail.gmail.com>
 <20200904145916.nighviqyrvbm2ybx@Rk>
In-Reply-To: <20200904145916.nighviqyrvbm2ybx@Rk>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Fri, 4 Sep 2020 18:47:42 +0200
Message-ID: <CAO-hwJJAOGNVnu1_dwXTMUyoSsNQifGFDUV6e9g96wHKmaZqSA@mail.gmail.com>
To: Coiby Xu <coiby.xu@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=btissoir@redhat.com
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

On Fri, Sep 4, 2020 at 4:59 PM Coiby Xu <coiby.xu@gmail.com> wrote:
>
> On Fri, Sep 04, 2020 at 10:16:51AM +0200, Benjamin Tissoires wrote:
> >Hi,
> >
> >On Tue, Aug 11, 2020 at 11:15 AM Coiby Xu <coiby.xu@gmail.com> wrote:
> >>
> >> Hi,
> >>
> >> I'm working on a touchpad device issue as reported on
> >> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1887190.
> >>
> >> This touchpad device MSFT0001:00 04F3:Touchpad should be handled by
> >> hid_rmi. But currently hid-core.c chooses hid_multitouch by mistake,
> >>
> >>      1. When scanning this device's report descriptor, HID_DG_CONTACTID
> >>         usage is found. Thus group HID_GROUP_MULTITOUCH is assigned to
> >>         the device.
> >>      2. The flag HID_SCAN_FLAG_MT_WIN_8 is also found. Thus group
> >>         HID_GROUP_MULTITOUCH_WIN_8 is assigned to the device.
> >>      3. hid-multitouch.c claims handling devices with the group of
> >>         HID_GROUP_MULTITOUCH_WIN_8
> >>
> >>          static const struct hid_device_id mt_devices[] = {
> >>                 /* Generic MT device */
> >>                 { HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH, HID_ANY_ID, HID_ANY_ID) },
> >>
> >>                 /* Generic Win 8 certified MT device */
> >>                 {  .driver_data = MT_CLS_WIN_8,
> >>                         HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH_WIN_8,
> >>                                 HID_ANY_ID, HID_ANY_ID) },
> >>                 { }
> >>          };
> >>
> >> There are several potential solutions,
> >>      - Let the device vendor fix this problem since this device's report
> >>        descriptor shouldn't have the HID_DG_CONTACTID usage.
> >>      - Make it a special case by setting the device's group to
> >>        HID_GROUP_RMI in hid_scan_report when vendor id and product ID
> >>        are matched.
> >>      - hid-quirks.c seems to be designed to handle special cases, is it
> >>        suitable for this case?
> >
> >AFAIU, the touchpad doesn't work at all with hid-multitouch. So I
> >guess the best is to add the VID/PID to hid-quirks.c in
> >hid_have_special_driver[], and add it to the hid-rmi driver too.
> >This way, you will ensure hid-rmi will pick up the device all the time.
> >
> >Cheers,
> >Benjamin
>
> Thank you for the advice! I have exactly adopted this approach by looking
> at commit e9287099ba6539bccb20cd791269186f3ae28b85
> ("HID: rmi: Add support for the touchpad in the Razer Blade 14 laptop")
> as an example.
>
> My previous email is a bit misleading because 0x04F3 is the vendor code
> of ELAN while hid-rmi is for the Synaptics touchpad. And actually this
> laptop model of Lenovo Legion-5 15ARH05 is shipped with both kinds of
> touchpads,
>
> - for the Synaptics touchpad, hid-rmi could almost handle it perfectly
>    except the clicking is not sensitive enough. I need to let my finger
>    linger on the touchpad for a while. I notice when I click on the touchpad,
>    an HID report would be received by hid-recorder. But evtest couldn't receive
>    any EV_ event. If hid-multitouch is handling the device, the cursor
>    won't move but 2-4 finger touching events could still be received by
>    evtest.
>
> - for the ELAN touchpad, only HID reporters can be read and parsed by
>    hid-core then two input devices (mouse and touchpad) could created by
>    hid-multitouch as seen from /proc/bus/input/devices. But hid-recorder
>    could never get any HID report.

huh. So in both cases you have a buggy touchpad with hid-multitouch :(

Do both touchpads share the same VID/PID? If so, this is going to be
interesting to decide how any of those touchpad should be handled.

>
> AFAIU, isn't hid-multitouch supposed to be the implementation of Windows
> Precision Touchpad?

yes, it works for most of those. The only ones that are not working
are usually because OEM or device makers tend to do "fun" things.

>  And since Precision touchpad is mandatory for
> Windows 10 notebooks and this laptop model of Lenovo Legion-5 15ARH05
> seem to have been certificated by Windows 10, does it mean by theory
> hid-multiouch could handle these two touchpad devices?

Well, it should, yes, but it clearly can not. You can try to give a
try at hid-recorder from
https://gitlab.freedesktop.org/libevdev/hid-tools. This will show what
is actually exported by the hardware before any processing by the
kernel. Maybe there is a new simple thing to do in hid-multitouch to
handle those devices.

Also, last time I heard, Synaptics dropped the use of hid-rmi in favor
of hid-multitouch. Any hid-rmi touchpad should be able to use
hid-multitouch, as this is the preferred way on Windows. But sometimes
the various teams decide to change the rules.

>
> Anyway, it seems I need to install Windows Driver Kit to capture&analyze
> HID reports to see what's happening. Or do you have any suggestion?

Unless it changed recently (I think I have seen something like that
recently), I had to write a I2C man-in-the-middle to dump the logs
from Windows. Project is at
https://github.com/bentiss/SimplePeripheralBusProbe and requires a
little bit of manual work to be able to start capturing data :(

Cheers,
Benjamin

>
> --
> Best regards,
> Coiby
>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
