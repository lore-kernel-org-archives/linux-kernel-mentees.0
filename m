Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495E64C6B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 05:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kpMDlFef"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDDA860AA5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 05:29:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDDA860AA5
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kpMDlFef
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zOS3PXbmYeHV
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 23 Dec 2023 05:29:47 +0000 (UTC)
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A8EBB60A9B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 05:29:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8EBB60A9B
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-466de67f0d6so745984137.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 Dec 2023 21:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703309386; x=1703914186; darn=lists.linuxfoundation.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2rOcyFfxflN36gMhvNpR/DHK+BxldNKzckHr4V32hdY=;
        b=kpMDlFefehe85QRYd46Ii5ETRaQYZaUooxaozmKSLEb/C7yizUHvaLCLtRcOTkcbHA
         uBpHA29HzmCvzKMKS4SkFd5ilfyybHFmS0ptfltkl4VOvcnD2PR3XhsxBImoDM8HHuhV
         3bxCUKpYzR4+bxze9SU1ppgtHPPUk1U371Wsbcl3nLlzvQJNDbPv/zjnAMy71kx8KefP
         8knK7tYaWUkiRo1gozMsPGFxqB4ANwAdu7nwuvkMQqSXj1/PtCLl+s3q7WpnGEHGePCC
         EuqWCP2/QxzI11HrV4j5p1DxmI0tzMM2YSx5UipBLCnq2tIPP9BChpCgzd43vt5DDR5p
         9bgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703309386; x=1703914186;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2rOcyFfxflN36gMhvNpR/DHK+BxldNKzckHr4V32hdY=;
        b=mzZQuuyI7zMGabKEel0KigK3lz7y/B/MfQbUNZr2uXF3D6FqtOjBawyOOlKwSd6kOa
         B6/Tfw8+Z0pKq0jYnffmQGkB2tcUn5BjCSW6FOPlZjdLcMRdtH3LKi9mFgzD2Iic7McC
         vaVmFt4x0f/1MI84Pmlc4ozPSc8nJ4f0haLR9Q6D6nyGcKb9dDZaqglCUkURpUR4yMqX
         afLsbu9aFsLXnyA5gng0BKd9vsqfvpNfhtSLnx+/l0vSg9HnJtROobnWSNk8cCwCExyU
         YuLukADwo/C1NHejZajBPpQxsjfVoug9kxE4Cd+jR/hKvqylLtBTUc7gruLriTxb7HLE
         zDrg==
X-Gm-Message-State: AOJu0Ywl6VfMbuGnjQnmZ9DL0BUsSBEP/rmdpM1RX6mr9wxPhONr6Uun
	qtG5x76mEW7I7VDqE9F80oAM78Y1/8er11CZA04=
X-Google-Smtp-Source: AGHT+IGcwfl+nZgyqOI3mjw5SJycNNKtCTspNzLxl1V2itEH0srYxfsVRjfqZNbeYjSLhf1B+i9CeGZg5QXIxjJvYLE=
X-Received: by 2002:a05:6102:2ed:b0:466:e5af:2384 with SMTP id
 j13-20020a05610202ed00b00466e5af2384mr1195497vsj.23.1703309386228; Fri, 22
 Dec 2023 21:29:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231223051108.74711-1-kdipendra88@gmail.com> <d1c18155-9c8e-4164-a2bf-5eab3d42995d@infradead.org>
In-Reply-To: <d1c18155-9c8e-4164-a2bf-5eab3d42995d@infradead.org>
From: Dipendra Khadka <kdipendra88@gmail.com>
Date: Sat, 23 Dec 2023 11:14:35 +0545
Message-ID: <CAEKBCKP+-6=JuRYtHU7YVstfZzzbTdvm9L4PBvOWAgKj2xaOrA@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: pci: Fix spelling mistake in ia_css_acc_types.h
To: Randy Dunlap <rdunlap@infradead.org>
Cc: hdegoede@redhat.com, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	gregkh@linuxfoundation.org, hpa@redhat.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

Hi Randy,

On Sat, 23 Dec 2023 at 11:03, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi Dipendra,
>
> On 12/22/23 21:11, Dipendra Khadka wrote:
> > codespell reported spelling mistakes in
> > ia_css_acc_types.h as below:
> >
> > '''
> > ia_css_acc_types.h:87: cummulative ==> cumulative
> > ia_css_acc_types.h:411: descibes ==> describes
> > '''
> >
> > This patch fixes these spelling mistakes.
> >
> > Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
>
> This patch is an improvement so it could be merged as is IMO.
> But...
>
> > ---
> > v2:
> >  - Previously only corrected spelling  mistake reported by checkpatch.pl.
> >  - All spelling mistakes reported by codespell are fixed.
> > v1: https://lore.kernel.org/lkml/20231222200350.2024-1-kdipendra88@gmail.com/
> >
> >  drivers/staging/media/atomisp/pci/ia_css_acc_types.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> > index d6e52b4971d6..1dc2085ecd61 100644
> > --- a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> > +++ b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> > @@ -84,7 +84,7 @@ struct ia_css_blob_info {
> >               memory_offsets;  /** offset wrt hdr in bytes */
> >       u32 prog_name_offset;  /** offset wrt hdr in bytes */
> >       u32 size;                       /** Size of blob */
> > -     u32 padding_size;       /** total cummulative of bytes added due to section alignment */
> > +     u32 padding_size;       /** total cumulative of bytes added due to section alignment */
>
> I apologize for not looking at your v1 patch carefully.
> The comment above would be much better as
>
>                                 /** total accumulation of bytes added due to section alignment */
>

So, would you like me to change "cummulative" to accumulation or
should I wait what other maintainer(s) would say?

Thanks.

> And if the maintainer(s) want to take it as is:
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
>
> Thanks.
>
>
> >       u32 icache_source;      /** Position of icache in blob */
> >       u32 icache_size;        /** Size of icache section */
> >       u32 icache_padding;/** bytes added due to icache section alignment */
> > @@ -408,7 +408,7 @@ struct ia_css_acc_sp {
> >  };
> >
> >  /* Acceleration firmware descriptor.
> > -  * This descriptor descibes either SP code (stand-alone), or
> > +  * This descriptor describes either SP code (stand-alone), or
> >    * ISP code (a separate pipeline stage).
> >    */
> >  struct ia_css_acc_fw_hdr {
>
> --
> #Randy
> https://people.kernel.org/tglx/notes-about-netiquette
> https://subspace.kernel.org/etiquette.html
