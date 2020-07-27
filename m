Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0472AC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 15:36:09 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C831A2074F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 15:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C831A2074F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7A348878B5;
	Mon, 27 Jul 2020 15:36:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KwpVJb4YvUNx; Mon, 27 Jul 2020 15:36:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6D5E387985;
	Mon, 27 Jul 2020 15:36:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 588DCC0050;
	Mon, 27 Jul 2020 15:36:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6A89C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 15:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B775620466
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 15:35:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8TQPh-4nCZYv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 15:35:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by silver.osuosl.org (Postfix) with ESMTPS id 3E4E520020
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 15:35:32 +0000 (UTC)
Received: from mail-qk1-f174.google.com ([209.85.222.174]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MXp1O-1kIfID33y0-00YBpT for
 <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Jul 2020 17:35:29
 +0200
Received: by mail-qk1-f174.google.com with SMTP id l23so15647676qkk.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 08:35:29 -0700 (PDT)
X-Gm-Message-State: AOAM531D1Y4WP4/jNOxq34AErANl/YWJqQtDGTq7f1mbtTN/ywlXMjh+
 ZJKMniGiz2nTsJH4GeoOAkyqSe8/wqBg+5+4U/Y=
X-Google-Smtp-Source: ABdhPJyVQdveqzi3+Zb7UJcBadCVqyMgS/2llv9C5krFaKnCxaCdt2m5GnZ6CZHjLDH5JnzHZKBsLh1LbsXT3UyAjOs=
X-Received: by 2002:a37:b484:: with SMTP id
 d126mr23352046qkf.394.1595864128427; 
 Mon, 27 Jul 2020 08:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200727151537.315023-1-yepeilin.cs@gmail.com>
In-Reply-To: <20200727151537.315023-1-yepeilin.cs@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 27 Jul 2020 17:35:12 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3zz-xfz2jwUpEU5R7GyCK735PFQK7OjFmmTESgnSzq=Q@mail.gmail.com>
Message-ID: <CAK8P3a3zz-xfz2jwUpEU5R7GyCK735PFQK7OjFmmTESgnSzq=Q@mail.gmail.com>
To: Peilin Ye <yepeilin.cs@gmail.com>
X-Provags-ID: V03:K1:D7aonvtrsZDYzbfyXT4/UdyIVFJaeDaFEzNhuLCdJwnCSzY8OGB
 IYKW2mFzT8MJtrWR4CyLKdZT5AVXxVHID3QTz0LO0dCTd2FZXkyBIMjQsYWLrNeUSnwZSdd
 Yxl/oMSOBSUZ+pM5CR4SafRgUQY8fsm15uS3CMNqQvVpQKWKIzRu871l+gb/hfIwW4ie5S8
 UGzwJRT0SqHjRUjU4hp0w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8HuLJ4jsVX0=:zt3iXhxUjgX38IOu+lYimE
 7MtPS0QzSfS1rw1gABCr75bhtdvS+/4pWBiryYMTT6f0aWmYvgMJiPS1oHI/Z1DXJh8Swv2nv
 9vE57sbTb/ztZsF3hzDbBdU/ohxcM/sVKJwCXI2RS5GxUT/V/qwpg4I93YDbye/TWqHzhBD4j
 7RcgE0twKXooCtVhpoNu0XJv6UsdIeyiKFkT/GsmX0F1nn8QlmGz+892Tf4fO/dd5LscnlYE/
 wi959E6pf4yvWpRD/Kr4HUq1++BwvZ6t9n4YG3/C64+AUS6O5EQXXYG2f+V2AfNMYr3jELhpd
 BPX0rbzK6KmOl0E9AvMCz8QDv0Rrl9E1a6zo82mtKUYdPf4eUV5FCAN9mOK9FeHes72ATSJDh
 9VgtqE1fqZ5bkVYOnwkSLoZ53nwqp4E7gM0nxni7g25Eb2J15Kv35/613wmitj6GtCr2o5T/I
 A2yZF2EkYaMtNJ4amaXf0pCbjvBiYre+7J7ClJ/wOYDSrrZVk2gXzjZNiX3ad/jlcnmYxHq/H
 9oTDYePnxTa01hv2lDcwwtRqtucvudzPMvvSCgVU7G1dGLptgj1SiX2+a6CdmAFgGdnMnMe2+
 VpXSdUlZiNPcCHLJB+qzIEfFKgX1faaWaMh2MR66SZFXBNuyt+7FWt5kWqhTC2shK924vGHqU
 dqZpIevK7oZwhyduv+dNAhQGOzNbuXQ/pokasSiNzkBGaIgUYO0qcK3MdahEMCfeQGyNgroB0
 VwxT9ERJBobk/+BJfu1Jf9Bi76kIsi+QTv6rVlmxAvABRU+sQJBveKfwFmg+LHcWEmEvIZHn/
 iPTYR4Xhbfr73d7qt2jMcQlgE70SVrmPb8+5YwH4Lm2H2P/XH6+dyP0Po2ieJPQgU+GMcRHHn
 jeCLAnULfLTkm7TxmMnpXoEIAP8XJNt+BYCULwyDhMIx8+pj8lddUYPnf7EFkCRrXnU5DaZzP
 7r6rxUWAQVURTtyt25ojG/wKp45Eo2EAvJsTBCJyPUhsRZ5fyq2p7
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>,
 linux1394-devel@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] firewire: Prevent
 kernel-infoleak in ioctl_get_info()
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

On Mon, Jul 27, 2020 at 5:18 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> ioctl_get_info() is copying uninitialized stack memory to userspace due to
> the compiler not initializing holes in statically allocated structures.
> Fix it by initializing `event` using memset() in fill_bus_reset_event().
>
> Cc: stable@vger.kernel.org
> Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

I would recommend always looking through the git history of the
file to come up with an appropriate 'Fixes' tag. In this case

$ git log -p --follow drivers/firewire/core-cdev.c

searching for any mention of fill_bus_reset_event leads you to
commit 344bbc4de14e.

In my ~/.gitconfig I have this alias:

[core]
        abbrev = 12
[alias]
        fixes = show --format='Fixes: %h (\"%s\")' -s

With something like that, calling 'git fixes 344bbc4de14e' produces
the line to copy:

Fixes: 344bbc4de14e ("firewire: Generalize get_config_rom to get_info.")

     Arnd

> ---
>  drivers/firewire/core-cdev.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
> index fb6c651214f3..2341d762df5b 100644
> --- a/drivers/firewire/core-cdev.c
> +++ b/drivers/firewire/core-cdev.c
> @@ -340,6 +340,8 @@ static void fill_bus_reset_event(struct fw_cdev_event_bus_reset *event,
>  {
>         struct fw_card *card = client->device->card;
>
> +       memset(event, 0, sizeof(*event));
> +
>         spin_lock_irq(&card->lock);
>
>         event->closure       = client->bus_reset_closure;
> --
> 2.25.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
