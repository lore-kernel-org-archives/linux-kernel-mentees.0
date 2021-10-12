Return-Path: <SRS0=UocX=PA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676D5C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Oct 2021 18:02:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09AD7604DA
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Oct 2021 18:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 09AD7604DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2DB880F82;
	Tue, 12 Oct 2021 18:02:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EUGJ5N78rhdS; Tue, 12 Oct 2021 18:02:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CC9D280EB6;
	Tue, 12 Oct 2021 18:02:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F0DBC000F;
	Tue, 12 Oct 2021 18:02:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73179C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Oct 2021 18:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 489D380F1C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Oct 2021 18:02:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gt_wL31BV1Bl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Oct 2021 18:02:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74DF980EB6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Oct 2021 18:02:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26B0B610C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Oct 2021 18:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634061774;
 bh=xTN1PjqxcKL64k4FjBSP0uPIUc967wpJd6JWcfYGptQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VkWxnZ4AdwcZOrLECs7LwOd2c9krNsSkWbN4SZ1zwEAlTpWr00f/aWx22Zqx82KkV
 zZ2r1bSmAmhv2WVSmNCLAKRgHWRNZ+reGUKY6CSZ1qGVsGPyZXs6IB/Ei0ATlAl5kI
 f0UJV8f/xAe9Ou5SJOWwXdnzg9cACx+LAYP6jL8qAgfyAN4yU8dMYPAhIqI03q0vjm
 JWRls1TQp/KVRaC/D4/eYBSXcQR0BSjrBOS1LicD+vyGkJ9MkcObROljn1ufaKTHPy
 OfdyvXa7gBCsthA5+L2mrwVaM4pni2MlpQLe5rfSw2/rtSgXgZQfKzUEFp0sr9Py3x
 QaCdUJNUOUxIw==
Received: by mail-ed1-f48.google.com with SMTP id t16so2657369eds.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Oct 2021 11:02:54 -0700 (PDT)
X-Gm-Message-State: AOAM530Ldtoi3taOQdijBGqq/D8asDWLdpQe+oGqoUCZhcgVVNs2feWn
 xjYRtUZJDydDFJPL8s7fsdwd/4CiJZpuGtt4pw==
X-Google-Smtp-Source: ABdhPJxx05UpaUAZBZhobVr3mWSJ/Vmt1Vre3u4+SUHd1FZeloZmFdpglKPZPp5Q7X+iaEzRfGBddajKTnGEf+TRS58=
X-Received: by 2002:a05:6402:1d55:: with SMTP id
 dz21mr1780223edb.164.1634061772482; 
 Tue, 12 Oct 2021 11:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633972263.git.naveennaidu479@gmail.com>
 <c632b07eb1b08cc7d4346455a55641436a379abd.1633972263.git.naveennaidu479@gmail.com>
 <YWS1QtNJh7vPCftH@robh.at.kernel.org>
 <20211012162054.rxx7aubwdvhl2eqj@theprophet>
In-Reply-To: <20211012162054.rxx7aubwdvhl2eqj@theprophet>
From: Rob Herring <robh@kernel.org>
Date: Tue, 12 Oct 2021 13:02:39 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKYP+6Bzm5hvcVbAz5R3+omREDJoOspJ4eTBeMwBSfkfw@mail.gmail.com>
Message-ID: <CAL_JsqKYP+6Bzm5hvcVbAz5R3+omREDJoOspJ4eTBeMwBSfkfw@mail.gmail.com>
Subject: Re: [PATCH 02/22] PCI: Unify PCI error response checking
To: Naveen Naidu <naveennaidu479@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, PCI <linux-pci@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Tue, Oct 12, 2021 at 11:21 AM Naveen Naidu <naveennaidu479@gmail.com> wrote:
>
> On 11/10, Rob Herring wrote:
> > On Mon, Oct 11, 2021 at 11:08:32PM +0530, Naveen Naidu wrote:
> > > An MMIO read from a PCI device that doesn't exist or doesn't respond
> > > causes a PCI error.  There's no real data to return to satisfy the
> > > CPU read, so most hardware fabricates ~0 data.
> > >
> > > Use SET_PCI_ERROR_RESPONSE() to set the error response and
> > > RESPONSE_IS_PCI_ERROR() to check the error response during hardware
> > > read.
> > >
> > > These definitions make error checks consistent and easier to find.
> > >
> > > Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> > > ---
> > >  drivers/pci/access.c | 22 +++++++++++-----------
> > >  1 file changed, 11 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/drivers/pci/access.c b/drivers/pci/access.c
> > > index 46935695cfb9..e1954bbbd137 100644
> > > --- a/drivers/pci/access.c
> > > +++ b/drivers/pci/access.c
> > > @@ -81,7 +81,7 @@ int pci_generic_config_read(struct pci_bus *bus, unsigned int devfn,
> > >
> > >     addr = bus->ops->map_bus(bus, devfn, where);
> > >     if (!addr) {
> > > -           *val = ~0;
> > > +           SET_PCI_ERROR_RESPONSE(val);
> >
> > This to me doesn't look like kernel style. I'd rather see a define
> > replace just '~0', but I defer to Bjorn.
> >
>
> Apologies, if this is a lame question. Why is the macro
> SET_PCI_ERROR_RESPONSE not a kernel style. I ask this so that I do not
> end up making the same mistake again.

Generally, we don't do macros if a static inline function will work
because you get more type checking with a function. There's exceptions
like struct initializers which need to work in declarations.

Second, I think the above obfuscates the code. I know exactly what the
original line is doing to val. With SET_PCI_ERROR_RESPONSE(), I have
to go look and it hasn't saved us any LOC to make the caller more
readable. The downside of the original way, is I don't know why we set
val to ~0, but just a define would tell me that.

> Bjorn, did initally make a patch with only replacing '~0' but then
> Andrew suggested in the patch [1] that we should use the macro.
>
> [1]:
> https://lore.kernel.org/linux-pci/20190823104415.GC14582@e119886-lin.cambridge.arm.com/
> [Adding Andrew in the CC for this]

He's no longer at Arm nor active upstream.

> Apologies, I should have added this link in the cover letter but I
> completely forgot about it.
>
> That's why I decided to go with the macro. If that is not the right
> approach please let me know and I can fix it up.
>
> > >             return PCIBIOS_DEVICE_NOT_FOUND;
> >
> > Neither does this using custom error codes rather than standard Linux
> > errno. I point this out as I that's were I'd start with the config
> > accessors. Though there are lots of occurrences so we'd need a way to do
> > this in manageable steps.
> >
>
> I am sorry, but I do not have any answer for this. I really do not know
> why we return custom error codes instead of standard Linux errno. Maybe
> someone else can pitch in on this.

I don't either. My guess is either just too many places to fix or
somehow it trickles up to userspace (but probably not since the error
codes aren't in a uapi header).

> > Can't we make PCI_OP_READ and PCI_USER_READ_CONFIG set the data value
> > and delete the drivers all doing this? Then we have 2 copies (in source)
> > rather than the many this series modifies. Though I'm not sure if there
> > are other cases of calling pci_bus.ops.read() which expect to get ~0.
> >
>
> This seems like a really good idea :) But again, I am not entirely sure
> if doing so would give us any unexpected behaviour. I'll wait for some
> one to reply to this and if people agree to it, I would be glad to make
> the changes to PCI_OP_READ and PCI_USER_READ_CONFIG and send a new
> patch.

I'm expecting Bjorn to chime in.

Rob
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
