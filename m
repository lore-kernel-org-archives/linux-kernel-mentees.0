Return-Path: <SRS0=U0Lt=CN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F06D8C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Sep 2020 14:59:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1BC320770
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Sep 2020 14:59:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZ4QATl8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1BC320770
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 98DA787557;
	Fri,  4 Sep 2020 14:59:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eTGVDnD6Z9r1; Fri,  4 Sep 2020 14:59:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0D7408754D;
	Fri,  4 Sep 2020 14:59:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0055AC07FF;
	Fri,  4 Sep 2020 14:59:27 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 826FAC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Sep 2020 14:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 68C9D86DD3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Sep 2020 14:59:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bdrrCduOkk-4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Sep 2020 14:59:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4F499847F9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Sep 2020 14:59:24 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id w7so4752108pfi.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Sep 2020 07:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RjIGfgFgEk5o0dm5jk0+4T2pVa8S7/xEygznBUhbDHU=;
 b=LZ4QATl8jlIeSBGfvOQM4rPEFu1dKRtj7fqp0B0gjreTsXfqi8TxojfiHBC3PkbYpC
 cya1uHml+IftIE7y5Yxlx2JiPoU6q6/7y4KRgOhHz6YpVqj/iT/uRmgJmPxvFIxr4KFC
 PEP7/lOkOxavFZBXsycatk4nxX99IEdxCfvQ02vpzV4BMd7bOQ6r1C8ICE2sJ0rnfUnu
 j2jbuife7N1vEEJY6QJyq5nVBfhQgkDm6xxOd2Xet25inHZA/MydA+WK+Qrkwx1qQU+F
 YHr5FzfriVDcdrNNv22emBGgoWZYxRaqEINKGs/6aVoaCXL/kgqw4Q5W260jLCcIKxRP
 lIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RjIGfgFgEk5o0dm5jk0+4T2pVa8S7/xEygznBUhbDHU=;
 b=Zxen1CtM2yW2vkwucyahIrCI1q5ro6UvNXe75DKbeZC7XWMw+LYCMCj96a9J49G5AA
 WiEbhYDeM5VwqjRJJVCxN60ZFDMIbZ5TyrIkityCizpbCEDobzWdF2EZ4PkGqiBHuJOs
 US54G1imwkaSwOaSKFU+b4LXCI3Oh3CJ59EApzQNMgypyIAhL9aRoVgvrIgqQGIZXZKI
 fQyksVVw+5Peu8yZ0BiqPcucIANvirusOmaGz6uF3QIx/d/IQKR7dTR/b9Z9mgAXfbqa
 hXqd/Yz/8ZCL8rNGx6ZVQn4LBtWbL7eSIFM5fn+uSi0NbUjojnfe8mSh3sPxf9AxM3c6
 hqSg==
X-Gm-Message-State: AOAM530vhhozy/Ba4txC0D9P2b1ubf8jXDphTIpH3naKdKXT9Awm4K9T
 toAdqAznCN/KtnphlR4pkws=
X-Google-Smtp-Source: ABdhPJygMjk9Mje26xyJbQkEwLTIyLz6vFcz2EG2Pq2j/saxYq3yCV0koAhBvevlw2238+J3zd+jiQ==
X-Received: by 2002:a63:ca4e:: with SMTP id o14mr7694221pgi.213.1599231563780; 
 Fri, 04 Sep 2020 07:59:23 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id 72sm6848332pfx.79.2020.09.04.07.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 07:59:22 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Fri, 4 Sep 2020 22:59:16 +0800
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Message-ID: <20200904145916.nighviqyrvbm2ybx@Rk>
References: <20200811091445.erp2b23xmx3ceyzp@Rk>
 <CAO-hwJ+3LTUviWxDGQoXaBO-USwP4n6LRscJEzHJShqBEJ3oBg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAO-hwJ+3LTUviWxDGQoXaBO-USwP4n6LRscJEzHJShqBEJ3oBg@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, Sep 04, 2020 at 10:16:51AM +0200, Benjamin Tissoires wrote:
>Hi,
>
>On Tue, Aug 11, 2020 at 11:15 AM Coiby Xu <coiby.xu@gmail.com> wrote:
>>
>> Hi,
>>
>> I'm working on a touchpad device issue as reported on
>> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1887190.
>>
>> This touchpad device MSFT0001:00 04F3:Touchpad should be handled by
>> hid_rmi. But currently hid-core.c chooses hid_multitouch by mistake,
>>
>>      1. When scanning this device's report descriptor, HID_DG_CONTACTID
>>         usage is found. Thus group HID_GROUP_MULTITOUCH is assigned to
>>         the device.
>>      2. The flag HID_SCAN_FLAG_MT_WIN_8 is also found. Thus group
>>         HID_GROUP_MULTITOUCH_WIN_8 is assigned to the device.
>>      3. hid-multitouch.c claims handling devices with the group of
>>         HID_GROUP_MULTITOUCH_WIN_8
>>
>>          static const struct hid_device_id mt_devices[] = {
>>                 /* Generic MT device */
>>                 { HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH, HID_ANY_ID, HID_ANY_ID) },
>>
>>                 /* Generic Win 8 certified MT device */
>>                 {  .driver_data = MT_CLS_WIN_8,
>>                         HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH_WIN_8,
>>                                 HID_ANY_ID, HID_ANY_ID) },
>>                 { }
>>          };
>>
>> There are several potential solutions,
>>      - Let the device vendor fix this problem since this device's report
>>        descriptor shouldn't have the HID_DG_CONTACTID usage.
>>      - Make it a special case by setting the device's group to
>>        HID_GROUP_RMI in hid_scan_report when vendor id and product ID
>>        are matched.
>>      - hid-quirks.c seems to be designed to handle special cases, is it
>>        suitable for this case?
>
>AFAIU, the touchpad doesn't work at all with hid-multitouch. So I
>guess the best is to add the VID/PID to hid-quirks.c in
>hid_have_special_driver[], and add it to the hid-rmi driver too.
>This way, you will ensure hid-rmi will pick up the device all the time.
>
>Cheers,
>Benjamin

Thank you for the advice! I have exactly adopted this approach by looking
at commit e9287099ba6539bccb20cd791269186f3ae28b85
("HID: rmi: Add support for the touchpad in the Razer Blade 14 laptop")
as an example.

My previous email is a bit misleading because 0x04F3 is the vendor code
of ELAN while hid-rmi is for the Synaptics touchpad. And actually this
laptop model of Lenovo Legion-5 15ARH05 is shipped with both kinds of
touchpads,

- for the Synaptics touchpad, hid-rmi could almost handle it perfectly
   except the clicking is not sensitive enough. I need to let my finger
   linger on the touchpad for a while. I notice when I click on the touchpad,
   an HID report would be received by hid-recorder. But evtest couldn't receive
   any EV_ event. If hid-multitouch is handling the device, the cursor
   won't move but 2-4 finger touching events could still be received by
   evtest.

- for the ELAN touchpad, only HID reporters can be read and parsed by
   hid-core then two input devices (mouse and touchpad) could created by
   hid-multitouch as seen from /proc/bus/input/devices. But hid-recorder
   could never get any HID report.

AFAIU, isn't hid-multitouch supposed to be the implementation of Windows
Precision Touchpad? And since Precision touchpad is mandatory for
Windows 10 notebooks and this laptop model of Lenovo Legion-5 15ARH05
seem to have been certificated by Windows 10, does it mean by theory
hid-multiouch could handle these two touchpad devices?

Anyway, it seems I need to install Windows Driver Kit to capture&analyze
HID reports to see what's happening. Or do you have any suggestion?

--
Best regards,
Coiby
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
