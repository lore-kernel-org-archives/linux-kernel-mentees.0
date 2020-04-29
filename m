Return-Path: <SRS0=k+ap=6N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3BE1C83000
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Apr 2020 14:24:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCC8D206F0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Apr 2020 14:24:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pTjVdU2l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCC8D206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9884B88471;
	Wed, 29 Apr 2020 14:24:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9E3YdjY0FJTx; Wed, 29 Apr 2020 14:24:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A1D7D88393;
	Wed, 29 Apr 2020 14:24:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9D80EC0865;
	Wed, 29 Apr 2020 14:24:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CEAC9C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Apr 2020 14:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BB84E88396
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Apr 2020 14:24:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JfzN3oKUGhtB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Apr 2020 14:24:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 401D388393
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Apr 2020 14:24:40 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id k23so2396889ios.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Apr 2020 07:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A1CN4jZl4jTo+TBoqkD+2uQy2R8zmyg041lpKbHoH7M=;
 b=pTjVdU2l+wv4rjf7RjiT6n/blcv5kQhRkTpYCmloytxCdlJT0daN6v+k5wiAG5V05p
 +lyQmzwez7Vjd0dU1iU0E6Rw7gv7LqG1MW0U0Y8VRqwxCkoO6tKIPwR9r2MAefbYYF3B
 mFTuY85Kakd1ESJLf7sgADtBuP8ayxrkUtE7UfCTQ/8abnCI++kDFGUmYfVXPuFStAw8
 krNHekQgb2i+bDxKz/u6F0cAchKDkFph31Rl4hrAZW7Y5sov5rmfAJE/PJ4YSrK0H2Ne
 PRHZ7THNVQjRH38dM2RLvEKtAl48F3dlOW+bgCnko5NxLdm07f4BuONIRIi/iW+PnDN+
 AFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A1CN4jZl4jTo+TBoqkD+2uQy2R8zmyg041lpKbHoH7M=;
 b=Fi6xM5QtI/cEa9QcR7s2yWE6lhzQNRBxZJh3NpaWJ/9+spKvFsRy1mDZP86y4b+IS8
 BbNh05DlbsgIMLgFx8+8asv6dK8+b7lcVfNTK59d1IN3XarKvA5Imla9cRkoJ9gxUqpT
 drPEAMGZVEmSDVcSJCtH/o3HDtdM5BcKWPlsmCndbSiRditKaolZ5LWz/gBrBBzHDA/T
 /1ZwkYBQQ1h4MG7UsewN99aOhwORb6nU+M+7YxMJ0fsVPStegrcfj1KPIKsvjqzOWNHB
 cSIe9wYZ8iq6miuBU9k2ansqeR7ypV5+D8/sGWX440mhmwsx9yY/PDLl9cM8Db+HYHZC
 m/bA==
X-Gm-Message-State: AGi0PuaOqJ9C8JAdvxXp7+l5RDEb0fvRNRngar7OFU3cpQ3fYqC6RPFV
 8Zdx+wOuZyxj/bcMF8dFQJYSfacRpllYEtxLZeo=
X-Google-Smtp-Source: APiQypL3YJRLn/CjDFWSkIcYSR70WFcO7nOnYCpUZp/Dvytozh01gIQHSjZZDOziBum8nxJbwwX/Hj3cpRG7hohBiiU=
X-Received: by 2002:a02:bb91:: with SMTP id g17mr29519507jan.88.1588170279522; 
 Wed, 29 Apr 2020 07:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200428144314.24533-1-vaibhavgupta40@gmail.com>
 <d33991cc-c219-dc27-7559-f30dd5f4aa0a@gmail.com>
In-Reply-To: <d33991cc-c219-dc27-7559-f30dd5f4aa0a@gmail.com>
From: Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Wed, 29 Apr 2020 19:53:36 +0530
Message-ID: <CAPBsFfDn2GV8=o63zBRDhHddNnH+jUiiNCB+WRPUqH1mZasEPA@mail.gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>, netdev@vger.kernel.org,
 Martin Habets <mhabets@solarflare.com>, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Shannon Nelson <snelson@pensando.io>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2 0/2] realtek ethernet : remove
 legacy power management callbacks.
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

On Tue, 28 Apr 2020 at 23:24, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> On 28.04.2020 16:43, Vaibhav Gupta wrote:
> > The purpose of this patch series is to remove legacy power management callbacks
> > from realtek ethernet drivers.
> >
> > The callbacks performing suspend() and resume() operations are still calling
> > pci_save_state(), pci_set_power_state(), etc. and handling the powermanagement
> > themselves, which is not recommended.
> >
> Did you test any of the changes? If not, then mention this at least.
> A typical comment in the commit message would be "compile-tested only".
Yeah its compile-tested only. I should have mention that. Thanks for
pointing it out.
>
> In addition the following should be changed.
> [Linux-kernel-mentees] [PATCH v2 0/2]
> Use
> [PATCH net-next v2 0/2]
> instead.
Sure!

--Vaibhav Gupta
>
> > The conversion requires the removal of the those function calls and change the
> > callback definition accordingly.
> >
> > Vaibhav Gupta (2):
> >   realtek/8139too: Remove Legacy Power Management
> >   realtek/8139cp: Remove Legacy Power Management
> >
> >  drivers/net/ethernet/realtek/8139cp.c  | 25 +++++++------------------
> >  drivers/net/ethernet/realtek/8139too.c | 26 +++++++-------------------
> >  2 files changed, 14 insertions(+), 37 deletions(-)
> >
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
