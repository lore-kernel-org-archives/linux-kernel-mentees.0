Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796692FA63E
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 17:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752772847; cv=none; b=hFKD6h2dJ1/5y6MJDlWmVibue95WsoG1B8ucufINa4FqyLEdbvL71HFHmIGM/YYTE9owdtMGAmuLcNmCqywYOM4Mh8SSog7ibiwfBA0eJOLd3VgWYDTa2DK/fjx5ZO3c239yu27TprqN2ygD9mSH9H0IRdfJHnS7K75JzICf/po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752772847; c=relaxed/simple;
	bh=QzW3TzJHY7MTLMOOnMpu8mKFRvV0aVq6toqLC/Mg3PU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tYH0hU4TIT/QE52YnpsB/6DnQflZr4l9EzkWCHMMiSmM8pp0OXJouQzwMC+po8WxvTeVuSX7ol9e5pKtIm8Da1l6/to5GXfyFtSl9HjSIdU+9eBq9Ualrn7hTauEn02DkUQG+GOEEVWOPDN5OiVSHBnstlVWR9QaFNlxUT+DVrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFQ/Ar7d; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFQ/Ar7d"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-3004ade907bso275339fac.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 10:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752772845; x=1753377645; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QzW3TzJHY7MTLMOOnMpu8mKFRvV0aVq6toqLC/Mg3PU=;
        b=lFQ/Ar7dqGhx3aEmc8J11LiwVbwMKUebfQyRsk8LDs7QdMpFcUZNytA6Qs5tI+NF7/
         rqk8UUhugOC+cjT8/jl35e/0I5jOMnR1ZPutxuIaJaDAIgXRsdAarFwRJs/FljZ1JN7U
         5RxNuEaWoaz+AG+xJ3GKeutGNP98GIMA7oJUXngM2b80/TfLlDwx2NeOXRt9JxK7k2uc
         HupXvrppBmbHUcMj0Te3KaKi56ouMQiqR7eUKczoLX5WAERz4L67mZKrEJANaiSMzqeD
         13FWEAfCJIzzyFw/goSnN8VsJUQE47e251zNizMtIBEbc3UTLKPxTJEuESi5sdm8yRAa
         YR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752772845; x=1753377645;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QzW3TzJHY7MTLMOOnMpu8mKFRvV0aVq6toqLC/Mg3PU=;
        b=vCznPVpGCmJoIfP4Me16QSn9KveolidzSnPal5k40ipoYy2lp5f3OjZPw2tZ9kJZ6Z
         bXlYkNoRHdEtc0Acb8vo7cnm5q7wgCUnlJyepX6sk4AuhhuUs03VUDrZr29V1pirW9/X
         Ql8hLnExkkEckGB8sb2eeLsrowKHL6aAg28ifHw9G7E8dAFA3DK0oXyDiT9dx5AwwC+U
         PZaW/HcSxSdzFnRlsfCJzlcaWnsbJvWYSu6LbkOVchD3w25jg/9M21whQuyJdcu9TCWk
         xq38Q0Cfa/JVN4ZVGfuo80g2q96eZy0l0op5gnWd0Z4Z+eY1+ZcTk61T+r039M95Aoyp
         hivg==
X-Forwarded-Encrypted: i=1; AJvYcCWpFBsNddrS3sD76HgyrNjYfwSye9a6G1d2oJN8EYXKT4Jo0flDOzcKxS/XF6fNRTsSuibq2D3aL83Ow8AlbUurjz/tvg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyp6QtJqJ6+0qQn2rqG/JatUgOcoS3Qjc+ea/XoleHWQjVG6U72
	h9HCc3Gd0IgexQakuICaDCSxwIXicYKJDxm3iWPrZclJUEW62f7zWxVutBd6SG44DOPlWXRcZGM
	5KkeKqZBqI6IBSYdM+zroyUQDF939vaQ=
X-Gm-Gg: ASbGnctu915cBjbWVW0QBr5mCzspz950D0FIxqZJFhMAZOaVut//u9Q5buyahJJNbt0
	CgtINApqPQhYtnkTvhJELqGs1E0w6sEAZ9/q+3+rrNOH8rbMw5shqsm8VflXcHQNeBpPepEYCZn
	QmTry07ATCdkjYqmXTpo6frpK1obXjHev8WSFNNb+3klIAEyPZyzVV+sMDPT4R3WZzKOdWS9C34
	ayVbP7b
X-Google-Smtp-Source: AGHT+IGkry+/VfENK4FfpgTo78UQOqjs2I1quI25rQ7ik3+6oBFDseF6tGEewUI75qPag3XTu41YslI06Xj3GfBcdds=
X-Received: by 2002:a05:687c:2c20:b0:2ff:cb23:97b4 with SMTP id
 586e51a60fabf-2ffcb2398d7mr3207511fac.18.1752772845406; Thu, 17 Jul 2025
 10:20:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250717115936.7025-1-suchitkarunakaran@gmail.com>
 <f6c4944d-c6c2-4a7e-8dd3-791d0c29022b@linux.dev> <CAO9wTFjEJOfF7krFuV=DkZFzRU3FpRXtnq93UaX8=_Y=wnwbHw@mail.gmail.com>
 <2025071756-motor-slackness-ef0d@gregkh>
In-Reply-To: <2025071756-motor-slackness-ef0d@gregkh>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Thu, 17 Jul 2025 22:50:34 +0530
X-Gm-Features: Ac12FXxLcp2VHp2DpkAP_e7qN_lhHYsL-fQPhMc5_0UqSpWKkgNzljuXToTD3Yw
Message-ID: <CAO9wTFioFna7r_qxfWNQasAYC6rodkqP+1GdYJKSQEFKg-xXtg@mail.gmail.com>
Subject: Re: [PATCH] libbpf: Replace strcpy() with memcpy() in bpf_object__new()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Yonghong Song <yonghong.song@linux.dev>, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, bpf@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Your change also did not do any bounds checking at all, so how is this
> now safer?
>
> confused,
>
> greg k-h

I assumed bounds checking wasn't necessary here because obj is
allocated at the start of the function with enough space
(sizeof(struct bpf_object) + strlen(path) + 1). My main motivation for
the change was the deprecation of strcpy(). However, thinking about it
now, I'm not entirely sure memcpy is even needed in this context. I'd
really appreciate any feedback or clarification on the best approach
here.
