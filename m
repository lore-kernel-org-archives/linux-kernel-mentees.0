Return-Path: <SRS0=WnLp=AM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC293C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 13:07:30 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75DB620772
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 13:07:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPLWvNg7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75DB620772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 50D012F936;
	Wed,  1 Jul 2020 13:07:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tjHdWai0Cib2; Wed,  1 Jul 2020 13:07:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 59DA22F7B2;
	Wed,  1 Jul 2020 13:07:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E805C0865;
	Wed,  1 Jul 2020 13:07:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0633C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 13:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DE80E8AA69
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 13:07:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kvW1dyeXgimv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 13:07:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B71268AA66
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 13:07:24 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id m25so13215896vsp.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 01 Jul 2020 06:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9kY42uCxSEDlX3revzJlre4DMiKVmK9aSIfC5G3GPgA=;
 b=IPLWvNg7xB9YDM41H4ZIbj7pUqpJxUUf6bQlgAewZm6nplKA41D08FBB6ZmVpl00hv
 1h+98jspt/qOxgN/IOGAdiraQORCgx6+eTXMLcvsObveq6YxaLQzGRoIS1+gYz+g3ypJ
 egzNj6LteW7RypdcXqYLo83H8hljw7imwE/Io8SDLj0yzw59kpbmu3IGNJTE+N8ytWzQ
 QtDFmf6AVvM9xZHYGHbPZcjBT4xcpppoTf9uDSfzW2g3le6OMvaIfFVsb/StEGLeHV19
 PlOpVAr035HOKZb/Ey9XbFG56mgoNFl7iwrDna4FbkGdQDP/0Ps8pAzUAo/8wqzfFack
 Xq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9kY42uCxSEDlX3revzJlre4DMiKVmK9aSIfC5G3GPgA=;
 b=SpVqDh+QzeSr3mfsb+T/QXk+dAhWcp0zW9A3P5KHsvAMFoA3LXhinoPcmq5gsK7uhf
 lLcHSKjwjr+sBouB2iRElfdb/ictC6jimSKXNBBo8yqlAO917eobLX6AYYrqefOKCL9T
 Ix1uLIG13NpifB+J1LFahzouLX+H7iJ9i1EjpwbIYEi0aRszwgtXZYeLYEloKfcOwBDP
 whFZvKLkEQ2x5CsUkIxpLbv4uYfOU0VrSNafIFcvP9BOBEkEP9cpUra7/1kfVeEvFZg0
 V21Xk/v0kX0gc4jOU9F2rVUz45O0HkKZ4ZPtm2z1eG+yC5/CnYJ517vc9BncqDillkD7
 Zp/A==
X-Gm-Message-State: AOAM530zpDpoKgQkJrsMbcZ2/4YYnnBqNPhnGw+gHmGgppgNCxL5QCPc
 6tYNURxUWqTw8Feoqf/PtqSzLEbFi0dTrdOR/7A=
X-Google-Smtp-Source: ABdhPJyjFR0M9l39zpGcHnZCjLQxaJLckOeJB2AHY8OMZvl0LFDxshpp3vzcWIusjEU3RwjC/7CX1ccvr+3v8bFzROg=
X-Received: by 2002:a67:1d02:: with SMTP id d2mr3728739vsd.138.1593608843614; 
 Wed, 01 Jul 2020 06:07:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200701125938.639447-1-vaibhavgupta40@gmail.com>
In-Reply-To: <20200701125938.639447-1-vaibhavgupta40@gmail.com>
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Date: Wed, 1 Jul 2020 18:35:45 +0530
Message-ID: <CAP+cEOM5D3TZhysX=nrwJzSC6MLF1u7yVu6RqZJ3hGc3V=_5=g@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 David Dillow <dave@thedillows.org>, Ion Badulescu <ionut@badula.org>, 
 Netanel Belgazal <netanel@amazon.com>, Arthur Kiyanovski <akiyano@amazon.com>,
 Guy Tzalik <gtzalik@amazon.com>, 
 Saeed Bishara <saeedb@amazon.com>, Zorik Machulsky <zorik@amazon.com>, 
 Derek Chickles <dchickles@marvell.com>, Satanand Burla <sburla@marvell.com>, 
 Felix Manlunas <fmanlunas@marvell.com>, Denis Kirjanov <kda@linux-powerpc.org>,
 Ajit Khaparde <ajit.khaparde@broadcom.com>, 
 Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, 
 Somnath Kotur <somnath.kotur@broadcom.com>, Tariq Toukan <tariqt@mellanox.com>,
 Jon Mason <jdmason@kudzu.us>
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1 00/11] net: ethernet: use
	generic power management
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

On Wed, Jul 1, 2020 at 6:31 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
>
> Linux Kernel Mentee: Remove Legacy Power Management.
>
> The purpose of this patch series is to remove legacy power management callbacks
> from amd ethernet drivers.
s/amd/net
--Vaibhav Gupta
>
> The callbacks performing suspend() and resume() operations are still calling
> pci_save_state(), pci_set_power_state(), etc. and handling the power management
> themselves, which is not recommended.
>
> The conversion requires the removal of the those function calls and change the
> callback definition accordingly and make use of dev_pm_ops structure.
>
> All patches are compile-tested only.
>
> Vaibhav Gupta (11):
>   typhoon: use generic power management
>   ne2k-pci: use generic power management
>   starfire: use generic power management
>   ena_netdev: use generic power management
>   liquidio: use generic power management
>   sundance: use generic power management
>   benet: use generic power management
>   mlx4: use generic power management
>   ksz884x: use generic power management
>   vxge: use generic power management
>   natsemi: use generic power management
>
>  drivers/net/ethernet/3com/typhoon.c           | 53 +++++++++++--------
>  drivers/net/ethernet/8390/ne2k-pci.c          | 29 +++-------
>  drivers/net/ethernet/adaptec/starfire.c       | 23 +++-----
>  drivers/net/ethernet/amazon/ena/ena_netdev.c  | 21 +++-----
>  .../net/ethernet/cavium/liquidio/lio_main.c   | 31 ++---------
>  drivers/net/ethernet/dlink/sundance.c         | 27 +++-------
>  drivers/net/ethernet/emulex/benet/be_main.c   | 22 +++-----
>  drivers/net/ethernet/mellanox/mlx4/main.c     | 11 ++--
>  drivers/net/ethernet/micrel/ksz884x.c         | 25 ++++-----
>  drivers/net/ethernet/natsemi/natsemi.c        | 26 +++------
>  .../net/ethernet/neterion/vxge/vxge-main.c    | 14 ++---
>  11 files changed, 100 insertions(+), 182 deletions(-)
>
> --
> 2.27.0
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
