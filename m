Return-Path: <SRS0=s3T2=MJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_RED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05E1C636C9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Jul 2021 06:35:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85468613AF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Jul 2021 06:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85468613AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E3BD8431B;
	Sat, 17 Jul 2021 06:35:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3BXSswMbppKm; Sat, 17 Jul 2021 06:35:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DE1438399B;
	Sat, 17 Jul 2021 06:35:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47EBBC0010;
	Sat, 17 Jul 2021 06:35:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76107C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 06:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B10060709
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 06:35:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J2-UUbd1_l2B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 06:35:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 88AA46060F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 06:35:43 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id r132so18536564yba.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Jul 2021 23:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kMBW++ub+lftqcyPOCmH2PbX5g2Jn+eLS1KjPuaeOw4=;
 b=rlCJiCQPahpcj5yqUebXgGgJdPSrLmn4foscyVul+bA9/zfdQILolhLBNhlXboxl/V
 4JHO63Q6uH+kZUEhnQGQKdmMv3luqmuVhT0M0/JRHKaArZDT7PuRfNMb9lNosXk/04L6
 Wb2hJyupx0MO51vPUFYyusTk3Qt3ab2yZbJT+zqWqZZwurALORewsrUa7P+yTZjG8Dxh
 BJWrqwHVYzR+rNFBc4XLn7dga2vH0yInFKs7rx1o/yN72AxfAilA4IJjRTh+RnnKHGE/
 U6u7rsktG16B/x/9Lb8YQHZHAa2tvuIMpkX50N4ty/59A14a28NC1ZgVkVeIfdi3vV4q
 mdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kMBW++ub+lftqcyPOCmH2PbX5g2Jn+eLS1KjPuaeOw4=;
 b=V3NS8trnMoJ3b0lhRz02xt6nc10ZkNraUDpOhWglhE1z9spGUfv99HQV/jQN1iyhPj
 np7MRqqHoae97sWnUSbSOAyOY0GPsZhntMtW3q0rk1ZaE3cw8nl0vy1lbDtD67DXtV95
 CMXdIJrOvEBK0cBWvB/qTQaiW8pp7sPx4bGfNbLfOrlbPPFcX73OZaK1wwlVeN40ehS3
 XhTd8Qp86xgsZ63gXO8E2HEZ/wEfo2MYdXhW7oRZeS7QLv0G8ah8plLbQiZfjzVP1bh6
 mIPJZTu0tC2CoxVxUZFL/D5A/QmXqVSbAidGs4rAvbn3Da+W7Ool5+JRcECrfBuwefhG
 n9ug==
X-Gm-Message-State: AOAM530J38T5OvopTE2P4A3bjMoYd1Lc4u6FJ3NDKAhnjy6dIIW3UPRZ
 Bblr/UV1qabcgqM1ObD5tliEoJ+lLwgVtROANT0=
X-Google-Smtp-Source: ABdhPJyF8wkABdaMAUzBxTQ80lukZTDU20pJNXKBlwfhj7/nIFmKJtj8OD9zkmMqq52NWYn50DJ8ynka7Om3iAGmti0=
X-Received: by 2002:a25:f0b:: with SMTP id 11mr17643437ybp.518.1626503742347; 
 Fri, 16 Jul 2021 23:35:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210717045910.GA4410@msi>
In-Reply-To: <20210717045910.GA4410@msi>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 17 Jul 2021 08:35:31 +0200
Message-ID: <CAKXUXMyTGFP5X2r6=oqC0N-9va5O-2FbcYfaBYzH2Lb5dmWozA@mail.gmail.com>
Subject: Re: Mining Maintainers mentorship program - mentee Selection tasks
To: Parvathy H <parvathyhiyer@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On Sat, Jul 17, 2021 at 6:59 AM Parvathy H <parvathyhiyer@gmail.com> wrote:
>
> I am interested in the Mining Maintainers mentorship program and I would like towork on the tasks for the mentee selection.
>

Thanks for your interest.

For the mentee selection, please work on the following exercise:

First, download the kernel git repository and compile the kernel with
the x86-defconfig build configuration.

There is a file called MAINTAINERS in the root directory of the git
repository. Read the introduction at the beginning of the MAINTAINERS
file and understand the content in the file and its organisation.

Explain in your words: What is stored in the MAINTAINERS file?

Now, search for specific maintainer entries; Please answer: Who are
the maintainers and reviewers of the following sections?

DMA BUFFER SHARING FRAMEWORK
DRM DRIVER FOR ARM PL111 CLCD
HARMONY SOUND DRIVER
IOC3 ETHERNET DRIVER
KASAN
KFIFO
MAILBOX API
MAN-PAGES: MANUAL PAGES FOR LINUX -- Sections 2, 3, 4, 5, and 7
SQUASHFS FILE SYSTEM
THANKO'S RAREMONO AM/FM/SW RADIO RECEIVER USB DRIVER
TIPC NETWORK LAYER

Please let me know about your answers and always send your responses
to the linux-kernel-mentees mailing list.

After that first exercise, exercises 2 and 3 will follow.


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
