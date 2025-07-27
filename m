Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10F33987D
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Jul 2025 16:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753633473; cv=none; b=oZbrRnc9LgCRtg6+6pE8kX+xzNogRlgSuKdHUefCfx5FEkfiVc10OKMuo9jG03RunZuHaYC/KQ/zrNcf+Hcj7pAVbcUoWp6hsLcPIXM+u6ObMqNXcmfk53jUvULSMAZHC9kivpOmWfZeLwUISqi3XqYtXp46Inf6osSnFfYpzzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753633473; c=relaxed/simple;
	bh=rpRWUHNyg1JY1vO7MjL9uEYpu9PHGuMnac8UiEIVPgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PVbYb7nKN8l0oMmy/ZjVvwA4k2/9iI/CsPibTFB/A2PRS8qTIPt2Iymxasj3QX4ydW0LJVpfpw7lKfAU2trWBejUUhQwf+9IDGfH1yDTcVISljT9LDCYdZ57/kd5LVgp20B6H3RzrkAPdfz+0u9zk0OHHqQPJzxiCLmqiV7qs/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMUWaFy7; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMUWaFy7"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-615eb598b0fso2039699eaf.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Jul 2025 09:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753633471; x=1754238271; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s5M0ltdv2beQVV3gmmKUq4n3fQKkCt9o4jB/0j8O45E=;
        b=DMUWaFy73oEjFfZK/z1O9YryCkzRpfFv+Q1pMtSB9R3yly0hRuAU6hjySgLIs/A+rO
         y/2LNn1f6rL446kAONAIgnKlb/xoAQgmBDSo56r2TTzFgOHUMfv/pKmmmtALX7iZWBcr
         kluZ8PmHCoBN6BPhEfOZPCkktBdirDJ6stNe9XYdPRrmazBly+ysiRG2wnK6cfL9KCUM
         Q+i/8/JEvxLL5md/x/bb3zk8dDg/cNUUT3mQ7ltyKN4d8TTcH2DNbq0sJzBpnWTlemBY
         Q9Be6r1jA0KEATaOjPJexPJpzEeHxKDAFrYqNW0EM6blEx8PQDbLJwPIZN/eWbxzrfM9
         SunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753633471; x=1754238271;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s5M0ltdv2beQVV3gmmKUq4n3fQKkCt9o4jB/0j8O45E=;
        b=fOfWGUXX25xyV7XifJJ+Ydx3X+vyiR1NM3YwX60Xro4knTGMPD5AHEmJTBfC2vBTc7
         y5680/jTMmfp6v78wB98J7pi0+Qeeei4uKhZt/Nuncmw2RJuZ+anCZATicTScNPnMmjl
         BPLzxlAf4zWbcQzphUKrvEI0OWAhFkCeSU3lh0N38uHa1PRukTy1LyJZg80k/04+XjeQ
         Cjoqor5SwMJvcZ6T7dUlPhobNzPy2FI1xWPyOpQgjqRBVJnPGJGw/RSxM32or4ZNwHTj
         72lAfkhaJvJjZZawTIhYnaFtAewKsm3Z0P2cimBKbSBv0c0kkS4Ui4YpExXOXmBZxewy
         Eozw==
X-Forwarded-Encrypted: i=1; AJvYcCXekv8pTbVLBK1rKc3B/TZzRYkVuVf5dmUNFirTj17QV7K4ymWrTzUiShHetSUaI9MCG4EoVRJddVawG//PYeCOMyOEfw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwV38POzJk/4LQwuLFgAt1XOxkQ8+DGyImI01aX5nTYVECA2ILP
	nAa3pkK0jXAg7HFu+XuLq2kvNezJJ8h9U+yvSQGRP1jmlhH/RZHHyDsiRpuwJVqfKibYqD6dmoD
	f8m45esXchdsg9JkaDi0xX0NUt0b32NA=
X-Gm-Gg: ASbGnctKFqiW2Ggu37O7MGW9/miJ4sNz75iujAAVk2V3rcm+MVQb3PjLKdJMDNdBQwH
	ZwfyTTsPSLuZnbo98MdgA1i3vZBr2gwhFMr5GUwdFvZKp0W8y9sugdgpS7EsX5vLgp4GYsH6KwX
	SevD9RJ3+Khz4Vste1LYuUlisfMLLmznsLszhNyl38drMG2B+7GPzMBT/vfnpnJv24x+nW01GCf
	sOVU14lrw==
X-Google-Smtp-Source: AGHT+IFx87y7GH7qHhjSoMH7hs3QC1LF5QirQljS1IUo+EbqYc4zfCHQG3fXOD+43u1VKcMia9PYWVTW/7rVmpbKmKs=
X-Received: by 2002:a05:6820:1888:b0:615:8277:d5ee with SMTP id
 006d021491bc7-6190c950780mr5579210eaf.5.1753633470766; Sun, 27 Jul 2025
 09:24:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250726175524.146459-1-suchitkarunakaran@gmail.com> <20250727-fortunate-jackrabbit-of-dew-4efe3a@lindesnes>
In-Reply-To: <20250727-fortunate-jackrabbit-of-dew-4efe3a@lindesnes>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Sun, 27 Jul 2025 21:54:19 +0530
X-Gm-Features: Ac12FXxcJOjlaVaFEVSJ1f6CYSw2BQmsOQPFP5ZA-6vUOgUY1E3KmiSo3bQT0SM
Message-ID: <CAO9wTFiJquC88n_UTKtiU4ETzuio-=YCgfj=omMYYnN=bB5XOQ@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig/lxdialog: replace strcpy() with strlcpy() in inputbox.c
To: Nicolas Schier <nicolas.schier@linux.dev>
Cc: masahiroy@kernel.org, linux-kbuild@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 27 Jul 2025 at 21:49, Nicolas Schier <nicolas.schier@linux.dev> wrote:
>
> On Sat, Jul 26, 2025 at 11:25:24PM +0530, Suchit Karunakaran wrote:
> > strcpy() performs no bounds checking and can lead to buffer overflows if
> > the input string exceeds the destination buffer size. This patch replaces
> > it with strlcpy(), which ensures the input is always NULL-terminated,
> > prevents overflows, following kernel coding guidelines.
> >
> > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> >
> > Changes since v1:
> > - Replace strscpy with strlcpy
> >
> > ---
> >  scripts/kconfig/lxdialog/inputbox.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdialog/inputbox.c
> > index 3c6e24b20f5b..ca778e270346 100644
> > --- a/scripts/kconfig/lxdialog/inputbox.c
> > +++ b/scripts/kconfig/lxdialog/inputbox.c
> > @@ -40,7 +40,7 @@ int dialog_inputbox(const char *title, const char *prompt, int height, int width
> >       if (!init)
> >               instr[0] = '\0';
> >       else
> > -             strcpy(instr, init);
> > +             strlcpy(instr, init, MAX_LEN + 1);
>
> oh, I am sorry for the bad recommendation.  On my Debian bookworm arm64
> machine (w/o libbsd0), this does not compile as strlcpy() is not
> available (same as reported by kernel test robot [1]).  As libbsd0 it
> not a documented dependency, strlcpy() should then probably not be used
> either (and Documentation/process/deprecated.rst also argues against
> it).
>
> So, keeping close to Masahiros mail [2] a few weeks ago, what about
> this?
>
>         else {
>                 strncpy(instr, init, sizeof(dialog_input_result)-1);
>                 instr[sizeof(dialog_input_result)-1) = '\0';
>         }
>

Yeah even I faced the same error. I initially tested it on Arch Linux
and it worked somehow. However, it didn't work on Debian. I'll send v3
with the changes as you suggested. Thanks for reviewing.
