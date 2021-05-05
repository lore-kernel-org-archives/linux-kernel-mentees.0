Return-Path: <SRS0=XiGY=KA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB8D6C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 May 2021 13:47:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 447BC6101C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 May 2021 13:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 447BC6101C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB553401BD;
	Wed,  5 May 2021 13:47:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VeMCsACqS1RY; Wed,  5 May 2021 13:47:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1339E400BD;
	Wed,  5 May 2021 13:47:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1038C000E;
	Wed,  5 May 2021 13:47:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65242C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 13:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FB4183D17
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 13:47:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zdyATfLy2W-S
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 13:47:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6B9382FA9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 13:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620222469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y66UDdCQVyt6iTD3be2pNfjrnjlN1nlgdtRgR8WWsZk=;
 b=CnNWrIMCJfz1bKhXoUODGhiSg3ruuENX4mbuzZAFD4ZNTgUoIngyy0emUwWYDXBdbSQyEe
 ssjFiKUm1AYRYV4wuvt4NL3aL3czPFxt/vX5giuQyZZk17C5D8kw/IP0H/4YCIWZRg6O11
 rOvr4uB4xquw7KUfRIB1fUgRloRuCpk=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-gaIKbPApP1WyZHP_rUN_LQ-1; Wed, 05 May 2021 09:47:48 -0400
X-MC-Unique: gaIKbPApP1WyZHP_rUN_LQ-1
Received: by mail-pf1-f200.google.com with SMTP id
 a8-20020a62d4080000b029028db7db58adso1429869pfh.22
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 05 May 2021 06:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y66UDdCQVyt6iTD3be2pNfjrnjlN1nlgdtRgR8WWsZk=;
 b=dJ940PuPlJgDW8Y1UaKXiO1q7Ej4FWVJAmOnrMx7M3qS9RVw3ZiCaYWoYYUex9Rlow
 6HB65qff1PLJWjHS8+dduGMKVFQVCampgwGiPLfO6zDfxSRYyawWzs9gRgg9TLPvAWs7
 SwctrdzuUcyRMJROKJENgbCq7HiY5rQQGzmLa43xBwFcSdFgNOVC045jtbvFIYfNklf0
 9d6yqxq/A7IpyQFl7u2nMEXVjYPMT4H9K38SxK3kOSlpGxhit2J9c/MN+tqa+caC8Nen
 QaDBf0KenveUkvThnfoGGDzc+Ap9R9fkcm65cb2RF30MBk3awiLNbe3LxMHaAKlhrwCA
 Hn1g==
X-Gm-Message-State: AOAM533EoK8GnVr6xbZFFprhm29ni6DRpUkh8OZZwh0n6SqHLYnqWC0A
 2Qg7Q/Mhabe4RWPRt+wFVBacj77nUJAXbPuEdPOoGQdbMIATWS2BY2SjtnYr5XvqseRdm32984A
 g2qQEWIn1QYLMl4b2xnvptb/Jlt54FW9S+sVBW2C9kEO4/6Blj74WbLrWOaWWn8h3
X-Received: by 2002:a62:bd13:0:b029:25c:5ec4:c2f3 with SMTP id
 a19-20020a62bd130000b029025c5ec4c2f3mr28336994pff.35.1620222467039; 
 Wed, 05 May 2021 06:47:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHQnlOigptQ6V8Tb5EPxmwXRqyApalxmcQXnnohdiel63N8xCKjxPUmXIlS3n8uNtO7Mq3xZvHCoCynHhq2LY=
X-Received: by 2002:a62:bd13:0:b029:25c:5ec4:c2f3 with SMTP id
 a19-20020a62bd130000b029025c5ec4c2f3mr28336975pff.35.1620222466853; Wed, 05
 May 2021 06:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210425173353.10231-1-mail@anirudhrb.com>
 <nycvar.YFH.7.76.2105051442120.28378@cbobk.fhfr.pm>
 <CAO-hwJJ4u5NZ-81Tq3PGu-F9r3iUSCiKp=JUsTfuVsyd-Sxsew@mail.gmail.com>
 <nycvar.YFH.7.76.2105051528090.28378@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2105051528090.28378@cbobk.fhfr.pm>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Wed, 5 May 2021 15:47:36 +0200
Message-ID: <CAO-hwJJKyLT4iG4DEhXGREPLVU8UASB8_gOFULmQ7hx2dYG7uw@mail.gmail.com>
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

On Wed, May 5, 2021 at 3:28 PM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Wed, 5 May 2021, Benjamin Tissoires wrote:
>
> > I don't have a reproducer like syzbot has for the exact bug here, as I
> > am relying on one real USB device to check if usbhid is not too broken.
> > However, the test suite should catch if there is an error implied by the
> > hid_report_len() change.
>
> Yes, that was exactly what I wanted to check, sorry for not being verbose
> enough :)
>
> > Anyway, I manually started the job and will report when it is done.
>

Heh, no problems.

"Job succeeded" \o/

Given that you are on a spree:
Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Cheers,
Benjamin

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
