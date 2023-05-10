Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2361BC77B7D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 10 May 2023 10:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9F1984199;
	Wed, 10 May 2023 10:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9F1984199
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=KDLlmdqC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O4CstCku29GX; Wed, 10 May 2023 10:49:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4EA0383F6A;
	Wed, 10 May 2023 10:49:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EA0383F6A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25D48C0036;
	Wed, 10 May 2023 10:49:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EAEE3C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 10:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD52F41F54
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 10:49:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD52F41F54
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=KDLlmdqC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HJTaVNHs2S8M
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 10:49:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 350C341F1B
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 350C341F1B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 10:49:50 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3063891d61aso6681291f8f.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 03:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683715788; x=1686307788;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rkS+JtL/4x2F2nhP046jklHsvY5QYHCKk9mJ3UxHXR4=;
 b=KDLlmdqCNLFvEUJVcsjXC40vvrMwRIfh1bKgaRqK8L6r+8TNiuAECFdNkAUFAjKWA/
 4AkPbPyIcFMFRIFanm9dm+PXJbpbeUowPqSxqQVEGuUKogn9mUzHvHyaOPU/GMXDhsPD
 +gfpIpqIsFtFy62LZFlThJw4k2VrMBUJqBvdWxF5UVwmZjH2zqGbRyNjjxMlB9x+QcwM
 kq7B4B4Vk6Ssh1BZmU99g3neiTAeVM3ED0PylGU6hJaamGcKcIhQaJ5XkUEUda7HuokW
 F4y+a8qjv+OXiYpvpdJVm3XEqUYGTV15IqEUTjA/6xLjiMeUTdYJ1dyGT6krZaFp9dUC
 yQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683715788; x=1686307788;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rkS+JtL/4x2F2nhP046jklHsvY5QYHCKk9mJ3UxHXR4=;
 b=GZ2Vlf2utGjGlYkQ9zL8ftiIdhjh6UXNnnO1Kg7rM8e7YS6f1pspPFs6fXXmpmrIwr
 hATSsU3TqT4XDcArHik2M23CzMvXhYsXKP7VF0gI2FRhPB+Rs4bJw48tyNSv1tj4nqlc
 wHUa37K3KXz8x4ljgUlDwZyU3cVYzrQUVvSRD3dqtqO0U7u4e0DlLG2qka0uraxtgvqo
 Lw5GAAg1QxYTGLDiO6ALYieQfmcM81Y8nLHeyQOeIH3rBekJy9fn5AOVq2vpJD1ulD2Y
 XTvilCPgUbFQuHw6dzlmLjPo71WPFEmMKWlHjTvDSn+nAg2BCRoSH8VLiIcLNS9/Fium
 QFzA==
X-Gm-Message-State: AC+VfDzFaqHENEt9seGQ7slbPFFnwIZ8+zrWANjUAjcjCzaTcV6J0kJp
 vE9WBPziETOJulQ0JjJl4K4=
X-Google-Smtp-Source: ACHHUZ4JGmvsYsJs9otSXwm3s6rqmGtYaWe+Fx7RUYPcU7zchmQo743avEngeWoWjBLKUoQtZXMAWw==
X-Received: by 2002:a05:6000:1191:b0:306:462a:b78d with SMTP id
 g17-20020a056000119100b00306462ab78dmr10354606wrx.53.1683715787842; 
 Wed, 10 May 2023 03:49:47 -0700 (PDT)
Received: from localhost ([146.70.133.78]) by smtp.gmail.com with ESMTPSA id
 o5-20020adfeac5000000b003065f2a8a63sm16871648wrn.27.2023.05.10.03.49.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 03:49:47 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 10 May 2023 12:49:45 +0200
Message-Id: <CSIJFLM445UI.1W405TTWNZYYU@vincent-arch>
To: "Greg KH" <greg@kroah.com>
Subject: Re: [PATCH v1] drivers: pci: introduce configurable delay for
 Rockchip PCIe bus scan
From: "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
X-Mailer: aerc 0.15.1
References: <20230509153912.515218-1-vincenzopalazzodev@gmail.com>
 <2023051014-foe-multiply-ffff@gregkh>
In-Reply-To: <2023051014-foe-multiply-ffff@gregkh>
Cc: kw@linux.com, heiko@sntech.de, robh@kernel.org, linux-pci@vger.kernel.org,
 shawn.lin@rock-chips.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 linux-rockchip@lists.infradead.org, broonie@kernel.org, bhelgaas@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org, lpieralisi@kernel.org,
 linux-arm-kernel@lists.infradead.org, Dan Johansen <strit@manjaro.org>
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

> On Tue, May 09, 2023 at 05:39:12PM +0200, Vincenzo Palazzo wrote:
> > --- a/drivers/pci/controller/pcie-rockchip-host.c
> > +++ b/drivers/pci/controller/pcie-rockchip-host.c
> > @@ -38,6 +38,10 @@
> >  #include "../pci.h"
> >  #include "pcie-rockchip.h"
> >
> > +/* bus_scan_delay - module parameter to override the
> > + * device tree value, which is 0 by default. */
> > +static int bus_scan_delay = -1;
>
> Please do not add new module parameters, this is not the 1990's anymore.
> We have per-device settings everywhere, this makes that impossible.
> Just use a DT value, if it is wrong, then fix the DT value!  No need to
> have the kernel override it, that's not what DT files are for.

Thanks!

Cheers!

Vincent.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
