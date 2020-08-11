Return-Path: <SRS0=BcdZ=BV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771AEC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Aug 2020 09:14:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3412D20772
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Aug 2020 09:14:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ox3gkoZt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3412D20772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D55EB85D61;
	Tue, 11 Aug 2020 09:14:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3CjG3g3bVUv6; Tue, 11 Aug 2020 09:14:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6CC2D85D48;
	Tue, 11 Aug 2020 09:14:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60137C013C;
	Tue, 11 Aug 2020 09:14:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5BF0DC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 09:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3F2E32040E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 09:14:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gqtrQlG0Y6wF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 09:14:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by silver.osuosl.org (Postfix) with ESMTPS id D5B54203B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 09:14:53 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id o13so6429434pgf.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 02:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
 bh=Q9F9+Rb1CaCq0SUanAE3bPlZu5UOFvtgn0DMfNsZSWA=;
 b=ox3gkoZtIzuaSEHMjt6KTlmULdhixFh9jG32MGrz1ypheXywLl16Bv3LhSF9vkqKa2
 1bzQgx4AIwCWRPvoAYJlZbbi9inLnJqAe6aNipqHzGqbczzIrq8e1LvmEOJiqZLmT3Bd
 GHCH/GUyV4/DT7HBsOc7MAUGwAlW/NQBtqQ0xXt5jvi6LmenYCsnCEXkI1UYWnZdR4KG
 h5bT7Vy3pKE+sqAMfIwT7BgmtH8F6NJ28HWePVKqcbAhyPB8tGhwXOuQ7RoT4E8AOKl+
 aM/btmnr3ZCKGoAzE5+tKOCCnWTKxOpV4sMQ/KkQ1FODvQk180WnX1iGbEkojtRNN8Ra
 7XqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=Q9F9+Rb1CaCq0SUanAE3bPlZu5UOFvtgn0DMfNsZSWA=;
 b=M08lB0kMXjX1XiPnKVJJqxzs1+SaaDYSCToPTIwgBAafIWuptW1LA3Ee6Y9lP7xsjy
 3iBwoWRxynlldkoupRieM9J3DcajS6DyNgXGShfxP7sGVpDKH+4NIbwWA3Bp8UAeJOZR
 L5ATS8NDOlPEOgQl/QsvtIxzW5cdbl0wiuPbuPbeFU0QpZdZXNv393Po7MuADbvtoD66
 dlLM0PAFAoOUvhEDdoUqA0nI8uAyPQXm6ZpciwDxYfSxM/FV8HFCCgabl5LAk3Aee1UU
 w5jdOq7EsbLvtVuVzsYQkZp3slMo6Potc4DmbaCOUPeFn9A0Py8kOT6yZAv0mi64uNOl
 0zSA==
X-Gm-Message-State: AOAM530DswY++5T+T6R5I9MkYB/GBChQ7E/pOmbqC9a8gty7//QaGTAm
 uVtaW8heyeODJzowKa9RuDY=
X-Google-Smtp-Source: ABdhPJwfu6T8OJjO5efjguESbBGEqhczsOHXcDkrpKMwge0Ozv65vI1sgHYrAxaB8YicOrTbfwlRsg==
X-Received: by 2002:a63:220a:: with SMTP id i10mr82838pgi.88.1597137293410;
 Tue, 11 Aug 2020 02:14:53 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id d81sm25096483pfd.174.2020.08.11.02.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 02:14:52 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Tue, 11 Aug 2020 17:14:45 +0800
To: linux-input@vger.kernel.org
Message-ID: <20200811091445.erp2b23xmx3ceyzp@Rk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Jiri Kosina <jikos@kernel.org>, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] Advice on fixing the bug of MSFT0001:00
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

Hi,

I'm working on a touchpad device issue as reported on
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1887190.

This touchpad device MSFT0001:00 04F3:Touchpad should be handled by
hid_rmi. But currently hid-core.c chooses hid_multitouch by mistake,

     1. When scanning this device's report descriptor, HID_DG_CONTACTID
        usage is found. Thus group HID_GROUP_MULTITOUCH is assigned to
        the device.
     2. The flag HID_SCAN_FLAG_MT_WIN_8 is also found. Thus group
        HID_GROUP_MULTITOUCH_WIN_8 is assigned to the device.
     3. hid-multitouch.c claims handling devices with the group of
        HID_GROUP_MULTITOUCH_WIN_8

         static const struct hid_device_id mt_devices[] = {
	        /* Generic MT device */
	        { HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH, HID_ANY_ID, HID_ANY_ID) },

	        /* Generic Win 8 certified MT device */
	        {  .driver_data = MT_CLS_WIN_8,
		        HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH_WIN_8,
			        HID_ANY_ID, HID_ANY_ID) },
	        { }
         };

There are several potential solutions,
     - Let the device vendor fix this problem since this device's report
       descriptor shouldn't have the HID_DG_CONTACTID usage.
     - Make it a special case by setting the device's group to
       HID_GROUP_RMI in hid_scan_report when vendor id and product ID
       are matched.
     - hid-quirks.c seems to be designed to handle special cases, is it
       suitable for this case?

Can anyone give an advice on which direction I should take? Thank you!

--
Best regards,
Coiby
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
