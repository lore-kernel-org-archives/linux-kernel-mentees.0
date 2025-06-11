Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A6017A31F
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 11 Jun 2025 18:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749666928; cv=none; b=ieG14Va1J6WZjypDS4nu3ewG46tFbldHv8HYb8Jng1fDNZSTX67/C0vvM0XmHBMi3eGAa+nuiwsM5jiX8dv1kUP8eys1OLuuqnZj3ikxrzW3sto9kP1LzCSM6KNQQJ/jJQwgTskkLftAM8GMlQFEytXkJzu5HIrIjeinIIYKFKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749666928; c=relaxed/simple;
	bh=PX+uFi2TRcTAZzkDxUG4RPAgbW201ntMO7lrolf22Fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QhBaU4ge16siKLkZ043n8KWyabNkbd8ArFyBF60Qv09JAe+QG98Ku/0QHig2offvcEZxY6PXZIPEaRt7LB6NcMWwRNibOn5t9ggGAFnhsSXAayfu0fvrMxN6fawGTRBKHqoccHJyr/4VpSZ9wR3mFr3UxHNLxPY4fV1ea/1gmtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rpp6E5lh; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rpp6E5lh"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55351af2fc6so103505e87.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 11 Jun 2025 11:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749666925; x=1750271725; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LW+JbhkF0pib1AA3WNg/XYx3vRhJwNQnFgWXrNhyNI=;
        b=rpp6E5lh+NEk8WDX0HC9wkZgmTiCFe4Oz/2/ZPn9Km+tA2NFYSMOtERszmGk1bKEY2
         FZjc1YBiUDWf2iQxSE1qzqIgMMXeSFmZo/1+mCs0ClWyO+jQOW42K6/A0kXhA7WM0z1O
         Wn8ngsPL763qhwNzOm9YgF49y/4RaatPHg9DcDU4JcIGJRkh0M1FoEgD4rWFuXh3CwFH
         NROI1O1KhYqJ8yVOJSIgthzN7VFF/yAtfE4/FVDO1jTRgkD1KkMZMcivMyOZLq+CxuCH
         vHCHvqpQ84vhPOXFT/bQiIWHuWTURkrC5YrBSQ2SYPYS7QGfOdQtJ64c15reSPMwWPTn
         Czfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749666925; x=1750271725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4LW+JbhkF0pib1AA3WNg/XYx3vRhJwNQnFgWXrNhyNI=;
        b=v6+4YqtJh9wWXpWFP/lQ9duOrrqkkcu34x05eut3iy/hhe85k22Ay5eqHdkMs+ecyy
         d3HoOoeFkdzZpys3QivNuy045byJ/fW7r3/whnyy9vqFrxkgwj0HNpB3jGT23BAtDKPu
         Yd6PiOTDTUtRUpJZDuJMBXC2jKk0EnNKWwgt0mb55+EtnwZRpGR9jCmGkN9+Z/FU4pf5
         NL9+SZBK8ITaRTw5C6bvMpqTpGH5tGqcA5rGzm14aA4fU5i2EVSSAsaRCWT5MzGwlXgb
         X+VfyKCsIo4eyEyU7CQzraAmU5Kv2SEibulWelGT3HhXOmoL7nYeZSX+VAdwTf9YwlhT
         is+g==
X-Forwarded-Encrypted: i=1; AJvYcCX8SoY+slP/PLbZ3lTOrg9KNC2D7tibRKALDrByJ35zlyXhQ50/qcS08JtwdoUlIxZwnMLdnsv3sEUOabwmSYTp3ff2+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmTwSlPXp1NQ1+dHD198wFkgCFj0bEyttJeUt4QLqjh2j4tsT/
	D39VJZsJcU+NUQ4G48ONvzQBlrTzB5Cn3jrievBGWup0JpMVkozbc66ogXvtcnsdN7fCASnWylG
	hDnEbf5VVV1+YbQMPZyoB3aGhNinmT1eDZVzF1i4=
X-Gm-Gg: ASbGncsyevd7uJ4KLV14dXSk1GsK+Wnls8a+N/5tWsYOVMISZMw0ecGHfJK8AwVWo2E
	0EqVc5nMaAq2FlL1KtRtJzIM9RuO911AT2Dzh9IoNB7p3qEXT8exflRnPKPtXT6GuOl6x2COMTv
	s1vuEjcyVnoAVBL8/+MjcU3MwvjVfRGo8aFQ8LPPdpiQz8AKpKkratz6IDQPd2K+pqn8DvTLOZ9
	jTWsXC6
X-Google-Smtp-Source: AGHT+IHhJ2bujyaLwyGfM62GuB4nxlpb8VRVfrxNgScBPvK+ovW5Gr8i/lmdjCY06YU1YK3LOhGiWRzZ2Ly5ZcPlDyQ=
X-Received: by 2002:ac2:4bca:0:b0:553:3916:4e1c with SMTP id
 2adb3069b0e04-553a556785dmr144689e87.2.1749666924953; Wed, 11 Jun 2025
 11:35:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250611104506.2270561-1-richard120310@gmail.com>
In-Reply-To: <20250611104506.2270561-1-richard120310@gmail.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 11 Jun 2025 11:35:13 -0700
X-Gm-Features: AX0GCFvxFuyx5v9O2yGfkI2Uej1mipIc8heSHC46LTYcnHRLUpOAa2r2xFAgXhE
Message-ID: <CANDhNCoJ_MmpEfyuL+JWav+NUfQDH3dm196JSE-Mv3QrPUzi3g@mail.gmail.com>
Subject: Re: [PATCH] clocksource: Utilize cpumask_next_wrap() to shrink code size
To: I Hsin Cheng <richard120310@gmail.com>, Yury Norov <yury.norov@gmail.com>
Cc: tglx@linutronix.de, sboyd@kernel.org, linux-kernel@vger.kernel.org, 
	jserv@ccns.ncku.edu.tw, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 3:45=E2=80=AFAM I Hsin Cheng <richard120310@gmail.c=
om> wrote:
>
> Simplify the procedure of CPU random selection under
> "clocksource_verify_choose_cpus()" with "cpumask_next_wrap()". The
> logic is still the same but with this change it can shrink the code size
> by 18 bytes and increase readability.
>
> $ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
> add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-18 (-18)
> Function                                     old     new   delta
> clocksource_verify_percpu                   1064    1046     -18
>
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> ---
>  kernel/time/clocksource.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
> index bb48498ebb5a..ab580873408b 100644
> --- a/kernel/time/clocksource.c
> +++ b/kernel/time/clocksource.c
> @@ -343,9 +343,7 @@ static void clocksource_verify_choose_cpus(void)
>          */
>         for (i =3D 1; i < n; i++) {
>                 cpu =3D get_random_u32_below(nr_cpu_ids);
> -               cpu =3D cpumask_next(cpu - 1, cpu_online_mask);
> -               if (cpu >=3D nr_cpu_ids)
> -                       cpu =3D cpumask_first(cpu_online_mask);
> +               cpu =3D cpumask_next_wrap(cpu - 1, cpu_online_mask);
>                 if (!WARN_ON_ONCE(cpu >=3D nr_cpu_ids))
>                         cpumask_set_cpu(cpu, &cpus_chosen);
>         }

I think Yury submitted the same change here recently:
  https://lore.kernel.org/lkml/20250607141106.563924-3-yury.norov@gmail.com=
/

Though, I think he has another iteration needed as Thomas had feedback
on the subject line.

The bloat-o-meter data is a nice inclusion here!

Yury: Would you be open to adapting I Hsin Cheng's commit message into
yours and adding them as co-author via the Co-developed-by: tag?
(Assuming I Hsin Cheng agrees - See
Documentation/process/submitting-patches.rst for how to do this
properly).

thanks
-john
