Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21C91DED53
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 06:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753856519; cv=none; b=XWOIy0jeKj/4SNBHPoZtaccDkrlvKyFAiW/dALSJZHdopUHwBXDEStVDkUNlq3Gz20OdQph6acRMYiuKoS6/bPDjo7Wj6yf7DfObVemCLhNHVc11Kv5P9EyGHIb59O5b8OcJVNkwlJn0sZeSFYCo/mm9iguJ0XEBbDR/+mJjiDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753856519; c=relaxed/simple;
	bh=JNZ6D3nGRFd1xsk3HwOPijD+rO+P2HFJjzPwNSl5yOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d+f4kFy4kr4O+QmCyE3RAuk0UyZGBiIVIMruiH+iFoX4bEMeB2irOkNE2AJ7YepTsqp+GGluVXQzjmpH4n5aVUkdRXDFJiZnA965QqnlY9ptWZoiA9r8Ci7djPUTKiex1yp6Ukpo8NKcXdxGdx1tWSooH7MK6LlM+D0zLwstZaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKcmjmVX; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKcmjmVX"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-615a4b504b2so1058110eaf.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 23:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753856516; x=1754461316; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FBkTI/UCDoqQNlnpZlPe3NHTfCsdIAJow1MJiptYraY=;
        b=nKcmjmVXEONch3+ohzrX7Yo2wZRvahAwIspjvQ1FxFapQ479SVqPCipaSuK5bxePvg
         lY7t7fobAEv0UlVnWcgo/OF+dtgX2c//PZkFELIYFBZA3jOlKfwnsHLJvzhnEJFYIkQ9
         bOLyWcYeH4t26hBkUOAR44WSm6mfUtYl6Pld4t8rkt3MtU5soV/5gqhRQvaL6a4Ul/fc
         linZ8HT0wgOQNr7Y1vAIrnATEKA4grf8xv1UBXw8CEQyWJGQLWme4G1KUliXcAlDWujK
         nQqUGiyzjyfrR3xTvrzr2yVPj0CJVCJWJ7qsE95iHVi4oqfUg/q23xKh/abHlwgNVcdQ
         WgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753856516; x=1754461316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FBkTI/UCDoqQNlnpZlPe3NHTfCsdIAJow1MJiptYraY=;
        b=H+VBTE23FuALbSmfbt9Df1jTb5MDLzMnVP2hC91b7Uh79cbmJP2tb9sxD6AdC2Ehlu
         b/8YFY0KjDpxjtut2ECZOdZ+ADY5nWnSowg43bngKMtBm7MamaPQ+kaQwIziDcraA6J9
         4AXIZbMupbjkVTjrrEWWjRw3jc7Q2R4jnX6hJBvx26vW2FzGZcR2VWlq3YQaYcJ0hLSO
         n7tSQtAQJ4oxA2I19LZwGFUjnx2sYLc5X9qJyc4ozBEZBcB5IZEsVw8tw/9Nn/vUKfZS
         InFFVgNrzneh75Tg8TX1SdchmVCYTrC8XqarKMVx43plM4kzVzQdWFeADWegQo3CgxSu
         slLw==
X-Forwarded-Encrypted: i=1; AJvYcCVF2XICGJSmAroWCygFhueC6L50X4zsgQzpZ0cfykYpjo5wvfoKAUASJ1dMzNoV31Gkwd7588Lh8gsSn6Y5bDynEnwhhg==@lists.linux.dev
X-Gm-Message-State: AOJu0YynADRQQ+Gb40iYIHQ1SmLrvWQbNF8T2+KLomgb4JRQ1tMMQ5mO
	GrY9hz6kuHdAYrNqHVsparorL8ov0jHWYei4HmIftC3wynoBN43maJzaZVPFNlfAI+alcGqIXjW
	0A9Fa7/dW9T3bH+nKeSMdZUFp+8tcx7c=
X-Gm-Gg: ASbGnct6wdPVf2jBMVO0loPuvr2DLP20iNpl9Oc+Pb8Ya89+w1BLZg77Oi0xDoihgqh
	2YxC6rVNIjZu0N+5A38npZ6yEWsjIL1p2jEPLfYlqvBqbYR69Wnib/alFoNWxHzI4VCj2cxaoGC
	p4h4+biemg9+FavNCpqAeAOWKdXaSrLnzM3aehvcTmjG3agnE+NdqOFTEqxNs9BsrqFMgbbdzzq
	jTCpkao+lcUcwA4um8wvfWYVTV9qw==
X-Google-Smtp-Source: AGHT+IFhgRosSR72T+vNr0bx5hr3ciS38puiGjuj01JgbYBPEjB7f2hpeWkGLda67/RjHPy2kUR5TUoZLWCQGjWUJzc=
X-Received: by 2002:a05:6820:210d:b0:619:64d1:8b8b with SMTP id
 006d021491bc7-61964d1a470mr358563eaf.1.1753856516508; Tue, 29 Jul 2025
 23:21:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250730042617.5620-1-suchitkarunakaran@gmail.com>
 <2025073013-stimulus-snowdrift-d28c@gregkh> <CAO9wTFihpoVsf-SZYn6yUhCSuN9cBXFGWeGegDsS1QHk4wS7-Q@mail.gmail.com>
 <2025073024-musky-smashing-812e@gregkh>
In-Reply-To: <2025073024-musky-smashing-812e@gregkh>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Wed, 30 Jul 2025 11:51:44 +0530
X-Gm-Features: Ac12FXyTmCZhlXPJ6VHRvUCE8qUeiyA07qunSM3G46ojasxIgFGJg8XhQqlKO9E
Message-ID: <CAO9wTFiRCgFvyboh_K=HWYMtfgj3OGr=fcHFDkNBa9EHMyCtcQ@mail.gmail.com>
Subject: Re: [PATCH v3] x86/cpu/intel: Fix the constant_tsc model check for
 Pentium 4s
To: Greg KH <gregkh@linuxfoundation.org>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, darwi@linutronix.de, 
	sohil.mehta@intel.com, peterz@infradead.org, ravi.bangoria@amd.com, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Jul 2025 at 11:25, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jul 30, 2025 at 11:05:31AM +0530, Suchit Karunakaran wrote:
> > On Wed, 30 Jul 2025 at 10:22, Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Wed, Jul 30, 2025 at 09:56:17AM +0530, Suchit Karunakaran wrote:
> > > > The logic to synthesize constant_tsc for Pentium 4s (Family 15) is
> > > > wrong. Since INTEL_P4_PRESCOTT is numerically greater than
> > > > INTEL_P4_WILLAMETTE, the logic always results in false and never sets
> > > > X86_FEATURE_CONSTANT_TSC for any Pentium 4 model.
> > > > The error was introduced while replacing the x86_model check with a VFM
> > > > one. The original check was as follows:
> > > >         if ((c->x86 == 0xf && c->x86_model >= 0x03) ||
> > > >                 (c->x86 == 0x6 && c->x86_model >= 0x0e))
> > > >                 set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
> > >
> > > What do you mean by "original check"?  Before the change that caused
> > > this, or what it should be?
> > >
> >
> > Original check in this context refers to the change before the erroneous code.
> >
> > > > Fix the logic to cover all Pentium 4 models from Prescott (model 3) to
> > > > Cedarmill (model 6) which is the last model released in Family 15.
> > > >
> > > > Fixes: fadb6f569b10 ("x86/cpu/intel: Limit the non-architectural constant_tsc model checks")
> > > >
> > > > Cc: <stable@vger.kernel.org> # v6.15
> > > >
> > > > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> > >
> > > Nit, no blank lines beween all of those last lines.  Hint, look at all
> > > of the patches on the mailing lists AND in the tree already, you have
> > > hundreds of thousands of examples here of how to format things :)
> > >
> >
> > Sorry about it. Should I send a new version of the patch removing the
> > blank lines?
>
> That's up to the maintainer(s) of this subsystem, if they want to
> manually edit the change or not.  As it's the middle of the merge
> window, no one will probably be doing anything for another 2 weeks on it
> anyway, so just relax and see what happens :)
>
> thanks,
>
> greg k-h

Hi Greg,
Thank you for the clarification. I apologize for the mistakes and
appreciate your patience in reviewing.

Thanks,
Suchit
