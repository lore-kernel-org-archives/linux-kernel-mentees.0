Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA021DF977
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 14:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753887529; cv=none; b=AZuwIZ0/2uUyTUHrQZX3JBwMB4WFv1kVg+FQApmHSokmn0ueU0JGNLhf3aud6ss+AjqHuSrfdxmaGtK0dM9K/2ESX1YQl0ROhj6qaYZFiieAKwhZ4CNkTYtAwnctAtKSs8kGQReDCaXeTHoSDXfiGB+2JV8I6OULJsMXN9EUPGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753887529; c=relaxed/simple;
	bh=C8HNY5HrTEJgbJiCn3KWLtJZd4ppcT6oiyB2Iuk/LqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mw5MKWhjdE6ZlBKLnXM3Zcfa3uefsFqn6YiWsf6uZ3lS9Y+8AtetlXbJGQXTP8/XqRYUoN3hRRPgg0syQUESop729F4FtPpzWQcvAQeXDyB1aqpfccWzyrRN7ukBnJqw4guqHq7/jzAFHkCJ20l3kS/INWO27LVTCs/TI20wcuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcIO302O; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcIO302O"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2ff9b45aec2so3257192fac.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 07:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753887527; x=1754492327; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MWkLwfL42VeqtXqStyy5GMMrcz/TRHF4ZuSrJiE4Kuc=;
        b=WcIO302OlCvmdsEM8BJcUX76y2/dGA0RzxuU2KqBPayYxOe7K9T+Wen8/ry2/c/uei
         /rn9ARDViAdCqx/SBi1tbcrQnhvn986sr1X4R/mbmUBTEFGgUEhdgj2t56tcm+K5dTai
         VYbnnR+qe8gDKBDPHvn4tlHssc56ghRiJBSkEm4JyvV2u6XbAknPlakh/2UWCmYptV9m
         wCDRlyoFtmNzH258KmSnLHfiO2lBviLc1EARCjUB46abm+UQ7YuSz8CYyWz+4u+FHtzH
         DnFNC2agN76lPI/x6mIQAijmVbedFVpUSlcAnnaucAlyLq/R3068uRAFvLzv4sxtEg2K
         kCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753887527; x=1754492327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MWkLwfL42VeqtXqStyy5GMMrcz/TRHF4ZuSrJiE4Kuc=;
        b=bGEzRmgSyV5Qt6BWhtnugLCIm4sArkNoXX9ErbDOxSL3fu8XqmY2PA0GsvdCMya07y
         V3hJmR3uX2eB1uu93y/MMYCSIpzN8YUS2bpOHJACKCuZOLjLpQ1OO0gxRuJ5pH+qFboK
         jaFVnNEBchIg8eccBMs5ls2SQxjlVARZa5H5AWtSeN7VCFd3f/9bj3ioVuMKSZ0XuwWR
         JfSycSPx3T9RcUC9NyR8okm+MQ2iRY/bAQlfc9s+OFIIQNmJJQIqb/nfoz3gU6qNRkSf
         0de9p+HAcmRrXjEfqi3oLxo4UijxVas0A/mXgqbBNOb7Mkw8mHutofbLQZH/YPesbqZD
         9k6g==
X-Forwarded-Encrypted: i=1; AJvYcCUS0E0MHcRb7un3czVRsHpoRJNZbb61hlK5q5BpXVtumKjDXjx/9DVgtZFs6i0jp8KANt4nETYXu88oOvNReAsAZ0fxZA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKQde6pAORKgF+2LldHC0QT/EEo/rpClSZDrlxI9eJhSMyuGGH
	iopkxgcE2A6ILLYC4WrIlek85aAJv991oahjvSBbP3Xl2bp0qyIHk8Dam7L1ZxN2CUP7NJLFMQi
	pn4GvNNKFFoFQgjYzr+zP8BK1zF9mrqXfFrb8WP/C1w==
X-Gm-Gg: ASbGncsyLTaTIdtie3+ixstUxtskD3FwI9lbv+fU0r9RGkk7in/yvJoILHInkekKmbo
	DgYpApxraLZ+o7pYmmohM0/z4q2trjPPzbHR7dRdKYj3+TGvtcYj+lyG5DNYo0pvnjbnjRGDG/I
	ZjuUDRFhIgztCp/ydKRKXHDEXe1gfcv+NknR64QdoPLpBSmIlurD+yC2CnUgrTn6rshukEGitB0
	GWjoJCl
X-Google-Smtp-Source: AGHT+IGT85piwykesRKtJ7B/VJqeCTiZL6elNW4hZYCO836mZ7x5jTfgmlLs+0Z9HYwu1pmcJMXsdJZ/qK2GYuEY1KQ=
X-Received: by 2002:a05:6871:789:b0:301:db6b:45dc with SMTP id
 586e51a60fabf-30785a1fb29mr1868007fac.11.1753887527133; Wed, 30 Jul 2025
 07:58:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250730042617.5620-1-suchitkarunakaran@gmail.com> <30f01900-e79f-4947-b0b4-c4ba29d18084@intel.com>
In-Reply-To: <30f01900-e79f-4947-b0b4-c4ba29d18084@intel.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Wed, 30 Jul 2025 20:28:36 +0530
X-Gm-Features: Ac12FXz5CxoabAlr444m-BoD2XsYpfb3-HiNQHW1O69JmZ6KNq7xPSsrDQlJwAQ
Message-ID: <CAO9wTFhZjWsK27e28Gv2-QqMozns47EacOQfXtTdMfLjR98MTw@mail.gmail.com>
Subject: Re: [PATCH v3] x86/cpu/intel: Fix the constant_tsc model check for
 Pentium 4s
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, darwi@linutronix.de, 
	peterz@infradead.org, ravi.bangoria@amd.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Jul 2025 at 20:12, Sohil Mehta <sohil.mehta@intel.com> wrote:
>
> Hi Suchit,
>
> The patch looks good to me except for a few nits below.
>
> On 7/29/2025 9:26 PM, Suchit Karunakaran wrote:
> > The logic to synthesize constant_tsc for Pentium 4s (Family 15) is
> > wrong. Since INTEL_P4_PRESCOTT is numerically greater than
> > INTEL_P4_WILLAMETTE, the logic always results in false and never sets
> > X86_FEATURE_CONSTANT_TSC for any Pentium 4 model.
>
> A blank line here would be useful to separate the two paragraphs.
>
> > The error was introduced while replacing the x86_model check with a VFM
> > one. The original check was as follows:
>
> Maybe to make it more precise and avoid confusion.
>
> The original check before the erroneous code was as follows:
>
> >         if ((c->x86 == 0xf && c->x86_model >= 0x03) ||
> >                 (c->x86 == 0x6 && c->x86_model >= 0x0e))
> >                 set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
> >
> > Fix the logic to cover all Pentium 4 models from Prescott (model 3) to
> > Cedarmill (model 6) which is the last model released in Family 15.
> >
> > Fixes: fadb6f569b10 ("x86/cpu/intel: Limit the non-architectural constant_tsc model checks")
> >
> > Cc: <stable@vger.kernel.org> # v6.15
> >
> > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> >
>
> Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>
> (without the blank lines as Greg mentioned)
>
> >
> > diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
> > index 076eaa41b8c8..6f5bd5dbc249 100644
> > --- a/arch/x86/kernel/cpu/intel.c
> > +++ b/arch/x86/kernel/cpu/intel.c
> > @@ -262,7 +262,7 @@ static void early_init_intel(struct cpuinfo_x86 *c)
> >       if (c->x86_power & (1 << 8)) {
> >               set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
> >               set_cpu_cap(c, X86_FEATURE_NONSTOP_TSC);
> > -     } else if ((c->x86_vfm >= INTEL_P4_PRESCOTT && c->x86_vfm <= INTEL_P4_WILLAMETTE) ||
> > +     } else if ((c->x86_vfm >=  INTEL_P4_PRESCOTT && c->x86_vfm <= INTEL_P4_CEDARMILL) ||
>
> The alignment here seems to have changed because the extra space after
> INTEL_P4_PRESCOTT was moved before it. The current code has alignment
> matched with the below line. It isn't a big deal, but keeps the code
> easier to read.
>
>
> >                  (c->x86_vfm >= INTEL_CORE_YONAH  && c->x86_vfm <= INTEL_IVYBRIDGE)) {
> >               set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
> >       }
>
>

Hi Sohil. Thanks for reviewing it. Should I send a new version of the
patch fixing the minor issues with the reviewed by tag?
