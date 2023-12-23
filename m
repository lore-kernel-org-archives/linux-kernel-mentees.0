Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F2DD51D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 13:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QoElHdvv"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99776400CE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 13:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99776400CE
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QoElHdvv
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6HEeFNJp9VuD
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 23 Dec 2023 13:59:20 +0000 (UTC)
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0BA8340399
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 13:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BA8340399
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3bb945f88b4so562272b6e.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 05:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703339959; x=1703944759; darn=lists.linuxfoundation.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gFN/JWUQNBbz2Rt0TnEnzTMVqwHhg8TmRPTdu1IMZhk=;
        b=QoElHdvvzrt0WMcTOW9ftZz8tourjPirwFksaraSaT2bFG3HdIppxrePMM4tdyCV5R
         lyP7gtOgsiUhVb6yUNp1dG+sSEkk5EAWKQ1Y4tuYjyHbQXRnep70k1D6yOiEsZH2899K
         AiMesY7taFcaxVoKIVZDb0pIXas/0ICLdN3L2BVes5JP30EVnvReDqPo8Za1TjchqaGa
         tT6xsqrGQ0W4NQxhH8KySsNivCCnlG0clBIo+hJOuOmRI/Kva/1tbMSbT6Zzq8yxODc+
         2+c6bZHaVnRH7qrZnhiJ2UkATDUgN5H/+aJcGqWQG6+hxXQFiTWAUchlje52733xj0RL
         cY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703339959; x=1703944759;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gFN/JWUQNBbz2Rt0TnEnzTMVqwHhg8TmRPTdu1IMZhk=;
        b=tt/CE7FfniBY+rZVx5qzmzeH3SlC1RW6vBqgmQjOIH5xUgcNYC2XCECs4qjHO2CgfF
         Ok+s64NFhyk+BXgp+oNmo2iuUPREuXkoE+QsmiH+4bTyy87oy2gxUhz6ODvdiqdz1BRs
         D9uUmKLXMLm/6jsgpho3w509cPqQ8JMLKtcsBDgjiBpuemqPZx721abpVuPBDbNRVoqB
         A+e/QH0Y7WuW9XmBA8UaqJYfPeoxABJqJozHml+X709h37Tc/sZTvE1zOLatGorqpgUM
         ZjSZ0m99kviLhomNj+dqUy24bR4qhYl3NswFwzDUade/ImCWWyd3RZ+USJSE5x1cSnQg
         IY+Q==
X-Gm-Message-State: AOJu0YxZuorZ7eYL4cc+/1/GvYjbQrwxISS6LT7qV2BdzGDjN2+3J400
	GRC6+tYCuT31wlBn6faBoOzNcwVNbVyuV+Xi/9M=
X-Google-Smtp-Source: AGHT+IHwz+pyBOWd/p0WXliaxQNFzW48D6/37njGjyW5fHA3ep7uDmOJXRWiBiR23Yq9jf7X7MRC/eVJww1g5qgf9YI=
X-Received: by 2002:a05:6808:1303:b0:3b8:b063:6665 with SMTP id
 y3-20020a056808130300b003b8b0636665mr2526149oiv.92.1703339959003; Sat, 23 Dec
 2023 05:59:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231223051108.74711-1-kdipendra88@gmail.com> <d1c18155-9c8e-4164-a2bf-5eab3d42995d@infradead.org>
 <e7a46035-9c5e-495d-8f20-73dca4fec068@redhat.com>
In-Reply-To: <e7a46035-9c5e-495d-8f20-73dca4fec068@redhat.com>
From: Dipendra Khadka <kdipendra88@gmail.com>
Date: Sat, 23 Dec 2023 19:44:07 +0545
Message-ID: <CAEKBCKPA0-VKA_r+YsGVb0cTKEQpV0dXwU8ARZ07LGmWuH2_OQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: pci: Fix spelling mistake in ia_css_acc_types.h
To: Hans de Goede <hdegoede@redhat.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	gregkh@linuxfoundation.org, hpa@redhat.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Sat, 23 Dec 2023 at 16:10, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 12/23/23 06:18, Randy Dunlap wrote:
> > Hi Dipendra,
> >
> > On 12/22/23 21:11, Dipendra Khadka wrote:
> >> codespell reported spelling mistakes in
> >> ia_css_acc_types.h as below:
> >>
> >> '''
> >> ia_css_acc_types.h:87: cummulative ==> cumulative
> >> ia_css_acc_types.h:411: descibes ==> describes
> >> '''
> >>
> >> This patch fixes these spelling mistakes.
> >>
> >> Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
> >
> > This patch is an improvement so it could be merged as is IMO.
> > But...
> >
> >> ---
> >> v2:
> >>  - Previously only corrected spelling  mistake reported by checkpatch.pl.
> >>  - All spelling mistakes reported by codespell are fixed.
> >> v1: https://lore.kernel.org/lkml/20231222200350.2024-1-kdipendra88@gmail.com/
> >>
> >>  drivers/staging/media/atomisp/pci/ia_css_acc_types.h | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> >> index d6e52b4971d6..1dc2085ecd61 100644
> >> --- a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> >> +++ b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> >> @@ -84,7 +84,7 @@ struct ia_css_blob_info {
> >>              memory_offsets;  /** offset wrt hdr in bytes */
> >>      u32 prog_name_offset;  /** offset wrt hdr in bytes */
> >>      u32 size;                       /** Size of blob */
> >> -    u32 padding_size;       /** total cummulative of bytes added due to section alignment */
> >> +    u32 padding_size;       /** total cumulative of bytes added due to section alignment */
> >
> > I apologize for not looking at your v1 patch carefully.
> > The comment above would be much better as
> >
> >                               /** total accumulation of bytes added due to section alignment */
>
> I agree that that is better. Dipendra can you please send a v3
> using the new text suggested by Randy ?

Sure,let me send a v3 with the new text suggested by Randy.

Regards,

Dipendra

>
> Regards,
>
> Hans
>
>
>
> >>      u32 icache_source;      /** Position of icache in blob */
> >>      u32 icache_size;        /** Size of icache section */
> >>      u32 icache_padding;/** bytes added due to icache section alignment */
> >> @@ -408,7 +408,7 @@ struct ia_css_acc_sp {
> >>  };
> >>
> >>  /* Acceleration firmware descriptor.
> >> -  * This descriptor descibes either SP code (stand-alone), or
> >> +  * This descriptor describes either SP code (stand-alone), or
> >>    * ISP code (a separate pipeline stage).
> >>    */
> >>  struct ia_css_acc_fw_hdr {
> >
>
