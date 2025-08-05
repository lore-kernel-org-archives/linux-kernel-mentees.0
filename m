Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B038C3597A
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  5 Aug 2025 04:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754368115; cv=none; b=J+/jSCUqGYTrIfcDRYlOWzlQziEIx2Az3r5vFAmyGRtkW95ZZ9mTtuCMESbbs0oaArAG3XAZIeK2b0D8HRwHsE6jwo1PWsgnJJSZN1fn8yk5AlzCTaD98bTWCwVnBGcOJwUNcCfgYrrOoiJ7h7+Wq2QLRiXQumgkl8V2rLvywK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754368115; c=relaxed/simple;
	bh=R7Dy9xC26bS/WYJ9jhY/pQBJT6iqPWi+su3GVktjtW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GgckIbHgBX3tgYMg+QbIlUl+yu3muKF+w+VL/qNthWfGttgMNpK5OnShHcCTAP03fq1Vhj8RFadWYFtct0bt9qHecocOMYqVddwPS/9/5rPoYYFEsVWIspKzzjOgILSIhRpbGGXKl21EzvIck3B8FRa+6DT1yjZPdhc+9VL1wyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=izt2piYQ; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izt2piYQ"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-741b6fa3456so399622a34.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 04 Aug 2025 21:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754368112; x=1754972912; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pUaJblhwWLjukDVkQiujzO4oHldTFPlVwTgtmkljHAs=;
        b=izt2piYQWRQK7QprVm7mWxvlbFUKiN6yztPO3KwTLS/nKWjua9wPihz7OFvCHhSgr8
         LQkwZFQpDZO9DpbnRe6hnspObVGnnngNhdPQQXkH+vfIFfJsPSd2oY3pFoJm8+iAuX2N
         cdNCbEzLkstUt5Qjkuczjd1iGZp2sNOgQvslyHzv0JKfvasWUOAkhG0SL4SSesGOhv7q
         La+3U/+3cT523AcZloM6pgaSLSFp2BuTdDU+Tgz3EIAl4vgzP5wsjzYYi8KqL/DEUQX/
         pqoet0RRNppdYIpjVHR8bJzLXrrjqU71uYhKkH2y+iNlHri5ml7rEiAQGHSgnrcbN75M
         yGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754368112; x=1754972912;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pUaJblhwWLjukDVkQiujzO4oHldTFPlVwTgtmkljHAs=;
        b=roiIviBa5yZ6hTugJctkq0PBORFhzNyYDuODHE0N5mbMIafeWjpek9onlLAFYHtjSD
         O1iCczXtUY6XCXKWuMNS489KDTDmw2eULgWmw4eiUYOg/+hIffcLJVpKcyGU74UuB+Cb
         RLNq9FaBcaGhJTXNIkNS+Sh+xccOoaLjdYQWn135k/APua1Iusg/iKKqjS/2knuMDZdX
         nHNbeYXEQrsE2Irnlnco589rAulGLOj4YrSk9d9G1v5mzkmn6X3vPq5G1WkVkOtlFsPs
         LENSDQ9M80P6vfLIN9ZLQ9LY7JyGsiYCqG1djkgAA3BYnlUkonZzZvC+QL0MFk/WQzxK
         3CRw==
X-Forwarded-Encrypted: i=1; AJvYcCXJojAjpolY0PQWBnsvDaUMxLi1dNtXwk9GU5WUUwkfZa9+YRs1qSNpP8HFR6QBcYGRX1InrSCs8EbGPCb4dMhPdpy8qA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwbvjoBLolQLiAkAOPBflQ8Zt/G1akwiWfSdgpt27fs6dTWcZal
	jp2nUAaDlS8/Qz2fK1mXi6DCgNbHUPX7GhUZenjJ4Qg6DSn3g8may2IlvQV7c3TYfTQWG2s4TV0
	FFaijxVu8bvdLqDweIE9xqwd5brAIAZg=
X-Gm-Gg: ASbGncuke5SixmDSEXxsevPmLI3ovcKXNc5SZygcFP3odncTB34c6d4sN2Kh46wzCyR
	X8Hmh++qVgRxTDjtI2nHNPwK8hHh9m21S2IH0NhIpCRG3KUIrPrztuQzGWjA/5BmfayB7uCSk85
	EpMojEGIt5xUo83zki25aSNZVDfTsKXV3DSKvseK+itBtzhjzozFpaKFkg1SZjDxcM1l8kK+RY8
	CKgvNq0eI6GbLYhxHo=
X-Google-Smtp-Source: AGHT+IFIS1hFyYOw/9z6OJKAUPK2nSzN8AAYXHZ9FkI4yxF1y66ZgTuQnJuTQv+2chhzYF8MdeJXC/Mkx+G6boaagR4=
X-Received: by 2002:a05:6808:8817:b0:433:fa6d:9104 with SMTP id
 5614622812f47-433fa6da581mr4488124b6e.24.1754368112374; Mon, 04 Aug 2025
 21:28:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250804175901.13561-1-suchitkarunakaran@gmail.com> <e72b9895-c143-4818-901b-7d8ab26b8e91@intel.com>
In-Reply-To: <e72b9895-c143-4818-901b-7d8ab26b8e91@intel.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Tue, 5 Aug 2025 09:58:21 +0530
X-Gm-Features: Ac12FXxcxa8VGuquMz0SHNBAIz0-JkLlAXxmrFhAbK7ZsWIdngczcCwY7oz2ODc
Message-ID: <CAO9wTFiy0FjY61Czs3Zz7MyS3OxHS0=2+nbf+_yWYAEKYr=YBA@mail.gmail.com>
Subject: Re: [PATCH v4] x86/cpu/intel: Fix the constant_tsc model check for
 Pentium 4
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	darwi@linutronix.de, peterz@infradead.org, ravi.bangoria@amd.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 Aug 2025 at 02:07, Sohil Mehta <sohil.mehta@intel.com> wrote:
>
> Hi Suchit
>
> I would strongly suggest spending more time understanding reviewer
> feedback and incorporating it before sending another version. Most of
> the comments below are a repeat from previous reviews by multiple folks.
>
>
> On 8/4/2025 10:59 AM, Suchit Karunakaran wrote:
> > Pentium 4's which are INTEL_P4_PRESCOTT (model 0x03) and later have
> > a constant TSC. This was correctly captured until commit fadb6f569b10
> > ("x86/cpu/intel: Limit the non-architectural constant_tsc model checks").
> > In that commit, an error was introduced while selecting the last P4
> > model (0x06) as the upper bound. Model 0x06 was transposed to
> > INTEL_P4_WILLAMETTE, which is just plain wrong. That was presumably a
> > simple typo, probably just copying and pasting the wrong P4 model.
> > Fix the constant TSC logic to cover all later P4 models. End at
> > INTEL_P4_CEDARMILL which accurately corresponds to the last P4 model.
>
>
> Please use proper spacing and line breaks. Posting this as a single
> chunk makes it very hard to read.
>
> > Fixes: fadb6f569b10 ("x86/cpu/intel: Limit the non-architectural constant_tsc model checks")
> >
> > Cc: <stable@vger.kernel.org> # v6.15
> >
> > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> >
>
> No blank lines between these 3 statements.
>
> Please take all review comments seriously, even if they are nits.
>
> https://lore.kernel.org/lkml/2025073013-stimulus-snowdrift-d28c@gregkh/
>
> > Changes since v3:
> > - Refined changelog
> >
> > Changes since v2:
> > - Improve commit message
> >
> > Changes since v1:
> > - Fix incorrect logic
> >
>
> Patch-to-patch changes go below the --- line.
>
> You have been provided the same feedback by other folks as well.
>
> https://lore.kernel.org/lkml/61958a3cca40fc9a42b951c68c75f138cab9212e.camel@perches.com/
>
> https://lore.kernel.org/lkml/2d30ee37-8069-4443-8a80-5233b3b23f66@intel.com/
>
> If you are not sure, please look at other submissions to the mailing
> list that do this.
>
> > ---
> >  arch/x86/kernel/cpu/intel.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
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
> >                  (c->x86_vfm >= INTEL_CORE_YONAH  && c->x86_vfm <= INTEL_IVYBRIDGE)) {
>
> Again, this changes the previous alignment. You do not need the extra
> space before INTEL_P4_PRESCOTT. Avoiding that would keep both the lines
> aligned.
>
> https://lore.kernel.org/lkml/30f01900-e79f-4947-b0b4-c4ba29d18084@intel.com/
>
> It's acceptable to ask clarifying questions, but disregarding review
> comments frustrates reviewers and inclined to ignore future submissions.
>
>
> >               set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
> >       }
>

Hi Sohil,
Thank you very much for your time and the detailed feedback. I
sincerely apologize for the repeated mistakes in my submission. It was
never my intention to disregard any of the review comments. I was just
focused on the commit description and, as a result, was careless in
properly incorporating the prior suggestions and formatting
requirements. I understand how frustrating this can be, and I truly
appreciate the patience shown by you and others throughout the review
process. I will take greater care moving forward to ensure that all
feedback is fully addressed before resubmitting.
Thank you again for your time and guidance.
