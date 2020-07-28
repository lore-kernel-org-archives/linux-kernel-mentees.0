Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD3C7C433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 12:22:45 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9618320714
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 12:22:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tWs0cbIE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9618320714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 59F0487D75;
	Tue, 28 Jul 2020 12:22:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PbIjgmO9ldJw; Tue, 28 Jul 2020 12:22:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C520987D4B;
	Tue, 28 Jul 2020 12:22:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BAF17C0050;
	Tue, 28 Jul 2020 12:22:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E952BC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E507B87D5A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:22:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hCgfb8l4wn1F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:22:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C7DAE87D4B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:22:42 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id v4so11217858ljd.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 05:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TESeuYU5SfzLxBWMQ4kl8vP13Tpf9d4XmBM8Gp63Ao8=;
 b=tWs0cbIEtxsoEEWx87oQK2/AgPlRAXgY0LbgzgRA3ewO5DWL6Fyxb8WS3aulE9/J9C
 X3RsXavLk4qFUAWa4p05w6NqoVN+pucr64IBxtUbfF0Mf29aAXTZyAEJTyX15Z9ovorj
 wQEi4O2bCR8ckUmBIg6mwgpxBnP5IMhwzOd86n02qGgjjYaAjBM79Rn3x2dlCYpTnBqV
 I+UTfpEnvgnzhrgm3JZqje3nsXlj8agQslaPouGHWhmpPABmgolCN9NXsxPDZd1PQh+v
 NGQwfGtgnwr0M3pbpqj4n2+rOU/1w12GWAALbgiFNbUtF3NmRBGZFe+sqUlrg1pbaDHE
 v+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TESeuYU5SfzLxBWMQ4kl8vP13Tpf9d4XmBM8Gp63Ao8=;
 b=UFCJ0lwWdlmulWvCB7PXq7jK4XL5GJIU3P1yrGB0KHilvpdgZQpjkHXc04e+swMhTX
 sXKuDtPi6pQROo4fWlmnZLomL2OyC1EyTGqw/dLV86nhQyHHb8LRVqCuxRBBOKmyGQGc
 n/x9ACuG7GTITehcweYWl90OwXVoRlrVxNeRvbf/USXTRo7Zd8+ebwiQyeW7rmGQm6NI
 Oys7/hh8Jo0spXSkfphmhH8qI7vyVPxVoQuJe/cm/KHNYMjr2wu26Wu76CWF6JikMpQh
 +xR7kU2zNS8XWJzC9hOF91uN2CySMPH1T2HoGsVG4XhQNfE4sae/3DYUtqNcIgcWnrTv
 P5uQ==
X-Gm-Message-State: AOAM5332nvOSifIgqwwfKx/Cw4NkjKNk7WrNoKU4h+UZcudKM4Ra71u7
 /tE1GAtq5wXFvDLB0AxfAmXre9Hc1j0GhjoGoIaUCw==
X-Google-Smtp-Source: ABdhPJxFKokBgoeIMtwaFCWZjTjcyuOq58U+G8s0TH2HfjNeeOsLST8x9LgKqX+cy/D0oEkPhul5xgMLR5yLY5nKt8c=
X-Received: by 2002:a2e:90e:: with SMTP id 14mr5500607ljj.293.1595938960755;
 Tue, 28 Jul 2020 05:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam>
In-Reply-To: <20200727131608.GD1913@kadam>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Jul 2020 14:22:29 +0200
Message-ID: <CACRpkda7k4L+nqAYE6z2FVZF-WT2Pm3CHH_=fW24xz_u+QCMRQ@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Arnd Bergmann <arnd@arndb.de>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vandana BN <bnvandana@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
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

On Mon, Jul 27, 2020 at 3:17 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> Here are my latest warnings on linux-next from Friday.

Thanks for sharing this Dan, very interesting findings.

> drivers/gpio/gpiolib-cdev.c:473 lineevent_read() warn: check that 'ge' doesn't leak information (struct has a hole after 'id')

We are revamping the ABI for 64bit compatibility so we are now running
pahole on our stuff. I suppose we need to think about mending this old ABI
as well.

Yours,
Linus Walleij
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
