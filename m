Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C291DE4D6
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 15 Feb 2025 18:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739642871; cv=none; b=ZKZU/3buVN0vKfgdju6FAAfiYR9B2i7+QbwK//TllSN0mVHlrecYnsWkWPfSaAzAj94kmW7C3/kP/K8yx61fuRM7NCtGosMezo6Nfu0o8TboHniGwmE1TudCZGwEG6mMhRdHXurklSGeLIqiMJKSTCUKtqSdi9KbfMHl3NGbNzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739642871; c=relaxed/simple;
	bh=27ihcGwNfhMOX6VMaeABMmzgHM6w++DatbE/dq/QeRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JrQAizxkChUNWX0aDdPlM+nCbmaEhUf0j7JhReF8/+a154bz16KH5eymapBDdC/C69R1ukcsfVQcK/kZ/lClPJYVkcgE7huAYiend9T1Vfm5H461pxn2LK+KmgEiD6cG7kc1d/gIEYIaAVmdXo+uDezNL5quTxxPpqRClwyuv5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GwZL7LIl; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GwZL7LIl"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3f3d6531439so1721190b6e.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 15 Feb 2025 10:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739642868; x=1740247668; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PKiFbJxF4Rgzv9Phfm+fANcxT01MHoDXmdNdQTptkMU=;
        b=GwZL7LIlvAyiwPT5XnoZPbZX9fBNccDqnJlQYSp9mBEkidCp3VDfXC+j60w3U8WlkV
         sxYXhl0zQp7YvohSca2XCX9bgeOZ1BWysNX8dEwTiaME2M83xDBqqpJfrnRtHQKKgBRy
         LJfOrZCVwL8uFagkjYoPPKDlcgvDVwVyrK9YV8C2IVNEhRzxuivWWJewMHDaGCiV/ib4
         FA4Fzl6gmoiUe6ClyHD2VZzR6dZpkWAMviY/WZd/BI75pLjS/ykR30RktOprLCpKwG3H
         Nh2DfbMxbW5Xq+Vb/ZJjmsaIlplFJKSzOlh7Z4apM6E2xnVEISH4iyGIf30pWOm883z2
         XmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739642868; x=1740247668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PKiFbJxF4Rgzv9Phfm+fANcxT01MHoDXmdNdQTptkMU=;
        b=CObqDgD6rfN15Vcmcfi8hLFqoph4k3han7SmGRt5WSJtCNORiXixGTZFqSswpARCYk
         u600XbFjzKJBdeShQzglLEfF0O68FLPUxzNW2VD8gtqeI1FEzuScMR0lhNbFH6EqshWq
         l5YzoMAGNtEQI6UbNfo2TVlEFYMmEzP957J1RUk2k4QVggnGwqxvjIgi0IJ5titTx5XC
         KDzk085dTC1j962AocElc+i+BdznOWIGa5NX2CCT/pgzkt132JhuqNkKpGUFseBqGpwU
         FBzg8lZSkWVxRiNVulRPzReoKiI5L7kJc/VUxi4Bs6EJUtUEumFfjGlaN2seNJO1TpJC
         izbA==
X-Forwarded-Encrypted: i=1; AJvYcCU0LptJGPV1LoLYEVKkwO5FqM9Ycm74G7YXYau2q+rte9MjR1XGEi+WWrphGZodCzUzWPdbXz9sjjJzFzyVU7cyJ95M/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwBqUvkY+Q9mTGk4N1NDDJW8ohC5RGxZYFRV6n61j6mQjm9+eo4
	JYqT8I7INkwBUXjavOi0otyKKSrCw+zDKTI1Lf0XjWYvocOcATeFhXbf3RuQVWk/sIaPffQn6E1
	Zf1A0LYRmvtj5H7iHToIHrfzdjes=
X-Gm-Gg: ASbGnctVq+yWuohyFC6pvkpHbLxlNfmxnj0/O5noQmB9y0h9nVFSX7NDEYVLXDFfxb6
	YwcQUpHRf9i0D+vCOxlT5//coByxNF4EhTxqnT1jjITChApp0+IT8sgOH2a1BlfJc9JHMud7PD2
	XBkE8g3ycneJaDxg==
X-Google-Smtp-Source: AGHT+IEx5XmUNpapb32FPHN9D0DNU46AjpMk6k4efoTko1Wr4g+bLxj/u7aqTsFdIk4at+JRnBNAqBmm0wLqxdZof+U=
X-Received: by 2002:a05:6808:17a7:b0:3eb:66d7:a345 with SMTP id
 5614622812f47-3f3eb1736d6mr1977430b6e.39.1739642867013; Sat, 15 Feb 2025
 10:07:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAO9wTFiZ8wyangitV6RZLYiL5yF5CV1eRXYYzJKhXyP2UvGDJQ@mail.gmail.com>
 <87tt8vunmv.fsf@trenco.lwn.net> <CAO9wTFiUW42yKGaZDQD=CR5f2pmjLNQfJcd81+gargstGVrF8g@mail.gmail.com>
 <87ldu7umjp.fsf@trenco.lwn.net>
In-Reply-To: <87ldu7umjp.fsf@trenco.lwn.net>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Sat, 15 Feb 2025 23:37:35 +0530
X-Gm-Features: AWEUYZm1mlF2nvmEzJhCqnl6Y7YioGfG-IzgjtzA9oLBXLkhV8_Qpf-8U0uT6uY
Message-ID: <CAO9wTFi+T3jzgEZk97SRBaEWUYWO00YZFi3amrOV=GwZkt-vRQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation/mm: Fix spelling mistake
To: Jonathan Corbet <corbet@lwn.net>
Cc: akpm@linux-foundation.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

I'm sorry about sending HTML content again. I've configured my email
client to use plain text mode now. Once again, thanks for your
understanding and patience.

On Sat, 15 Feb 2025 at 23:18, Jonathan Corbet <corbet@lwn.net> wrote:
>
> Suchit K <suchitkarunakaran@gmail.com> writes:
>
> > Hi Jon. Thanks for the suggestions. I initially sent HTML content so
> > it was rejected and had to send it in plain text again.
>
> When you resend, please always say why.  Meanwhile, though, you have not
> yet succeeded in sending plain-text-only email.
>
> Thanks,
>
> jon
