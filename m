Return-Path: <SRS0=3GLs=F4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15735C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Dec 2020 10:02:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8878E22517
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Dec 2020 10:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8878E22517
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1399786860;
	Thu, 24 Dec 2020 10:02:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ViGVr3T2w0HG; Thu, 24 Dec 2020 10:02:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 645C986755;
	Thu, 24 Dec 2020 10:02:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47FEDC1787;
	Thu, 24 Dec 2020 10:02:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0FBBC0893
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Dec 2020 10:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9989820373
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Dec 2020 10:02:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cX3p1S-7yjYD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Dec 2020 10:02:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 by silver.osuosl.org (Postfix) with ESMTPS id CED992014A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Dec 2020 10:02:09 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id y14so356578oom.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Dec 2020 02:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9FdH9kHukbpEmlFgJThukrwd7alESrljVgzVGQtLzes=;
 b=Jh9iCKv3tpQnsnq/njrR4qcIR9jH+SwfR3DtYQrS7N83g1xQMf4ZrOl2OxBKkFk1da
 UmzO3jJXSSs2wpteQZArtXXrJywhn7kFxKbe2pKtghfgh8elYdgHHSGH3B5hO/J/qnqD
 2mHB8JOPGIVKPdro8zF2fGlUj4p5CC5ZcA4G3lu9SUxQZHKtNh1HDewsDEA5D54JaogW
 +2aY7CkHAwbCQ9U3Uku5db/7dIswUKUrHDaoCFcaLlJ9JsrFsShmYehqo2iLd8bIVXMQ
 HhWn7kbzYAVLJoCwKedPXCJ/JjJXnw+AJH/shYwccogan8VpwqYaghcpmPP6lyNxS6c0
 35Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9FdH9kHukbpEmlFgJThukrwd7alESrljVgzVGQtLzes=;
 b=Dd1bsCTzTcJcdgigpTIBD5Mhigi5WYnw41y8LtGa+zkSDSKsRQfDfsPrn2pj4Q8D5m
 9aMJPVmuPjTCJnomYb55+evFjaXpCiKi94yMNit9ROLyv6IpAi1NtC04puB7ZepgJrgY
 jfD1rsWMaDYXVaahnUVAZ/IpQAFWrBrsvpQhiJDAkAN0RYgmg0m700Jwg8H93innhbxV
 tICQ9xkGEHzd6UcNLOAQbbopWVnoT+RUsMAjSRSNAIXegbMQiHq6uhvLE/QBuL0McmRb
 sUi7k3QOloARJb2acFUks7K7iWfDodPyMBrsQoXqs3HrVZsHRhF1tX1Lwkpf2HzE/qwo
 ZDvg==
X-Gm-Message-State: AOAM530BllFpA0e6SV9cOjiYSeUyO5V6EtLl7+pvx2W9Ws+uE0NOkRQV
 rN8f5bE0IfHnFqh+nd+RXQP7gVmvqWgBUww47BE=
X-Google-Smtp-Source: ABdhPJwBBv1fYfwKN7MW5t0f5xCBW3D3C4A1NT3yVjluA/PFPJneiDCTfz2Evu0QGwasq19Fp8zW+lNqhyTGRVuaAyg=
X-Received: by 2002:a4a:e14f:: with SMTP id p15mr21032818oot.25.1608804128909; 
 Thu, 24 Dec 2020 02:02:08 -0800 (PST)
MIME-Version: 1.0
References: <20201104064703.15123-1-himadrispandya@gmail.com>
 <X8n8yR5At1ptPkQ4@localhost>
In-Reply-To: <X8n8yR5At1ptPkQ4@localhost>
From: Himadri Pandya <himadrispandya@gmail.com>
Date: Thu, 24 Dec 2020 15:31:57 +0530
Message-ID: <CAOY-YVmDW0E9Wfs-K2w5+DP4qJgn6_j_OWnGu_zSK_qGqoiXvw@mail.gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: USB list <linux-usb@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH 00/15] usb: serial: avoid using
	usb_control_msg() directly
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

On Fri, Dec 4, 2020 at 2:38 PM Johan Hovold <johan@kernel.org> wrote:
>
> Hi Himadri,
>
> and sorry about the late feedback on this one. I'm still trying to dig
> myself out of some backlog.
>
> On Wed, Nov 04, 2020 at 12:16:48PM +0530, Himadri Pandya wrote:
> > There are many usages of usb_control_msg() that can use the new wrapper
> > functions usb_contro_msg_send() & usb_control_msg_recv() for better
> > error checks on short reads and writes. Hence use them whenever possible
> > and avoid using usb_control_msg() directly.
>
> Replacing working code with shiny new helpers unfortunately often ends
> up introducing new bugs and I'm afraid there are a few examples of that
> in this series as well.
>
> I'll comment on the patches individually, but my impression is that we
> should primarily use these helpers to replace code which allocates a
> temporary buffer for each transfer as otherwise there's no clear gain
> from using them.
>
> Some of your patches contains unrelated changes which needs to go in
> separate patches if they're to be included at all.
>
> Please also try to write dedicated commit messages rater than reusing
> more or less the same stock message since not everything in these
> messages apply to each patch. You never mention that these helpers
> nicely hides the allocation of temporary transfer buffers in some cases
> for examples. In other places they instead introduce additional
> allocations which at least should have been highlighted.
>
> > Himadri Pandya (15):
> >   usb: serial: ark3116: use usb_control_msg_recv() and
> >     usb_control_msg_send()
>
> Nit: please also use an uppercase "USB" prefix.

Hi Johan,

Thanks for reviewing this series and sorry for the late reply. I'll
soon send a v2 according to your comments.

Best regards,
Himadri

>
> >   usb: serial: belkin_sa: use usb_control_msg_send()
> >   usb: serial: ch314: use usb_control_msg_recv() and
> >     usb_control_msg_send()
> >   usb: serial: cp210x: use usb_control_msg_recv() and
> >     usb_control_msg_send()
> >   usb: serial: cypress_m8: use usb_control_msg_recv() and
> >     usb_control_msg_send()
> >   usb: serial: f81232: use usb_control_msg_recv() and
> >     usb_control_msg_send()
> >   usb: serial: f81534: use usb_control_msg_recv() and
> >     usb_control_msg_send()
> >   usb: serial: ftdi_sio: use usb_control_msg_recv() and
> >     usb_control_msg_send()
> >   usb: serial: io_edgeport: use usb_control_msg_recv() and
> >     usb_control_msg_send()
> >   usb: serial: io_ti: use usb_control_msg_recv() and
> >     usb_control_msg_send()
> >   usb: serial: ipaq: use usb_control_msg_send()
> >   usb: serial: ipw: use usb_control_msg_send()
> >   usb: serial: iuu_phoenix: use usb_control_msg_send()
> >   usb: serial: keyspan_pda: use usb_control_msg_recv() and
> >     usb_control_msg_send()
> >   usb: serial: kl5kusb105: use usb_control_msg_recv() and
> >     usb_control_msg_send()
> >
> >  drivers/usb/serial/ark3116.c     |  29 +----
> >  drivers/usb/serial/belkin_sa.c   |  35 +++---
> >  drivers/usb/serial/ch341.c       |  45 +++-----
> >  drivers/usb/serial/cp210x.c      | 148 +++++++------------------
> >  drivers/usb/serial/cypress_m8.c  |  38 ++++---
> >  drivers/usb/serial/f81232.c      |  88 +++------------
> >  drivers/usb/serial/f81534.c      |  63 +++--------
> >  drivers/usb/serial/ftdi_sio.c    | 182 +++++++++++++------------------
> >  drivers/usb/serial/io_edgeport.c |  73 +++++--------
> >  drivers/usb/serial/io_ti.c       |  28 ++---
> >  drivers/usb/serial/ipaq.c        |   9 +-
> >  drivers/usb/serial/ipw.c         | 107 ++++++------------
> >  drivers/usb/serial/iuu_phoenix.c |   5 +-
> >  drivers/usb/serial/keyspan_pda.c | 172 ++++++++++++-----------------
> >  drivers/usb/serial/kl5kusb105.c  |  94 ++++++++--------
> >  15 files changed, 406 insertions(+), 710 deletions(-)
>
> Johan
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
