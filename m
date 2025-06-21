Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424FCEED7
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 21 Jun 2025 09:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750499939; cv=none; b=jgumZ/TG4RZaYIPc2ZUjbJ5NrNhE8ahn2qckmcBHKfIL2uJQ+ZgNpKQyhYqAzv5NkaqX4vX/pNqtBasfHFiaw4mhw6M3j+qZyq3NmeUwyzcVxHLxEOwdHQxKfXcfNiPaSBHwQOCWETrvPbOLfsrvm2+nk7FELfsJ//FM9UUu4UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750499939; c=relaxed/simple;
	bh=+lWQaton8jHYGURu3o/Xz4rmZfTqgU21wSWj8U0z2do=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QfABJNUWCQRaNmuYIG0xZAwGjMV6mSZuVzSdWg5Gky65KJjFNr2SayzhelUtYshQT95p/hwl6Xs/X0XVXHPXrAjdtqZ3QdF5DNynA1920uPEB9VBWQ8flOOSMhqUvYtnDSvfCKu3zzAKAHrDzGjONwTLBG9WDTOEjxdHvumcVOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5QilNf9; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5QilNf9"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e8179a42475so185694276.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 21 Jun 2025 02:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750499937; x=1751104737; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NFvZD+u/OKU7mgFfbU+SKlo3LtBUSpTtmgMflnAmtV4=;
        b=l5QilNf9wmS/xxOXEcHoPsqEPYcwmWbr3rf93XbKl6gj06syu032tZok2hRaY1PwLc
         mXevJ6yK7rlItorcYErK5dYih74qLRBsSWOxbyeV14oMHTdqVN/JCs1e2WnyNGW7veZO
         6+ZukHIz7lngUszYdP/Gm35PvRzGtLH4ZNobGyhys6L/zkR7ErBTNA/HEJysNQaU0sOB
         F5ESQnudTglzAO92Rn+vdDlRufScr2Rb8mQ+CETgpAtqoqC341SNBjbmwFQ681+WSrlw
         qFacdJqJrmW9orhwDs0tJfBxEJGJVdTK0lSI18KolZ1pVL+WCxIiXOeTrU4qJ0237wc0
         jpeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750499937; x=1751104737;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFvZD+u/OKU7mgFfbU+SKlo3LtBUSpTtmgMflnAmtV4=;
        b=Ty31AcJqrct8lGU1gc8vy8ATgHwtuFagEiT6jKjRd1hXgtHT1Nm5YGZo+dTaIg6i64
         etHYRSBaJYbLlM/2umGEyTJtjKAGGvDgmozzxwoSKid2fLlFduPJTPhGInBzoUyNbqtn
         BMENDoPsGeoLenUDh/6yDbExFYEJ2MFn3U1kim9ar1ox+6wRbyqzIGN2E61Qk3t/KxKy
         2fDe8jMrpTn6JYVjjuqoeybv9x/NFJ/xdJqNH/QohAjDq1Xv0OTJE8f+6CVqeW/KO1Mk
         eCLGrUEE50paDYMbc+nutUl/HhGb3UOaRVaHsyW6uqxdIJMfh5XkMcn6/9XsowiP/2Vg
         BcmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVclGQ62CCvxPvK7l8IexUrE1vLn11Mju68owwgqH1fkLaTGdDFKoWYjY3WwY/jYmMFbiAX/LF4xulhtSVAfv/ftIwMBA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGnTzagy+I3BhrRTYeGS+creaitk1lhmcB2mY/sr2hqHPRnwGM
	0phdD3luOmMM6LX7JG7Y2BIAe5k7dLjn3DOsAmwU/N/ZVo+jkeI71/ppgOnS9qrdTW2PaB1yrkp
	PP4Z8x/B7mCUC8taz2lmQyOkXIE8BE9g=
X-Gm-Gg: ASbGncufSEmy/dapuJPbKdCPzRrwBU64c/yWHawV289spcIG1hlopggknIlcgjsspid
	zNo2vVgJOagmSBfW/VZ4sT0q3v1npiORtgJawfOFUGGAp53F4tU2g7pMxwxfbhsoXNSqU7PKwhB
	gtOKR8HYB922wF5dwbYHPyTbsIJD0Ot+0lJpmsRGfVYxM=
X-Google-Smtp-Source: AGHT+IE3jUH9yvUkBqwnWN2W2/DtvMHIbOBVHjaS2/kK3aydl2tVZaeZ5XtQ8+m3Ch04z0IPOyasJl2Pg/J1sR/f0MU=
X-Received: by 2002:a05:6902:1141:b0:e82:9831:2b4c with SMTP id
 3f1490d57ef6-e842bcf8390mr3687988276.6.1750499936944; Sat, 21 Jun 2025
 02:58:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250620215542.153440-1-abdelrahmanfekry375@gmail.com> <aFZ5OhP3Ci5KzOff@archie.me>
In-Reply-To: <aFZ5OhP3Ci5KzOff@archie.me>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Sat, 21 Jun 2025 12:58:46 +0300
X-Gm-Features: Ac12FXwmUAbCTzej24qH0z0oXWiUTmicey_DtDZEHg4BcYYXxuh3p054DU3NHkw
Message-ID: <CAGn2d8OT0SS+wYphKBmM21Lo__N_ZFRyZCQ8pL34c0Z0bqDoag@mail.gmail.com>
Subject: Re: [PATCH net-next v3] docs: net: sysctl documentation cleanup
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: corbet@lwn.net, davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, linux-doc@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, skhan@linuxfoundation.com, jacob.e.keller@intel.com, 
	alok.a.tiwari@oracle.com
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 21, 2025 at 12:20 Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> On Sat, Jun 21, 2025 at 12:55:42AM +0300, Abdelrahman Fekry wrote:
> > +     Possible values:
> > +     - 0 (disabled)
> > +     - 1 (enabled)
> > +
> > +     Default: 0 (disabled)
>
> I see boolean lists as normal paragraph instead, so I have to separate
> them:
>

Thanks for the fix , should I resend it or is your modification enough?
