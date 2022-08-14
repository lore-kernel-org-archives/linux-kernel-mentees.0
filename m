Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59196C25B06
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Aug 2022 18:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1162401B1;
	Sun, 14 Aug 2022 18:47:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1162401B1
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZcNgkuU+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rap7mkREGgqI; Sun, 14 Aug 2022 18:47:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DF20040025;
	Sun, 14 Aug 2022 18:47:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF20040025
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B37ABC0033;
	Sun, 14 Aug 2022 18:47:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C009FC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 18:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75B9A817E4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 18:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75B9A817E4
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZcNgkuU+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l8sZT982toqu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 18:47:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69FB2817A9
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69FB2817A9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 18:47:04 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id l18so4117807qvt.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 11:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=dudlmWjuSuvNbi9ZYyo/rAhbjJyLDMtzGN5G53OzaMo=;
 b=ZcNgkuU+zWbAKcAGArBWE8maGMxvPQ7VlP0YNqDbjIPV8BeVbWwnoua6cHVFuLyH4l
 Y+eaEC5T+XPw1vLxXzcQsWDey3KX78uyEbjfuqi4pwC+42YiT39WsUA628D79tfh6K8d
 4DY725D0GLL5UQ+8tL59nOSTxuD88uzXAM37WpK1T7DkyyJN4R0TRPKJW10UE5YXaqS6
 qUDPl03aM301291lSSXaacqjwyNXXJDtlXWf0TNGiKDbQiFzQ0K9B20MCltUdnOy1i+Y
 z0mGQlMIyw7XXHzaEHp31ukbzY5PON8ezIqMqYl5d4JQW2i4XMjGkbiQjLyDVBSeOjLN
 6u2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=dudlmWjuSuvNbi9ZYyo/rAhbjJyLDMtzGN5G53OzaMo=;
 b=7O9PLsVTTeD/jUZVPVRkDQDfz5bHIT4IcfYeh1HgJQUJZbZDjiVX+2dcMhhYr+tpWz
 qXhub7iKVVTUjTz5huZwExQBekgGdQ/rAhok1CaEUPYC2BbZJhUKIsUioYpS44hSFVLT
 xslsPEX9IuGQ9kA6KO6XkUbB3HNmYxOCpm1va0lkqCGtwyer1oQ75n2OBNbfektIOtBI
 FXjS6ldSoAlMcREebBuw54lDPnWVCskxdXlhmHMBNotEkH4j4RB81sbXbVJw/lfUfhsu
 eRFX2Y4blFGOQMeS98ZK+jBBbYqIBtdJd5mrISU33IqUvi9IefXNp6WM3+nUIfCpYNDY
 WbLA==
X-Gm-Message-State: ACgBeo3WHG7zIyGaWwpupfCd7izFJuqkYIlVLJaShoBIFmAe2JA/CV9v
 vvWu6zUAR+13nwXkQZW7WG8p+zYdOqvOob/BRwE=
X-Google-Smtp-Source: AA6agR4oQuZQwsVyjXb+7L9CQIbO7cRvAMkkYymfXxeLEfz+ouuOzmVVtEFPSsbedtPUWQLE/CKEUbV8wlJCDhKD/P0=
X-Received: by 2002:a05:6214:5290:b0:479:5df:e654 with SMTP id
 kj16-20020a056214529000b0047905dfe654mr10935326qvb.97.1660502823159; Sun, 14
 Aug 2022 11:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220814080416.7531-1-khalid.masum.92@gmail.com>
In-Reply-To: <20220814080416.7531-1-khalid.masum.92@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 14 Aug 2022 21:46:26 +0300
Message-ID: <CAHp75Ve4UaLsUknGKm14_-f5=qsq1s_Ws+j6h0kAY5_XMkSmQw@mail.gmail.com>
Subject: Re: [RFC PATCH] Soundwire: Initialize multi_link with fwnode props
To: Khalid Masum <khalid.masum.92@gmail.com>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, Len Brown <lenb@kernel.org>
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

On Sun, Aug 14, 2022 at 11:31 AM Khalid Masum <khalid.masum.92@gmail.com> wrote:
>
> According to the TODO, In sw_bus_master_add, bus->multi_link is to be
> populated with properties from FW node props. Make this happen by
> creating a new fwnode_handle flag FWNODE_FLAG_MULTI_LINKED and use
> the flag to store the multi_link value from intel_link_startup. Use
> this flag to initialize bus->multi_link.

...

>         /*
>          * Initialize multi_link flag
> -        * TODO: populate this flag by reading property from FW node
>          */
> -       bus->multi_link = false;
> +       bus->multi_link = (fwnode->flags & FWNODE_FLAG_MULTI_LINKED)
> +               == FWNODE_FLAG_MULTI_LINKED;

NAK (as far as I understood the context of the comment and the change itself).

These flags are for devlink, we do not mix FW properties with those
internal flags anyhow. The comment suggests that this should be a
property. Also commit message doesn't explain the relation to devlink.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
