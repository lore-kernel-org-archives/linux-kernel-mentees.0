Return-Path: <SRS0=TY1r=PB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F02C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Oct 2021 17:17:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A32A561040
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Oct 2021 17:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A32A561040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C8B860817;
	Wed, 13 Oct 2021 17:17:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YNKx-8ZnS6Sy; Wed, 13 Oct 2021 17:17:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 425116076A;
	Wed, 13 Oct 2021 17:17:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 161CEC0011;
	Wed, 13 Oct 2021 17:17:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37807C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 17:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B92180C9F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 17:17:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RPiLKO-YYwna
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 17:17:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA6FF80C99
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 17:17:05 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id q12so54545pgq.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 10:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WPFUjd8Q9O9RISB2nZFcZQck1B6ptteWSvStmSxae5M=;
 b=hzS5ySKRoPKTK8CPlTfbgHkjBt/sBPUtbiyxDrDsT1RDuOMqXAeh0XxwKbX/oKExnD
 iVKTmojf69VOvV1n5Y5FgnBZBE9u+3oCmBe5XqLmlfmuGPZTolLSl5Lk4tcwYvCgeOr6
 O2X2vbliHKZJH0CYADrJ3Inf1SOHEAAFyW9Gux+eDy1hKGH03rNm19PE1VvwaaFQnza1
 N2DfLGUrSFLEoIo8y6RPnEDtJyqbpSqhqytXa04ddp68uJu33A/q3bf6UyQWVc45gY9G
 WqTuPZLAf4lqSmI+9VYZ/tW1rCP4CSEzakN2cUANDCCpA8cr0shimseBJLSThFd0agSa
 4uxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WPFUjd8Q9O9RISB2nZFcZQck1B6ptteWSvStmSxae5M=;
 b=khywtr9/ASEBkIeTYisfCs2gpWg/QP+7q3mBR5XxUPS0DOk8ahlfHxwcQ0i85uPM/V
 iN9CQMFvRBgPt3DP9nwRhQijXRLBZA9/idrVUaiVymuW5qWBICj5ZzeSehHBYMPFNW2o
 HKD08D4dlM4S6A0sswX7VUus5tR6//fSC/cHTStM1GP7+PQF8wbYNCnA5bwsl6cwJINc
 qKT2zt21HLI+QD6tS1lZNPT22l6MSw9vheNmezPEk3G6XFVKiI3uaNF/EuggwGqRy1X8
 CGDLiP5WyNHWUNnu6z/Wd+kRcMsS9Aq9QZZsb20y3U3sUVRU5NdnEP/HoGb/KWDJo4qU
 kM5w==
X-Gm-Message-State: AOAM532nJglWOXeafs8XU3iBZhp/qaLWByQ4tSF5T24eD/uhbR7Ctywq
 JnWr+pNMjv9qREEEVthwF1c=
X-Google-Smtp-Source: ABdhPJwkD8oG/998tfhCfC8vxTq1W1dd298hbgHKURO3Qd6Wk4ok6lpt4CpVvK8ejq0DNFo7TeEOIQ==
X-Received: by 2002:aa7:8bd3:0:b0:44c:68b3:a52e with SMTP id
 s19-20020aa78bd3000000b0044c68b3a52emr594030pfd.74.1634145424997; 
 Wed, 13 Oct 2021 10:17:04 -0700 (PDT)
Received: from theprophet ([2406:7400:63:13e2:eca5:41c1:dbf7:2e91])
 by smtp.gmail.com with ESMTPSA id w13sm6415780pjc.29.2021.10.13.10.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 10:17:04 -0700 (PDT)
Date: Wed, 13 Oct 2021 22:46:53 +0530
From: Naveen Naidu <naveennaidu479@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 02/22] PCI: Unify PCI error response checking
Message-ID: <20211013171653.zx4sxdzhvy2ujytd@theprophet>
References: <YWS1QtNJh7vPCftH@robh.at.kernel.org>
 <20211013024355.GA1865721@bhelgaas>
 <CAL_JsqLobP9MM0EFnof_nDOBrox=gKH3xe3EQbqPceq8pRRgyA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqLobP9MM0EFnof_nDOBrox=gKH3xe3EQbqPceq8pRRgyA@mail.gmail.com>
Cc: PCI <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On 13/10, Rob Herring wrote:
> On Tue, Oct 12, 2021 at 9:43 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > [+cc Pali]
> >
> > On Mon, Oct 11, 2021 at 05:05:54PM -0500, Rob Herring wrote:
> > > On Mon, Oct 11, 2021 at 11:08:32PM +0530, Naveen Naidu wrote:
> > > > An MMIO read from a PCI device that doesn't exist or doesn't respond
> > > > causes a PCI error.  There's no real data to return to satisfy the
> > > > CPU read, so most hardware fabricates ~0 data.
> > > >
> > > > Use SET_PCI_ERROR_RESPONSE() to set the error response and
> > > > RESPONSE_IS_PCI_ERROR() to check the error response during hardware
> > > > read.
> > > >
> > > > These definitions make error checks consistent and easier to find.
> > > >
> > > > Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> > > > ---
> > > >  drivers/pci/access.c | 22 +++++++++++-----------
> > > >  1 file changed, 11 insertions(+), 11 deletions(-)
> > > >
> > > > diff --git a/drivers/pci/access.c b/drivers/pci/access.c
> > > > index 46935695cfb9..e1954bbbd137 100644
> > > > --- a/drivers/pci/access.c
> > > > +++ b/drivers/pci/access.c
> > > > @@ -81,7 +81,7 @@ int pci_generic_config_read(struct pci_bus *bus, unsigned int devfn,
> > > >
> > > >     addr = bus->ops->map_bus(bus, devfn, where);
> > > >     if (!addr) {
> > > > -           *val = ~0;
> > > > +           SET_PCI_ERROR_RESPONSE(val);
> > >
> > > This to me doesn't look like kernel style. I'd rather see a define
> > > replace just '~0', but I defer to Bjorn.
> > >
> > > >             return PCIBIOS_DEVICE_NOT_FOUND;
> > >
> > > Neither does this using custom error codes rather than standard Linux
> > > errno. I point this out as I that's were I'd start with the config
> > > accessors. Though there are lots of occurrences so we'd need a way to do
> > > this in manageable steps.
> >
> > I would love to see PCIBIOS_* confined to arch/x86 and everywhere else
> > using standard Linux error codes.
>

Digging through the mailing list, I see that something similar was
attempted here
https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-July/214437.html
which did not move forward because there were a lot of moving parts (I
guess). But reading through the thread did give me an overview of what
we might wanna do.

The thread does bring up a good point, about not returning any error
values in pci_read_config_*() and converting the function definition to
something like
  
  void pci_read_config_word(struct pci_dev *dev, int where, u16 *val)

The reason stated in the thread was that, the error values returned from
these functions are either ignored or are not used properly. And
whenever an error occurs, the error value ~0 is anyway stored in val, we
could use that to test errors.

Ref:
https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-July/214562.html

I bring this point because Pali mentioned that config read function can
return only PCIBIOS_SUCCESSFUL value.

Maybe instead of us trying to change pci_read_config_word, we might
wanna start small with changing PCI_OP_READ and PCI_USER_READ_CONFIG
such that they would only ever return PCI_SUCCESFUL and if any these
config accessor defines detect any error they can fabricate the value ~0
for "val" argument.

And at the caller site, instead of checking the return value of
PCI_OP_READ to detect errors, we could check the "val" for ~0 value.

But I am unable to gauge, if we should take this task before we begin
the project of removing PCIBIOS_* OR if this should be done after we
compelete with PCIBIOS_* work.

I guess the better question would be, if making PCI_OP_READ return only
PCI_SUCCESSFULL or converting it to a void, help the PCIBIOS_* work
easier? 

> Based on Pali's and your replies, I take it that these values
> originate in x86 firmware, so the x86 code needs to convert to Linux
> error codes and everywhere else can use Linux error codes everywhere.
> 
> > That's probably a lot of work, but
> > Naveen has a lot of energy :)
> 
> There's 210 in drivers/pci/, 62 in the rest of drivers/ and 437 in
> arch/. 332 are PCIBIOS_SUCCESSFUL which won't change values. Most of
> drivers/pci/ and arch/ returning the value while the rest of drivers/
> is comparing the returned value (mostly to PCIBIOS_SUCCESSFUL). There
> could be checks such as 'if (ret > 0)' which are harder to find. A
> coccinelle patch might be helpful here.
> 
> I think we want to do things in the following order:
> - Rework any callers expecting a positive return value
> - Make the config accessor defines convert positive error codes to
> Linux error codes
> - Convert pci_ops implementations to Linux error codes one by one.
> 

Thank you very much for this list, this really helps me. I have been
starting at the screen since morning to come up with something like 
this. IIUC, you mean:

1. When you mean "PCIBIOS_SUCCESSFUL which won't change values", did you
   mean to say, that we would keep "PCIBIOS_SUCCESSFUL" define as it is
   and not bother replacing it with "0"? (Atleast for the first version
   of patch, and can be done in a later series)

2. "Rework any callers expecting a positive return value"
   
   This means, find out the places where we have something like 
     
     err = pci_read_config_dword();
        if (err > 0)

   Then change it to:

     err = pci_read_config_dword(pdev, PCI_REG_NPKDSC, &npkdsc);
        if (err != PCIBIOS_SUCCESSFUL)

   Is there any easy way to search for these patterns, or should I look
   for each instance of pci_read_config_* and other such variants and
   see if such an case exists?

3. "Make the config accessor defines convert positive error codes to Linux error codes"

    Do you mean something like:

      #define PCI_OP_READ(size, type, len) \
      int noinline pci_bus_read_config_##size \
        (struct pci_bus *bus, unsigned int devfn, int pos, type *value)
        \
        {
           if (PCI_##size##_BAD) return pcibios_err_to_errno(PCIBIOS_BAD_REGISTER_NUMBER);
           ...
           ...
           return pcibios_err_to_errno(res);  


4. "Convert pci_ops implementations to Linux error codes one by one"
    
    Finally, remove all the PCIBIOS_* references from the pci_ops
    implementation of various drivers. 

> I also considered we could make the accessors convert negative error
> codes back to positive PCIBIOS_ values, then no callers have to be
> checked/fixed first.
> 
> > > Can't we make PCI_OP_READ and PCI_USER_READ_CONFIG set the data value

Rob, When you say this do you mean - we have something like:

  #define PCI_OPS_READ()
    res = bus->ops->read();
    if (res != PCIBIOS_SUCCESSFUL)
        SET_PCI_ERROR_RESPONSE(val);

And the pci_ops implementation would look like:

  pci_generic_config_read()
  {
     addr = bus->ops->map_bus();
     if (!addr)
        return PCIBIOS_DEVICE_NOT_FOUND;
  }
 
This way the controller/drivers does not have to bother fabricating the
~0 value, all they have to do when they detect any error is return the
error. And the PCI_OP_READ and PCI_USER_READ_CONFIG will set the ~0
value for "val".

Pali, would you have concerns with the above design?

> > > and delete the drivers all doing this? Then we have 2 copies (in source)
> > > rather than the many this series modifies. Though I'm not sure if there
> > > are other cases of calling pci_bus.ops.read() which expect to get ~0.
> >
> > That does seem like a really good idea.
> 
> I don't it matters what order we do these, so this can happen first.
>

Yes, this makes sense. I can send a patch for this first and then start
working on the PCIBIOS_* project. If anybody has any objection please do
let me know.

Thanks for the comment, it cleared up a lot of my doubts ^^

Thanks,
Naveen
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
