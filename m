Return-Path: <SRS0=ILBb=BO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F38C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  4 Aug 2020 21:28:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7544E20842
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  4 Aug 2020 21:28:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eN5rCaEl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7544E20842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 162AE84799;
	Tue,  4 Aug 2020 21:28:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xm8-2CF7dg2c; Tue,  4 Aug 2020 21:28:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 076A18458E;
	Tue,  4 Aug 2020 21:28:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 005F7C0050;
	Tue,  4 Aug 2020 21:28:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05DAFC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 21:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C395520433
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 21:28:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IjO0wIbxRR4p
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 21:28:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 67C3D1FD21
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 21:28:40 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id c16so23739270ils.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 04 Aug 2020 14:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ciaZt6EUILZyIz2M0YERVxMKuRp4SLQkkYv0ULi+inU=;
 b=eN5rCaEl1qMzAhoNDilXB5ze5enUX9BcHPQHnaY/TMxXvCxeMm1MUisX+SGPuU0vFI
 CIeeNKvHPIt5EdHRwi2BH0hH7I+b8oHLI4SuYcg0lwTJRLTm4IZl16PE0I5Yh4fmUs9G
 tmYhAK2BrAj9BIU+RHeEryqpwDrWLh3hOFv1MjSmZk1YY5i7pH3Z5oxhnWXpBr/lfe41
 hOoFdp8Eu3PFtk1b0rlLnHj0ycv80EGegnQ8BkSzVLDP9RrqykOvQY09skxsyaIHLYiY
 zOz74gPopuR6dnJ6Z//C7xoi8+NYqcgJWWolhzRefJNne/btdmnOsLyQzl3WsBgjdqf8
 /Y/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ciaZt6EUILZyIz2M0YERVxMKuRp4SLQkkYv0ULi+inU=;
 b=dK6V/L6aFO5VvI+9kGw/kUsE8fYya/i3iou4yCwzDoDOjgHozBzdAZOpyWgfSeC7wk
 j31IBR/bLKxgzvhGQAtatyKrGhB9RDrynmu50nS6HRvxoygHpHARLsIg0pyTW9tcwh2C
 eCWIXYC7TzEKoB/MHQcyxQPPiilPkvHwobSvBm4Erd5AcnHwI2e7dWvnCS2AuXY5g+57
 MjmssdY/tg1lakzK5S0BAiEZ0LyPrzO2d5vLxD9WGzv7q72l3dqU2IbgFPyAjUpy5uyY
 0ZQ9d3Mwt/bic4hnNJaX3sp13LX7PDZ9c6yy/vc4qgu63hSMCFHtGsDlk78wz2TEZuhY
 vuAg==
X-Gm-Message-State: AOAM533KeYtif6dR1mEpfn4nJED8g/l/k/ByquraZROHJ0XN5zkxDIEW
 /H+SWdGWGyH/UGb0u8RZ+MOhEYfD6wQQfV6BU6g=
X-Google-Smtp-Source: ABdhPJyOUlBXAgb/u6T90sJc4Ntbg8WLxywWFpuKjtfpKmPNerVARBP3L8KPF1FRXNN6ilgFF2m96jZ3uNYxbrPL6ko=
X-Received: by 2002:a92:9116:: with SMTP id t22mr417064ild.305.1596576519697; 
 Tue, 04 Aug 2020 14:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200707171515.110818-1-izabela.bakollari@gmail.com>
 <20200804160908.46193-1-izabela.bakollari@gmail.com>
In-Reply-To: <20200804160908.46193-1-izabela.bakollari@gmail.com>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Tue, 4 Aug 2020 14:28:28 -0700
Message-ID: <CAM_iQpV-AfX_=o0=ZhU2QzV_pmyWs8RKV0yyMuxFgwFAPwpnXw@mail.gmail.com>
To: izabela.bakollari@gmail.com
Cc: Neil Horman <nhorman@tuxdriver.com>,
 Linux Kernel Network Developers <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 David Miller <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCHv2 net-next] dropwatch: Support
	monitoring of dropped frames
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

On Tue, Aug 4, 2020 at 9:14 AM <izabela.bakollari@gmail.com> wrote:
>
> From: Izabela Bakollari <izabela.bakollari@gmail.com>
>
> Dropwatch is a utility that monitors dropped frames by having userspace
> record them over the dropwatch protocol over a file. This augument
> allows live monitoring of dropped frames using tools like tcpdump.
>
> With this feature, dropwatch allows two additional commands (start and
> stop interface) which allows the assignment of a net_device to the
> dropwatch protocol. When assinged, dropwatch will clone dropped frames,
> and receive them on the assigned interface, allowing tools like tcpdump
> to monitor for them.
>
> With this feature, create a dummy ethernet interface (ip link add dev
> dummy0 type dummy), assign it to the dropwatch kernel subsystem, by using
> these new commands, and then monitor dropped frames in real time by
> running tcpdump -i dummy0.

drop monitor is already able to send dropped packets to user-space,
and wireshark already catches up with this feature:

https://code.wireshark.org/review/gitweb?p=wireshark.git;a=commitdiff;h=a94a860c0644ec3b8a129fd243674a2e376ce1c8

So what you propose here seems pretty much a duplicate?

Thanks.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
