Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF94418BBAE
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 20 May 2025 20:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747774762; cv=none; b=eB8NgCqJbV7vpemWAWebhOdlVtYjGFfi9IQWyeP2/y3IxlcAzLKudn+uTWNyuNxHzm7bOF3giOcYjruDayWBE04mdueCL8QNJBth97NQT9vsCQ1ia9jOIsnFSut+qrxEYtJILWYrOiSnFasY+g85YpOuqB4msKr1Jgvta3txOC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747774762; c=relaxed/simple;
	bh=q5KcfP90dN/T9Mg+SdalKw+0adx0XXosjT/FvEsz5fQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xnpc2EZm1eTb4TX4wRV3ewEO7COULY8/OyDXnrKsWPi8qX5q7Qivgo4NgwXcLE4lpyXnWO6QxX/gwg/vCr6uzYMo7SPuixKRR4lnZkOwCflhbnIRhvJxD/+9V5fiqAcdvAVfBxGdFa+G8xn4uUV5/6wPP1yaOGxdzvZzwAdVkgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWdyG+QS; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWdyG+QS"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-30eccc61f96so616824a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 20 May 2025 13:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747774760; x=1748379560; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHwjdpsi/AzvsQnl7KqQJsfhwXjWFdC8xkE8bxdxejY=;
        b=DWdyG+QShlMsXldZkMFHTOzr7mhLglN9LJQztGmDUK9Dulfw71NE+R2cWOHTaF0Cl7
         Qjs+e1qeCzF01tHqM5fenfslnNWMvgpsImpmZtJJD6RCDHAl97fR6647qYKRRh6/1t6+
         baf0JgI0mcM7WL7sOjDAnFNV1n4mXam2XtUCbw7M8BO2RrAZifJSAx2aj0lgUWyqobPm
         rhb4S0ndWopMG10aYzmmPBjlN70AV7AcaC72NtWMwZUPWYz8LrbucX748nAXRQDcq3Nh
         7XGlCPfR4VXZMQO6cDycKIGMbsDPe2z2SfyOHsahs2XwWFiH5SJQyUl6wDKOJ/YGPDEB
         DaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747774760; x=1748379560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHwjdpsi/AzvsQnl7KqQJsfhwXjWFdC8xkE8bxdxejY=;
        b=rckCAalFhL6EB6V+Ol8a6ORItyN0MHUW0hnBJR/Dutq9u50A4NlK3EhCGWNEExwukl
         ufqaaRFQUQEl56iXBlHWKlb8yS6fMuEFLTaZoE7/dznjfLCOPlDTC7lkodG9uC3xlCs/
         7Esjb/ccjESeJ5b56oVp554LrDEhin5xqlsRuxSgi6LojDTYyb8C+cQVCC1V+1HpmJR6
         KuigSS3+2bKwqdUiSQgbM/5hM6tP5PhdoYEz52kmljHGlaPB45YTx7oChwO2RrVDnYJa
         BZJoituGraeiQ7Tl798kT6ONCW0XUW3Wuv8ScgtXbt/zHhMPtqe7hHmUdNHVM3OqyElV
         LbAg==
X-Forwarded-Encrypted: i=1; AJvYcCWGm5oFm9WAUUDyDXuxrkUp2bne4mmnJ/pkUxVDzZMc161BNsZiwakfeacQcYHTq1v5nSpm8+KDr45dolPNYTU6rnhADA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRA/zW91im2dyEPKUBMXZ+FfRW5dseM33Nls4o2QajR1UDMPyh
	v8AIo5DYZBvuZfivrasfxKHuMvvqGJ3M/6ydT9Kv/UIMaXt+ecWhh3byQEvdNQjBJmiTMta0+9i
	Re9buPAE0P/9wo8A6cfuAJD9fhLquCxg=
X-Gm-Gg: ASbGncsSBKoOGEYL5L2HzyRQG8HUeUXa2tbX/Lcbfrl8wCIknxbQXRWAXEumIf9vBwK
	+jQ8aMV/VLq5kT9JGEG2dACOadjJslexYb85Smxutv6F29PGked/cIT1dlF0DZL2QMIv/JD/vBf
	yXsJTXrB1MqAMI3Ckgei3ncO6v7PLu40Oxo04ub5xj05c=
X-Google-Smtp-Source: AGHT+IHSh2Ez7DqS5SylBUy5xfjUaW77lu16/Pj+leUne/FZoiF5pEF5fDTSu+q6YTmS9r3Im/CxMmw27QRna8Qa3Dw=
X-Received: by 2002:a17:90b:1b04:b0:306:b6ae:4d7a with SMTP id
 98e67ed59e1d1-30e7d5bdb2bmr11018568a91.3.1747774760073; Tue, 20 May 2025
 13:59:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250517002604.603223-1-jihed.chaibi.dev@gmail.com>
In-Reply-To: <20250517002604.603223-1-jihed.chaibi.dev@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 May 2025 22:59:07 +0200
X-Gm-Features: AX0GCFtlh5YMGW89tpCWW92KV2_u5QZFUB66lp1_ViXAXBMJwJiscqnzkKMG5PU
Message-ID: <CANiq72nZ00SjqdnxZ0u2vB2ROyjr-kJPLDfYtoKA3AtJA8+1mQ@mail.gmail.com>
Subject: Re: [PATCH] docs: fix typo in rust/kernel/str.rs
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: skhan@linuxfoundation.org, alex.gaynor@gmail.com, ojeda@kernel.org, 
	boqun.feng@gmail.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 17, 2025 at 2:26=E2=80=AFAM Jihed Chaibi <jihed.chaibi.dev@gmai=
l.com> wrote:
>
> Fixing a minor grammar error ("then" to "than") in rust/kernel/str.rs
>
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>

Applied to `rust-next` -- thanks everyone!

    [ Reworded. - Miguel ]

When sending a fix, please try to find which commit introduces the
mistake, and then add a Fixes: tag. That helps a lot when figuring out
if something needs to be backported etc. :)

Fixes: fffed679eeea ("rust: str: add `Formatter` type")

Cheers,
Miguel
