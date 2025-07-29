Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9B328EBE5
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 15:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753801209; cv=none; b=MSBtigaUjg8kni8ngQa6K2mym80zxEqxCQ8S+T3d66NDVSZcYIiqZOYQi5fsRZHuSDfbsrxy2VXvdPwB6NmuRMrpvwOZd12Ssw7ilE+PAbi0UYImjSEEDYoQ7NxG9agEL84snwxDjVYoDGzWF080r6zC8oL41r1HHi65HpXf5Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753801209; c=relaxed/simple;
	bh=EwjSdytWW9gUZqnvlQRD7pMbE0e0WkLC+veaoAgiixI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rqf8UWcagVrUUDccBVYmla720jOtfhZ0uUdasMRcyJyZiLUZNgYHAtdOgjDjXFITMXnpcua7y7vrIHTry9u6yum2TyhQb53qzbjMxgGn5gBoE2SJUIhqfofHFPlosi0uu+BCWjbgSsbfTUS2WAhNouzSBBGeW96JeQ/jFXQvGHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gq+H9WUi; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gq+H9WUi"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2ffaf8283faso3374430fac.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 08:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753801207; x=1754406007; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C4F2IyA53fJUkXZJdbFacQRwrzvQMOEeujGzyXBBH6g=;
        b=Gq+H9WUiEgGeWX+HH/V7eF1rz628rUiHBIRdtCCi6jIuh4N1CN2NJCXNcKsjczgif+
         ImI147KKIbxgSU5+MVh5mM3gUz04V4e0G+qru44ruz2Dd+AsB0ZyGGEZlousekfdvH8r
         /Ep5eqnRUYPby6yugSrLncyQQkZm/0v3gn+0YBfChc0ahqu5kmxbgs4jUA0Xu2MAQowe
         XWSuSbiQ2D2QGoy4xGWW/YrhLuJAQW64+BwMdbE7F7mGszBJkZpXAdTVznE1p0P4rO85
         gAT2ZMEcBSc01+ee36lmmJonZ59wv1oRSZAsfneDC2USbcZm851yE1I+tE6EYBT9x5Iv
         QrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753801207; x=1754406007;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C4F2IyA53fJUkXZJdbFacQRwrzvQMOEeujGzyXBBH6g=;
        b=JuJ2kDh0FzBrRrwqMlAWVMGgEduTgDlLu6mJu6ptljWKaYjV3qP6k46tdPitGzLjeJ
         KophsgLmTKuT6yxFldX3NX5upeZNuknqj2P+jtLWNSPUlJgeFgCSDQpKYokUhifM+L7H
         +VhbdC6VxZM7xI4M0h8TpyoUOXal5Aspbtpjtfu0qHmypn2r7TeIc8Glh1EHTzQLhvtD
         CPwrgbweQIk1RiuyR8I9TYmQIP9hZcFvvKJ5uAOAW1yr4aA25I53MCixum8IdLmC2CIs
         mxlzHrIs/Rxm0S8niKxsjndrhge2Xilr4D+nEVaLvIvWMmY8rXuqjQOme3zHAm63D8/o
         NqFw==
X-Forwarded-Encrypted: i=1; AJvYcCWmZLMfN//JgJqQk0+Z+4U+cyDlFE9ESDXRnjI84vWzffmV39Tbjoy+EVPZVpauLOX9CymAliq/DdlMqMpJUAJ6OmZ9mQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwNoSOmVh6EKvhAUG0eOI2XAvmPd4N0up/ox5bPUlSdyc3nsVt1
	TCrz8wqqO8SowkWE0h4xnPqRUj7hwMVPMj1hCLnTL/sWpSaz9dQ8BNSUvAzztQgsbCCjeD25t8d
	AEvDhxNIHkTz0IvG0PLT1Peo6aLC6gmk=
X-Gm-Gg: ASbGncttJbK7ivKB7mEMOUBPb7q+l+i5f/f96l26VNozBJnmQQz+QagvQXWtdi0WJ+z
	kMU3viuVkhvss0H+SeYpkXvfXnkvoyPxB+XH9S6dqGiYXd3GmoHjF+lprPMNcZVObzTOGoD0icl
	5fSxoQC740l/6Tu/dqvOgsbjQUbB+aRI2GRh0aIHkATXj8D+4IXGPabJ1hiMnTov3g7LV6PxXjI
	ENZneQD
X-Google-Smtp-Source: AGHT+IGJojF6PlhcjrA1wNjXCzUyTV7RWaNo8a2BsfvF8gdMqVZlc9grq7l4y4hEKSuakuE45Fo4LXiFWn5Tzojrkyo=
X-Received: by 2002:a05:6870:f214:b0:2ff:a805:52dd with SMTP id
 586e51a60fabf-30701b3379dmr11268693fac.26.1753801207071; Tue, 29 Jul 2025
 08:00:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250727125044.101779-1-suchitkarunakaran@gmail.com>
 <61958a3cca40fc9a42b951c68c75f138cab9212e.camel@perches.com>
 <CAO9wTFhCb7gDEo+q2SAZcn2KdUyVe-fG1E4bR_+US9k2J9DOnw@mail.gmail.com> <2a2bb7879e22208205fbb8f9bc56fb3c882bc307.camel@perches.com>
In-Reply-To: <2a2bb7879e22208205fbb8f9bc56fb3c882bc307.camel@perches.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Tue, 29 Jul 2025 20:29:55 +0530
X-Gm-Features: Ac12FXzg9mbgodopTzeTXNVIrBbNoBUtuTp7uwzcdL-XJ63aj7BA7fR9oRxzLxA
Message-ID: <CAO9wTFg5g5GjY=g2T6m7-jbAg_0U+OttpspxNQZ8ONK=gGJHCg@mail.gmail.com>
Subject: Re: [PATCH v2] checkpatch: suppress strscpy warnings for userspace tools
To: Joe Perches <joe@perches.com>
Cc: apw@canonical.com, dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Jul 2025 at 19:14, Joe Perches <joe@perches.com> wrote:
>
> On Tue, 2025-07-29 at 17:15 +0530, Suchit Karunakaran wrote:
> > On Tue, 29 Jul 2025 at 15:54, Joe Perches <joe@perches.com> wrote:
> > >
> > > On Sun, 2025-07-27 at 18:20 +0530, Suchit Karunakaran wrote:
> > > > The checkpatch.pl script currently warns against the use of strcpy,
> > > > strlcpy, and strncpy, recommending strscpy as a safer alternative.
> > > > However, these warnings are also triggered for code under tools/ and
> > > > scripts/, which are userspace utilities where strscpy is not available.
> > > > This patch suppresses these warnings for files in tools/ and scripts/.
> > > >
> > > > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> > > >
> > > > Changes since v1:
> > > > - Create is_userspace function to check if the file is in userspace
> > > >   directories
> > >
> > > the changelog bit should go below the --- line
> > >
> > > > ---
> > >
> > > This
> >
> > Sorry I will change it in the next version.
> >
> > > >  scripts/checkpatch.pl | 10 +++++++---
> > > >  1 file changed, 7 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > > []
> > > > @@ -7019,20 +7019,24 @@ sub process {
> > > >  #                    }
> > > >  #            }
> > > >
> > > > +        sub is_userspace {
> > > > +            my ($file) = @_;
> > > > +            return ($file =~ m@\btools/@ || $file =~ m@\bscripts/@);
> > >
> > > All other sub uses start in without indentation.
> > > Please move this next to other sub blocks.
> > >
> >
> > Yup will do it.
> >
> > > Please do a git ls-files -- '*tools/' and see if too many other
> > > files are matched, especially the Documentation/ ones.
> > >
> >
> > I didn't quite understand this. Could you please elaborate?
>
> The search pattern m@\btools/@ matches files other than the
> first level tools/ directory.
>
> It also matches Documentation/tools/
>
> Perhaps using m@^tools/@ to match only the first level tools
> and change $file to $realfile to make it clear it's not
> a/tools or b/tools like the diff filenames.
>

On a related note, should we also suppress warnings for the
Documentation folder?
