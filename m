Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CBB1A238A
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 14:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753800283; cv=none; b=TjNQhS25Wlthp4xvvvBRYy5HeJ7P6xKCDrtL2zv7C8xu/AQW4KrwVovY1K6jnugW/1FQ8QIV44ch/3BaRuhWA8DgBBoeduqW7+mv85Lr10dzjnRPYqGtiXot1IbeOq0CHVH5NjFcOhjd/1z2Mvx9hOtCtMLvE0s1SsESw964nR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753800283; c=relaxed/simple;
	bh=fMjKw8fJE6/DYyPVFlL4viEYITAF/89CcAe+AzMPyE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=skNK6iHk+TBmngl0tfs/9ERH9lvDJeKZ530B7Ib1O8V9vp4ZeLUMKvzBsntXZ7FbVEySPveX8FMrGgGVy1bTVjktxixW1z2YT/kv/+RwAXP5PG+SxxHf3rh3Qzw24VguuDEtdSpk95yX0hoJRFCP5mZsl5QiPuw/Z7WBWJedW9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQgfHsRy; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQgfHsRy"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-30008553e7eso2494543fac.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 07:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753800281; x=1754405081; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e58Oz7oUEhQLUk8T4Mqsd2AZ8HqT3w/u9Zdk0j5kkxw=;
        b=hQgfHsRyTKKSJoivZWO5MKom8M287MAEHwnufcPtgGRNkAHdPEj9Wva3VSZVW01S+m
         sg2cm8mUEavSxfYVRrpyNJXJdLdH/L2PdjAAowc35Y1CvGnQSGgmo9Hp71eETwL8nQcp
         3/5gJLstufuOAGt6U5fUHZG9kQWpJgoxwgBicMWePTltIX815PUOgjBrWA8IE7OnwXif
         mGnKjJt9kxbA476zZTuxQyRQ2NUxeGgFQjBgeNjb6o9j5azbrzGahxzPpvLlvANNFbbT
         z9vRcXrBpi1RTBGOqPT22Gw6CmQZiAeqdH2sUPoHff9phmAKQhB5xqnFSm1Bhvu7ak5p
         pFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753800281; x=1754405081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e58Oz7oUEhQLUk8T4Mqsd2AZ8HqT3w/u9Zdk0j5kkxw=;
        b=NrUIlAwkot5CJgxcpD5sTmemDPLixDr1K2zljPF+rCsGbDMCi9l2upifu8NjFrt9b/
         Ev47kWmQGmkuA+qBsYnJBGZxDNvUSB5wZAxY/PkP2qOs6tBeeL4a6XXTzsnE7lCh/YWC
         sAq1LCXKxqAaQmXXfJdiiVe+Pp3LSRg8E84oOoOxUlhIXUB9Pszhit1B4KBeByjmekEG
         /pthpWunW1YrWCgN2xYPFbUKSexhE8l0Og350CZHnLGr6HnfKMdH4KjK/ge6Hn+179Mf
         1yldxTsOXXjdWI3KLH+rdYJFeNhxGA5b52N0nWV90p29Mg4wAqIIrOTJW9VwzcAbxg5G
         t5WA==
X-Forwarded-Encrypted: i=1; AJvYcCXqUzNYi6aKnHUT63p9rYAPzSXUB3gbPEYzEqYBZ7EIjIxtvu5SOTvJ1QgryA9xtxka7xx8TdvOid+UWjJWTeTojEshDg==@lists.linux.dev
X-Gm-Message-State: AOJu0YydLqFCkcq3QVXvsszioiWQEtTTDMxy5ZZrCFnW4Ns8uTx/8ibI
	Alz1hLzWz95eCEaYfLx7zug9nMc2C7AAOOAhELuTS4V/I7zINF9kHxoIbLUv/lfZ4VTcJJMnOMq
	/siNE3lhNUXmYPJHWbX3zzRDno0JEp8s=
X-Gm-Gg: ASbGncsSTPmwaEf+oWIItwdi3JMK5Cm7HqzxJAo2LS76+27c9sqjncr0iCQZenjWKU+
	XZU05N7VpahTve8z/TXXiy49ORzd8KmSW/AQfG48rA+EXTSOmVlXrYknFrd3abBqy6amkgfmE5x
	GXeYZhP33DnSC7DBueW2MIcAMEK8uGztbLdwdJTUh6MbnBK/NsMuQUj1EpsSGMcQnN68lp8yZoi
	isWbKmo
X-Google-Smtp-Source: AGHT+IGpZ1p6KnGy9noX018eYoSIQZ7nbMhop24dOULZsTAevFcYoUJSfW6pitPb5UB0Nbo/Dw2gvFvXCh80lYOFdfg=
X-Received: by 2002:a05:6871:cca0:b0:2fc:2b74:7b79 with SMTP id
 586e51a60fabf-30701ef8394mr9974973fac.20.1753800281088; Tue, 29 Jul 2025
 07:44:41 -0700 (PDT)
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
Date: Tue, 29 Jul 2025 20:14:30 +0530
X-Gm-Features: Ac12FXy3fK67xSnSanQZzpriiQ5R6tCVBHHq-_iW5iFbtcF2Hd5yuVnENBkTDco
Message-ID: <CAO9wTFjd3MfL1yPTbcPp8_oKtQwNiMHCiZs8Y9oha7m8g8BiUQ@mail.gmail.com>
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

Apologies, I missed that part. Will fix it in the next version. Thanks!
