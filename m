Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2276D1482F3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 18:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723141334; cv=none; b=aWW785Lc8gNaivod58KD5p0kqEstKU48fnv7xT6Xh8piR4Ix8lpbvOlS8Yc/nbqVYK/pg9qc72Oo4Pvv18SB56OLzXBUYMEUHOKjt+mixY4coq4KbRz+S0aDyM9uMvp14ANCiOVIO7MMiaSTe1MmRL0eIlnZLLzFeA+CSa8wVAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723141334; c=relaxed/simple;
	bh=vCJXBYmY4J5i4Hw/5HtUjNhK3MxmA+PZF/XCCIBEAiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSKpCj1vEBflnBZBEqSV0Fyviqlj8aP3hjGUS6rYV9VH4LvIWIFV4itlQyPpBD6i1EE+3/JSXecsFjcgldGTxzkw8dgD1SLcMc1sjpEunXtcXivjDicPcuuVE4LHmzEm6ipp0+eq3NPrOgaUupt7f5OWCEEbxLKctYXAINfIeV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dbDyeO5o; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dbDyeO5o"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE608408C5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 18:22:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PZMnkrPn7whB for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Aug 2024 18:22:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=ricardo.marliere@suse.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7DD96408B6
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DD96408B6
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dbDyeO5o
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7DD96408B6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 18:22:10 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2ef2d96164aso12646671fa.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 08 Aug 2024 11:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723141328; x=1723746128; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LxUGIC1d9QWtCKk8HcnHhSHmihe+JJ2GSkLOcfHhEb0=;
        b=dbDyeO5ok4rye2guE+cFVS/97vRdo6wkHtUcYLFFXemoUpwJsxi83xy4MksbE7TAk1
         V/WGxOtfXQQgH43vD2cc9iKZRFE8H96RhgRYx7SK99qDeQe0Q+pjh6csl37IM3gixN5v
         vvYTZ9fOYhiq8rx6iDudjQOwd9seE4z89msunDUx/ODRe1hhOVExRWZKTjUxoKS8AHFz
         uDddsUq4L7kQl0rKafhm/BPsMc9uZEdTYnOBAFcfzFnzxjoS5kjHdDJdjbae5x5OltHi
         hfpxub1QKYhZckn0q0epniK3bh6VaFN/2Lwio8Zf6N2zhMlzZha02+yjHCcu3czK3303
         F7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723141328; x=1723746128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxUGIC1d9QWtCKk8HcnHhSHmihe+JJ2GSkLOcfHhEb0=;
        b=p//rJVeacKBOuoeLlr79qp+iJhYnJnvXUpGcqKPhDnQkKhIpNElRjPLkP62xv1tORi
         C73ffQ9xbYjeSyAOzLENTMBO0QbxC47EGBDDNn+ZrQ+W1J1VipeJ/PXt9ODPLMCv1HOF
         gGzG/qQrqD2D4JzmdqiUWq1ALO2woRIrkbyznt8ZMIo6SGESz3+dLzxZ585XydlXXufU
         Me8FhgJzsfj6Sgu+jVTm5WA6heDweD7kBkozCRXxcCiNLli88T1Lk0L6+FEp268jXDLP
         jFH7SNm9xcBfWV5ZUV4k99NRwVovldbdcDRkyK95d7AGfMfpJSUASJQ47G2Qb5fFBHcj
         /ikQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRMvh5OMr/3q+TP2xAdKH81jWmZxgklVmQMUR7Gkys7yQ7rh4LfxBr+mgSLVqOlqLDsmlb2m/namGv7Im6twjajmkhysFUNHRcnEM6M81+FlIhJ9xTaQrXdD9ZaYJY
X-Gm-Message-State: AOJu0YzVtSIvmEJvtuBQAI2HEichuBjFFAXDh5Fbedb3575CMg81s4S3
	nl26ZxZ9O+mYpaIQeTijuwZECnhAN4hx66i5MLaVbq9GNQM1W9CXbsCrVASTVF8=
X-Google-Smtp-Source: AGHT+IHMiv830wRXkXxcDZYJsUEuEmdEEyX+Vf41Fz2A27WNL3UjNvcBm1x4hrA1Sd7/qtg66VMwcQ==
X-Received: by 2002:a2e:9788:0:b0:2ef:29cd:3183 with SMTP id 38308e7fff4ca-2f19de85f0emr19845601fa.48.1723141328340;
        Thu, 08 Aug 2024 11:22:08 -0700 (PDT)
Received: from localhost ([2804:2484:804e:2e16:dcc2:6ad2:464:9a29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff5929407asm127965975ad.242.2024.08.08.11.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 11:22:07 -0700 (PDT)
Date: Thu, 8 Aug 2024 15:22:03 -0300
From: "Ricardo B. Marliere" <ricardo.marliere@suse.com>
To: Pranav <pranavsdreams@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] Added extra word to Extra Version
Message-ID: <es4e72wzy5f72qwczkjqakcrv2qjgv4abg2mgpdghshzozfzvd@vd37o3bblisv>
References: <20240808154824.13390-1-pranavsdreams@gmail.com>
 <2024080800-reply-fineness-f5b8@gregkh>
 <5cehhbme7e5jvwqv2aolqbmwrm6m6ttaxjifxew23wbhahombz@uupdjxrtu7ec>
 <CAOP7HdfENwO5M3mHQeVwur02fWgT9Re_VQRanrSXxbS3U9VfCA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOP7HdfENwO5M3mHQeVwur02fWgT9Re_VQRanrSXxbS3U9VfCA@mail.gmail.com>

On  8 Aug 24 23:35, Pranav wrote:
> I am extremely sorry for the inconveniences brought to you.
> 
> Also hope to submit real patches in the upcoming years.

It happens, don't worry!

BTW, make sure to *not* top post in the public mailing lists ! :)
> 
> On Thu, 8 Aug, 2024, 22:46 Ricardo B. Marliere, <ricardo.marliere@suse.com>
> wrote:
> 
> > On  8 Aug 24 18:21, Greg KH wrote:
> > > On Thu, Aug 08, 2024 at 09:18:24PM +0530, Pranav P wrote:
> > > > Signed-off-by: Pranav P <pranavsdreams@gmail.com>
> > > > ---
> > > >  Makefile | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/Makefile b/Makefile
> > > > index 8ad55d6e7b60..9a4012a08c0f 100644
> > > > --- a/Makefile
> > > > +++ b/Makefile
> > > > @@ -2,7 +2,7 @@
> > > >  VERSION = 6
> > > >  PATCHLEVEL = 11
> > > >  SUBLEVEL = 0
> > > > -EXTRAVERSION = -rc1
> > > > +EXTRAVERSION = -rc1-karuvally
> > > >  NAME = Baby Opossum Posse
> > > >
> > > >  # *DOCUMENTATION*
> > > > --
> > > > 2.34.1
> > >
> > > I don't think you meant to send this to me...
> > >
> >
> > I'm assuming he sent as part of the application process for the Fall
> > term of the bug fixing mentorship, but forgot to strip the public
> > mailing lists :)
> >
