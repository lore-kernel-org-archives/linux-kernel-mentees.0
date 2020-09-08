Return-Path: <SRS0=zeZA=CR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B90C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 07:16:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E35D7218AC
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 07:16:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Luxp1qsd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E35D7218AC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9365D8651A;
	Tue,  8 Sep 2020 07:16:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CciaIePdKPb8; Tue,  8 Sep 2020 07:16:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 57C2D86505;
	Tue,  8 Sep 2020 07:16:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38F28C0859;
	Tue,  8 Sep 2020 07:16:45 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A534AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 07:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7A4F0203DF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 07:16:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AXB87M-jksaZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 07:16:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 0EBFC2001D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 07:16:42 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id g72so14389798qke.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 08 Sep 2020 00:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kUrEoA0k7mqYajiM+xG7wldLM3jtnc5+BJBwoi/AXYk=;
 b=Luxp1qsd+Mwy40umGQW3kYLm4cd6nRd11mKATurrXS+Mwb9I2gmPgFwmDExtLcXfjs
 Yo7VbRXDPAw6F4NlZR9zfWg5Pa22IhhytlUzvp6izRxZ4Gf+BPFcMMwxi7q4050nadf8
 P81sJSUJsAcTOVMO5LM3SC94oG3muLwHZnnXV4JoPfCJuPB+0X4H2qzj1lgR5cwRfkpG
 kOJxlp3+zwOuq30nUXfviZe09bG2WV/JeYyuXGmf2PUmc3JQkTU+Kytyn8XOwwcMlkKM
 FnJVoW/RGu0cJo7h/0XbG/plBRFWUaWsmFGSq9FdmKPumHDgcfZtbPLYXg/2+Lp4Vo8v
 F1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kUrEoA0k7mqYajiM+xG7wldLM3jtnc5+BJBwoi/AXYk=;
 b=ci8T/GQr6/MZXN95BB7syykEqL8AWqMf82RtPU2Nm8hgAzpFjHBaxJzUZOhSdInPf6
 wZNhwJYvdViWWhsxQMzP6LuoKsYFQscwv2xmtT+tWdK0/2k3CRKeXt62S7j0AAF2rRpW
 TdYOdMTUPksC3BHaN4apADn0oC69g9Uc+9ag4ajjbXEM7oRNuANG5ASHA6/VXHH6avcO
 YOarTCD1JMfY4tITkX8teJHPySoIgiwzjnp+V5PET65odvSLD92j8jkPTluks7Yrp2SP
 LyqIGT+QjQ9n4WLOVmU0W96Y3QFSLUdv08XQUHpQWOGaRAGpC1nWPnKNvrbvQK0148pt
 wl2g==
X-Gm-Message-State: AOAM5309p+tS1WHzmC9OD+2tD/CGRTAjfmP83MEwofSIgTogA8+gcORr
 CJgnD3Xa0715TbOjUno5YdM5J4/1JlxR6Q7NofiGQA==
X-Google-Smtp-Source: ABdhPJz9P80UH0m0EZYa+sK173SlqQEBaACbPKOTkWoL03rPRQ9wguQrXmTkWbHHhbXlGKK7hLbZgWhHih250Xt1HDQ=
X-Received: by 2002:a37:9c4f:: with SMTP id f76mr22614529qke.250.1599549400744; 
 Tue, 08 Sep 2020 00:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200904141954.uhfxllwykxshtisu@Rk>
In-Reply-To: <20200904141954.uhfxllwykxshtisu@Rk>
Date: Tue, 8 Sep 2020 09:16:29 +0200
Message-ID: <CACT4Y+YBp3_w-ZvRbxSuvwnN0Kva_Oe9MMTVvkLfaf0D11D1dA@mail.gmail.com>
To: Coiby Xu <coiby.xu@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Andy Nguyen <theflow@google.com>
Subject: Re: [Linux-kernel-mentees] How does syzkaller manage to create
 Bluetooth connections in a VM which doesn't have a Bluetooth device
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
From: Dmitry Vyukov via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

,On Fri, Sep 4, 2020 at 4:20 PM Coiby Xu <coiby.xu@gmail.com> wrote:
>
> Hi,
>
> I have been trying to fix this issue [1] found by syzbot. I notice the
> extracted syzkaller reproducer could connect to another Bluetooth device
> successfully because l2cap_chan_connect successfully returns.
>
> // net/Bluetooth/l2cap_sock.c
> static int l2cap_sock_connect(struct socket *sock, struct sockaddr *addr,
>                               int alen, int flags)
> {
>         err = l2cap_chan_connect(chan, la.l2_psm, __le16_to_cpu(la.l2_cid),
>                                  &la.l2_bdaddr, la.l2_bdaddr_type);
> }
>
> However, if I use syz-prog2c to convert the syzkaller reproducer to a
> C reproducer, the C reproducer could never make a socket connect call
> successfully. So how does syzkaller manage to create Bluetooth connections
> for the sykaller reproducer? I've understood why this issue [1] occurs
> but haven't figured out how it occurs, i.e., what is the subtle race
> condition. So I want to write a C reproducer to experiment on it.
>
> [1] INFO: trying to register non-static key in l2cap_chan_del: https://syzkaller.appspot.com/bug?id=aca31fd1ef0cbf898bd37115e2c4c66fa37f4a20

Hi Coiby,

syzkaller uses /dev/vhci to create a virtual bluetooth device.
There should be a flag for syz-prog2c to include that code into C
reproducers as well.
However note that syzbot did not provide a C reproducer which means
that the crash was somehow not reproducible with a C reproducer (that
includes vhci initialization code and all other relevant code), so
maybe you are seeing the same effect. It would be useful to figure out
why it's not reproducible with a C repro, maybe it's some bug in
syzkaller that can be fixed.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
