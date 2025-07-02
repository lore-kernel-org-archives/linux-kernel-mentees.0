Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEED61F4295
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  2 Jul 2025 18:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751482438; cv=none; b=patf8Wnjik6Mcd28IZZIsCsbJrmKmFbTuWrdvZe2kOljHyUqM/gO161TPnC+OKzZTTw9EmDCjJXQpdzkMiR8tiQO36NrmGYiAvTad5tYmF75nchTFGQKlfthV8+bw/8ZxkaClpbQiHhQf04iLzMBfRWPuX3TXhWcebCIu9795AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751482438; c=relaxed/simple;
	bh=sWVfMaKLsECjIyi5MUgKTM26UVwF4aLhRuw9374xhxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T2wbFYJiika3mP3YBhrwOpeRGPcnfteWUjOEwuCg29wpnZFj1+GDzKDlXgN59rhVGZs9GoApYiorFFYLUs0W+OLevGgtBNpnkMWzJidfhqNBGARSPe17W6j/RJPiZ9DoAwu5hvi6zBpIDr9tWoJ0c4Y8A4cQGB2xM2xoozJDweM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnH/DPAm; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnH/DPAm"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5313eff2649so1632210e0c.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 02 Jul 2025 11:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751482435; x=1752087235; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGpr20X06c4IYo1szuAw6hcwGxTmHbpUqGh7ovFyqx4=;
        b=dnH/DPAm0LGKd9kZRaoFVw6OMb/eduSPk/i7EFl7YnlyYxNexHIMiwmGN00ANFdAEj
         PP8DX70Ll62YyIEKed1RQ1qKaSfciGavuH511KUuVATGpUfrolo+nSq8BQbVrqia5Bv7
         zZZin64LLz8DoC1pwsVf6BduC1ETBGjut5LUmylKl9k1o12oYhv1DHhAp8vUoHh3x1ww
         hKNcxNn8Ud2jHE3LvQikZbEcj/OePbzleHZ08dBDilO8xDMA2xgsG4HbHjbDF6zkYfwm
         A87rU7DpDgUAAfs/JgDz8BG7iVUW/Oyrw5C3WDnwJBMcM9pAvXPuhFBbW7fLk1GhFQdD
         FDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751482435; x=1752087235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGpr20X06c4IYo1szuAw6hcwGxTmHbpUqGh7ovFyqx4=;
        b=QPHM3rrkUl2e3M+WuNQFltpDqhZ8WcvRIH/GK/fstYb0QrUwElRwKlxzB10IvVYVrj
         8VQbFfW9cdqZ/yo2GG/1g3Yva7qnAh+LcOBZeXYQNh1KLXEzUxxOXqwd9MKbVBeyE/7E
         QUEYnuj4CpjvX8zckv47m4uovcZBEZzaCDLw0HjqJ7c7csWqiCr+NttS0dC80mbomtEW
         Y3rXy9Q/khciygEwKl0XAeYC5otAZ9n+EHbUw6Yn3EtyxiwLIZsozgxQWBu9ugtBPMKs
         Nw1IjKL3Y+FQks5jVfRfkSEC+lKISpUr1PwOLr0LC2yEQSHCoLzmU7FcI/Z/RNFDcPjc
         xi3A==
X-Forwarded-Encrypted: i=1; AJvYcCUkrUzJ2LZVtn6+ci5z7DvVMu4sZCY87iQXhIFzPsb86+PZsXE9S4NqxjEwwEdFNpoUcgstxMnj9Li2qelwgLWcUf9pZA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxFUyXri33+MB/rSu/qZ783dqPSZ5CrOLb8Va7jC0+JG2iX/PSl
	oEkzzOBoOBeHWCujMc1gkVgo85n1D0nqpYTrAtUfTYp8Er5i6Z4If90uZdrx8UsADIxcI0OSMku
	RXq1fItJ5gYlCvwjsA97xNy+5oq39PFg=
X-Gm-Gg: ASbGncvpMHLJ54F2FWAClCGCmV4ud2KCwp0bmU+9FnejyBQotHXx3BXmkAecN0U6kUn
	ADwa5i+TXjbCMZzjUKls2VWPbQ/Vv8YK4Y8MqFqugxVRInZzfVEwtLZhZXu6b6KFtqjOVCR5RI2
	qKBN9lDQhePnMEWx+dHviY7hS+6KMlX/0EHo6YdeO8gBo=
X-Google-Smtp-Source: AGHT+IGQcNbkNCL1zSuxVw3ayQxDPwY4K6hVoovbfKHpavfr6RyQNOABf7c8aYnbDaPOxGOpHCrKfzNVskqnsSbi53g=
X-Received: by 2002:a05:6122:553:b0:531:2d3a:32aa with SMTP id
 71dfb90a1353d-53466603979mr626634e0c.0.1751482435572; Wed, 02 Jul 2025
 11:53:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250618215843.109941-1-usmanakinyemi202@gmail.com>
In-Reply-To: <20250618215843.109941-1-usmanakinyemi202@gmail.com>
From: Usman Akinyemi <usmanakinyemi202@gmail.com>
Date: Thu, 3 Jul 2025 00:23:44 +0530
X-Gm-Features: Ac12FXwVWPAC1aru0ELPnfULxHDKrh4sVJoMhmHfgf5DdxsrpMCb4mBVcWpGxi0
Message-ID: <CAPSxiM_hKOdMkpsogs8dhX3S=Fz42noOFM1KFTYmaBBwK6g23w@mail.gmail.com>
Subject: Re: [PATCH] perf/x86: Replace strncpy() with memcpy() for vendor string
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org
Cc: mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com, 
	james.clark@linaro.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 3:28=E2=80=AFAM Usman Akinyemi
<usmanakinyemi202@gmail.com> wrote:
>
> strncpy() is unsafe for fixed-size binary data as
> it may not NUL-terminate and is deprecated for such
> usage. Since we're copying raw CPUID register values,
> memcpy() is the correct and safe choice.
>
> Signed-off-by: Usman Akinyemi <usmanakinyemi202@gmail.com>
> ---
>  tools/perf/arch/x86/util/header.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tools/perf/arch/x86/util/header.c b/tools/perf/arch/x86/util=
/header.c
> index 412977f8aa83..43ba55627817 100644
> --- a/tools/perf/arch/x86/util/header.c
> +++ b/tools/perf/arch/x86/util/header.c
> @@ -16,9 +16,9 @@ void get_cpuid_0(char *vendor, unsigned int *lvl)
>         unsigned int b, c, d;
>
>         cpuid(0, 0, lvl, &b, &c, &d);
> -       strncpy(&vendor[0], (char *)(&b), 4);
> -       strncpy(&vendor[4], (char *)(&d), 4);
> -       strncpy(&vendor[8], (char *)(&c), 4);
> +       memcpy(&vendor[0], (char *)(&b), 4);
> +       memcpy(&vendor[4], (char *)(&d), 4);
> +       memcpy(&vendor[8], (char *)(&c), 4);
>         vendor[12] =3D '\0';
>  }
>
Hello,

I am just bringing attention to this patch.

I have not received any comments about it.

Thank you.
Usman Akinyemi.
> --
> 2.49.0
>

On Thu, Jun 19, 2025 at 3:28=E2=80=AFAM Usman Akinyemi
<usmanakinyemi202@gmail.com> wrote:
>
> strncpy() is unsafe for fixed-size binary data as
> it may not NUL-terminate and is deprecated for such
> usage. Since we're copying raw CPUID register values,
> memcpy() is the correct and safe choice.
>
> Signed-off-by: Usman Akinyemi <usmanakinyemi202@gmail.com>
> ---
>  tools/perf/arch/x86/util/header.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tools/perf/arch/x86/util/header.c b/tools/perf/arch/x86/util=
/header.c
> index 412977f8aa83..43ba55627817 100644
> --- a/tools/perf/arch/x86/util/header.c
> +++ b/tools/perf/arch/x86/util/header.c
> @@ -16,9 +16,9 @@ void get_cpuid_0(char *vendor, unsigned int *lvl)
>         unsigned int b, c, d;
>
>         cpuid(0, 0, lvl, &b, &c, &d);
> -       strncpy(&vendor[0], (char *)(&b), 4);
> -       strncpy(&vendor[4], (char *)(&d), 4);
> -       strncpy(&vendor[8], (char *)(&c), 4);
> +       memcpy(&vendor[0], (char *)(&b), 4);
> +       memcpy(&vendor[4], (char *)(&d), 4);
> +       memcpy(&vendor[8], (char *)(&c), 4);
>         vendor[12] =3D '\0';
>  }
>
> --
> 2.49.0
>
