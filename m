Return-Path: <SRS0=+dDq=AI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1832C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 27 Jun 2020 05:51:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99DA3207FC
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 27 Jun 2020 05:51:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZbX8WV/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99DA3207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5B12787E59;
	Sat, 27 Jun 2020 05:51:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PTYuKWEpJWVi; Sat, 27 Jun 2020 05:51:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E37E387E58;
	Sat, 27 Jun 2020 05:51:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C84BEC088C;
	Sat, 27 Jun 2020 05:51:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2DEB3C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Jun 2020 05:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F0A3F204AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Jun 2020 05:51:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7dk2G0ahFfpT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Jun 2020 05:51:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 3D9C8204AA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Jun 2020 05:51:39 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id k6so10266774ili.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Jun 2020 22:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/XK9O5e9WYvpLJ8CUU6lWm9WXLh2aPJdj62lrelY7z0=;
 b=PZbX8WV/OaNA6DgZ6Is7kfIwNjE23/oVVVKhrWXOyaLkvljZiKFQePoBr4dSVTBwSC
 E5Ham/C1pDzR++vWFqCyS32++gOZAMbZDS/kW+rKqCg0p3qxQvMVFeTM/zgo4uOQ+0dX
 fh8hQOJiJS5uvlX3uUMpqREYSLfevJbuWyqfoLDtVjVs10d0JqdcC6BPHX4LUs28VTl4
 osf2a3EZCj1YCIXf4AFKI8yQuH3L0vAOBtmOYnBZlOFjr/z6YS14c0oPxOeX7i91wXFQ
 pYM3R4u9W0ySVOKT/fzyficDQ5xuil6YkvUyisGqmOjkhjtA8jc3y4an0/FDNet/PtuQ
 OvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/XK9O5e9WYvpLJ8CUU6lWm9WXLh2aPJdj62lrelY7z0=;
 b=UNsvkRgRiV0gh0VhJgNYI61d7b3HrzIxU2VYToEoZBmADfiOGe+bvERuaVZiy6MIZq
 RtCEIs9mWOMQQt/E4aLzhk6M5ZHg10AgiRQv4AUHgoV69KNQEb2rid65wIopb1eYterl
 wHrQRF+0fIrQTLFpuLbCRSLulcMuRI7/v5MaX9MHRtrNfqbDXFy60jgJREdP6rtpaEQU
 kYiAImBggOV51QVYkF/CC8Bzc6YQnFkv1i641Rs4UL2+pCH9gKapq206A1iORoMj52Cu
 SkmvEnbwCjPpsyzYiDUH3nvbFUuwbXARUKhlOCQSmjAEXlRFhj0BB2aMrK1wEeXSS/7/
 5SPw==
X-Gm-Message-State: AOAM530M/2aNfRy+6gQ9GJfqwJS6nt7Y4c52pEeSnNq89p9lwZix1CGf
 S9hq4ILQ72hYaW+LmK/y5BIC83zx6snf6/Y7A4I=
X-Google-Smtp-Source: ABdhPJy6prHvLGtnP9a/NnYKc8hXTVPikrzhNjdmbCOe1v5Ut7+vGkabZpdZwEYEUy+QJdErXgomCSZw1GERy2496/Y=
X-Received: by 2002:a05:6e02:48e:: with SMTP id
 b14mr6281351ils.143.1593237098484; 
 Fri, 26 Jun 2020 22:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200624175116.67911-1-vaibhavgupta40@gmail.com>
 <20200626.121428.112500348777695663.davem@davemloft.net>
In-Reply-To: <20200626.121428.112500348777695663.davem@davemloft.net>
From: Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Sat, 27 Jun 2020 11:20:03 +0530
Message-ID: <CAPBsFfDBogBbLuzMd2dLwR_DD2hMpoYsXnOpLwMyS7CJ0vUH3A@mail.gmail.com>
To: David Miller <davem@davemloft.net>
Cc: aelior@marvell.com, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 netdev@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, GR-everest-linux-l2@marvell.com,
 Bjorn Helgaas <bhelgaas@google.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, skalluru@marvell.com
Subject: Re: [Linux-kernel-mentees] [PATCH v1] bnx2x: use generic power
	management
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

On Sat, 27 Jun 2020 at 00:44, David Miller <davem@davemloft.net> wrote:
>
> From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> Date: Wed, 24 Jun 2020 23:21:17 +0530
>
> > With legacy PM, drivers themselves were responsible for managing the
> > device's power states and takes care of register states.
> >
> > After upgrading to the generic structure, PCI core will take care of
> > required tasks and drivers should do only device-specific operations.
> >
> > The driver was also calling bnx2x_set_power_state() to set the power state
> > of the device by changing the device's registers' value. It is no more
> > needed.
> >
> > Compile-tested only.
> >
> > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
>
> Applied, thanks.
Thanks everyone :)
-- Vaibhav Gupta
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
