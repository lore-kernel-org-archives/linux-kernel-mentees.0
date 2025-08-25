Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1350D26E70C
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 Aug 2025 18:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756146115; cv=none; b=UIJd+gwlH67QLoF3RzIgvcWu9t1sfAgP7aHfpFKnkiVjku/OX03zL6/cm90CZ+K+iO7TWjOKopCxFqW1Skxl4ihPspvHdTvfwL8PFxBXXwYRsQcis+e5pTJMPyCC3TitSTBLzj7c54vEPsy5uhl9qi50eVpPXEmMM3yAPuG8d70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756146115; c=relaxed/simple;
	bh=3ZrmaJQHNqz7zB3hYmPFkkTgMYcKXhVHt6LgmcyEGLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sHa2JAgkwY3ZvpGtK3ME/L+o4JIXFHuJ1Tn8t5f8aVFCWfYzb4A0aloE5J68CLSfUPBu7uc3duZIoox6xaiT/86opt72efoszMCf4k57dZ5haQI/pEDQQL59gl5LTZcDY+MHmeiev/qzq1gi2QGOtnXbijdQ01FgT1Bn4AftQnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JbDBMcWp; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JbDBMcWp"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7451ee5e750so674720a34.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 Aug 2025 11:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756146113; x=1756750913; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBWcU3cSWIrOv8SEdohQlNa+9rh4cGJiQvp8mNokO0E=;
        b=JbDBMcWpU6VVmpIKrZzcrExxF02ZlOHmlvA9w6ID0zm4QOimap0xcwUjwmE6mqZipe
         xq9frBDYThrxgFKlpyuAIPKafycXBt4HXOcKzoZjwmYZRKK/9MOQ9TIRyFPtlmOR0xAx
         9gPiW39u488M0qh2AU0JA64+c/qUawVQR/pIvL+Yaxrlb80OhKuNTyqhv8ykieTvHcie
         P0/ngqRleOZkPt8WPnaDPF4nkYkFC8Y+dEqGkdnF/FW6/uPOl+emtQ3QFUfvedOc4gbs
         oT1HIORof1Wx9gQVmc2/y6lwWD/QnoT7t9zxXUL0uD1XIvj/vwIFAzlkOcgw58GwW/y2
         MvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756146113; x=1756750913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBWcU3cSWIrOv8SEdohQlNa+9rh4cGJiQvp8mNokO0E=;
        b=ov8XZ1Bb75EkXLP4/aB+qGelyPGiMQ5NYDfefJ3skrDNR1Xi1v2lkK4fBHmwsYDr42
         c6k4n3ofXp0tCqQvQZg6eXDufpW+8pT9WvyE6k+fgkWcErGE1JYHaLUNkUoXYmdLrJKC
         V/0qOslNZQnnkSN+TcvLEBGz9VPumr814tOJI3D3CWtZ1vuuVgjWqAEUcSz8PJE8hyOh
         qyqPP2RClgd5Yqpn/WsvrnM1vhoEfIqg6Gnt/OcjYkA/6oEYX0bqxMzdNsta7+j2tveR
         PdXtudTqEfvKqnMgO+RsLUizct1fX/VU56GqCmFBFJLaYBMy8DTcxSbCJrErE+/fm55G
         +22A==
X-Forwarded-Encrypted: i=1; AJvYcCVtEx6P09nsbq8ZyOMqt2XUuk3FCB9P56MWOuraay5BokddHTi1clCCiXdkDbaIdiZMC+cNHp1MtZDb9OQlvGLTABxF7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw89hRXB28bG9TSx3WE9XOYVM7jZznzDG3sQjNFfisG5vTQ0ojy
	2yO9Vikuzjhm24EGnkRr0OD42hRoGmLHBT0FmPPuCrhQLhVR2oRC8i79SnETOCjXMbpxWdkw3vt
	Q8/C8xZlFiG8MiAUXUVdAFoW5zS/6JLc=
X-Gm-Gg: ASbGnctyjrIq3GsCSzJmrck/8b6L9gdbmwLka/jGJ+S2NLIIhexGGNDVpippUHHCrDU
	EkIDaYe2up8DZtpVPxY3x1w6ibkpb5bms3BypgiSp2m54w6jgRcOkYJIDie/PSupQc9jMk9QqNt
	wJOnvVvtCoguCuG7CcM/j6OZXmoTGDMcELspcEMYZIxC7ySnH3mEVyh1aDPoiCSUFbcEchzLlH9
	6fSpG1oWA==
X-Google-Smtp-Source: AGHT+IFskHmvwXj8mMcFosVYtY+vw+7NM41X2/qi91Cw233062th5AEOuPmRoCdCeKroHQKACJ9/26YoouKPLyTBfJI=
X-Received: by 2002:a05:6808:a586:10b0:437:b094:383c with SMTP id
 5614622812f47-437b0944231mr1150598b6e.2.1756146112878; Mon, 25 Aug 2025
 11:21:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250815182742.45541-1-suchitkarunakaran@gmail.com>
 <aJ-ScOp3ZCG6PQmD@google.com> <CAO9wTFj7S7G2bqbiuKbR+o7Y0u1EkYY5GsHasJZLmAo5ZuCx9w@mail.gmail.com>
 <CAO9wTFiJmi7YzeukT0VtnpqcJcE3sSueO3owYUAd+H4wjcYZeQ@mail.gmail.com> <CAP-5=fWCGa+R1O2sL1anJGznkprQyP2RrsUZfzmrPJ2y-WsEvA@mail.gmail.com>
In-Reply-To: <CAP-5=fWCGa+R1O2sL1anJGznkprQyP2RrsUZfzmrPJ2y-WsEvA@mail.gmail.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Mon, 25 Aug 2025 23:51:40 +0530
X-Gm-Features: Ac12FXzIW-t6fPYcoU6IlBmEWamOsApUN_OzhHIIlmzKU73aQg7rHJYgARuUrvY
Message-ID: <CAO9wTFj6o=ESbFUZmk9xAoMfGfUcCX7rQmaBzLyaPr6wNEotfQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] perf/util: make TYPE_STATE_MAX_REGS architecture-dependent
To: Ian Rogers <irogers@google.com>
Cc: Namhyung Kim <namhyung@kernel.org>, peterz@infradead.org, mingo@redhat.com, 
	acme@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, adrian.hunter@intel.com, kan.liang@linux.intel.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, guoren@kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-csky@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 25 Aug 2025 at 22:54, Ian Rogers <irogers@google.com> wrote:
>
> On Mon, Aug 25, 2025 at 7:17=E2=80=AFAM Suchit Karunakaran
> <suchitkarunakaran@gmail.com> wrote:
> >
> > On Sat, 16 Aug 2025 at 12:16, Suchit Karunakaran
> > <suchitkarunakaran@gmail.com> wrote:
> > >
> > > Hi Namhyung,
> > > Thanks for reviewing the patch. I'd like to ask if there's anything
> > > else I should do regarding this patch, given that it's supported only
> > > for x86 and powerpc?
> > >
> > > Thanks,
> > > Suchit
> >
> >
> > Hi Namhyung,
> > Following up on this patch. I would appreciate any guidance on further
> > actions needed, considering its current support is only for x86 and
> > PowerPC.
>
> Can we just make  TYPE_STATE_MAX_REGS 32? There's no reason to assume
> the architecture the perf binary is built on matches the perf.data
> file being processed by perf annotate. Given 32 is bigger than 16 then
> this can just be a maximum value (a comment to this effect in the code
> would be grand). In general, the use of the arch directory and things
> like "#ifdef __powerpc__" are code smells that are going to break with
> cross-architecture profiling.
>
> Thanks,
> Ian

Yeah I agree that setting TYPE_STATE_MAX_REGS to 32 is a more
reasonable approach. I will send a v2 patch incorporating this change.
Thanks,
Suchit
