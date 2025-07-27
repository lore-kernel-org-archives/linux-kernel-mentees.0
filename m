Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92371E49F
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Jul 2025 12:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753619502; cv=none; b=d1KpNless+ZjMClBs1psfmenHwOmTQdSxZk4NlMtgfdoc2lOe/wyav5nojNLDZYefG+A8BdXq1jlM0yxXCr/AgeX6ZNFBq5hwe5CU5QqBmstbFSF7KlGuVn3YjcYkr7KFdZg+98SoSekw2D0q7XGDIPYSo7zcV1H9Drb6wxhq0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753619502; c=relaxed/simple;
	bh=BwX+f6OvmUXCYCS6hwLlQqnr4JjkZ82M3Ns/Tm34nMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eYpe7mvjjuj/vN5oDvbPYn52f3nC11uuJaLng7+sPfPtmVTQWvt+cPsXLceAbn81v9YZjfiEQg9t0b1Rx8reX2eMEpsMjaPtAzRyvhNUHCFjdH0xnaRcNJZcsK9vmlMieh9Z3j0VqAoSimfS7DON7RnKa815toSDW8MFlBIJ11w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNQUp58F; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNQUp58F"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2edec6c5511so2345794fac.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Jul 2025 05:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753619500; x=1754224300; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Nr1FlrqtvRl/pW2s+Bj333vaZiPeY5tHgHRPgBeIBrE=;
        b=FNQUp58F1I5KtnvV1ljPnBTfZh13snHnAG0V8OH05zbQJ9YGi8c0Lpa7nXGaugExbK
         8BGpTnCwHX1jIvyUPjqQctjStdF/MK+khPk3PpZ58iuHVsQzuWmfmGdrAMMEKUEfa94c
         yOeWaHjb7/GwnWYRuE1003qO/S/WNH4G3PymSBNesPs4PJ6Hsn6ehCJfxHy29ecrUGmc
         6bvVx6oO78SqKAKEQSJFLzDQ+nuXitexB2ZE5qHEbFSi1RkRAergCImeyA2QO3jWFb+R
         SKHJg2vSy6JL3FpiQCZsE+Pf138u7gCbiEn1RFXGTzc6EhIrveiw6yu620BZK42WXrw8
         zAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753619500; x=1754224300;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nr1FlrqtvRl/pW2s+Bj333vaZiPeY5tHgHRPgBeIBrE=;
        b=I8iP9cEpgX708zzS2Oy5sFs3QajH89A85j6kMetnhZnuPx3BC//ifLyBkJrt7BzRVZ
         kSofpmkM6Q5UiXlsDHsgBkHZkwINaCwgtbchimZVwsnxZobBlBL0LtLKjzjJnJeZkHX9
         cJBs8C8kyAxjExmvOizNZVz2hzZPLwAIqrzQmpXNWWVQqw1MVZlsMkMQu4832VS7+Mty
         bb8X21Ur1V8IwKgf6SxZ53+Mw54PqZG1tXBY9HVd4dkwbYkTckdOCRZjXj026zmqBqUW
         sozbcgUNfkIKpayKAipnCCRvCgFG5mjNHquHxE2PvcDv2UYSwJifN0q6RDJ5rOJ7jCC5
         dJOw==
X-Forwarded-Encrypted: i=1; AJvYcCWCYdfkowmn07vbld5DcVAlQd3U46eRLaliqpj/eH6M6e/dfFTEe8dlF+fMuKT4Qf5AIOwSLlkHo7gI3ZdW+iuoHnuX7A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYhlCb5cW8F5K3hjirvvTo4OX9/XSVgx4wO6VOSE0f44tyV/bS
	P1vMTZTmaFHTjmG1OwK070AJHk2xiC0205CsyfuRfPqJluOp3PqJicLskVk1kqWt2kA2wyWjULE
	trqGFeqcZW9+TYdezzekJ1urmFU56Iw8=
X-Gm-Gg: ASbGncu7uLTDTYOFRpBGUtTrnTPC7k3VDVzDYIV4BB7meQRPiHgtuSLxpRpzHe9hsLd
	Wus/9Lv/sO1roY+2VRjj8zkIzv8fWlLR/hg113h0ybOrpYG0BLMQcjVibatkmGgQVns7QkzMcuR
	j6EjZA8YWt8uH8xkidWK520pW4rbZAokBbl7g5eHN1lsOr3+wwsAkxSuPVHqF0RmiQ3BOwiAGdF
	Fn2Fh2ETw==
X-Google-Smtp-Source: AGHT+IFpuHK+r+RUZcTODiv1qZJM76ZiRuILDLgWk5mvrZ2hddpDeKAVit/CpJeJZ3oGkqKMAfiyzmpvtMO1w9FrH+I=
X-Received: by 2002:a4a:ee97:0:b0:615:d3d9:5d1c with SMTP id
 006d021491bc7-6190caa7013mr4571605eaf.8.1753619499808; Sun, 27 Jul 2025
 05:31:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250726185432.162632-1-suchitkarunakaran@gmail.com> <acacadd2c1112e31cccbe8db504ce30bd8587852.camel@perches.com>
In-Reply-To: <acacadd2c1112e31cccbe8db504ce30bd8587852.camel@perches.com>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Sun, 27 Jul 2025 18:01:27 +0530
X-Gm-Features: Ac12FXzcfqjbmuR7tctu7RJvCSwo18x0U4iVbHzoRGSt3SfrOFID559ChNL-Mws
Message-ID: <CAO9wTFjbD2qcVVCMYfLi3yKjT1cLtHto_Qzr=eAepg=8evbSFQ@mail.gmail.com>
Subject: Re: [PATCH] checkpatch: suppress strscpy warnings for userspace tools
To: Joe Perches <joe@perches.com>
Cc: apw@canonical.com, dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 27 Jul 2025 at 17:25, Joe Perches <joe@perches.com> wrote:
>
> On Sun, 2025-07-27 at 00:24 +0530, Suchit Karunakaran wrote:
> > The checkpatch.pl script currently warns against the use of strcpy,
> > strlcpy, and strncpy, recommending strscpy as a safer alternative.
> > However, these warnings are also triggered for code under tools/ and
> > scripts/, which are userspace code where strscpy is not available.
> > This patch suppresses these warnings for files in tools/ and scripts/.
> []
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
> > @@ -7020,19 +7020,19 @@ sub process {
> >  #            }
> >
> >  # strcpy uses that should likely be strscpy
> > -             if ($line =~ /\bstrcpy\s*\(/) {
> > +             if ($line =~ /\bstrcpy\s*\(/ && $realfile !~ m@\btools/@ && $realfile !~ m@\bscripts/@) {
>
> Maybe instead create a is_kernel or is_userspace function
> and use that instead of the test

Sure, I will do it.

>
>         if (!is_userspace($realfile) &&
>             $line =~ etc...
>
> and
>
> are all <any_subdirectory>tools/ always userspace ?
>

Yes, as far as I know, almost all of the code in the tools directory
is userspace. Atleast, strscpy isn't available for the code inside
tools and scripts.
