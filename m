Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BD6230BE0
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 31 Jul 2025 11:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753962950; cv=none; b=BhZ0kQnnCw1nVZJ+u7lghjXHUnDkXRdaz/A9fcO44dyBOsJ78HAVs7grSrcg9/QrZjN3EvtQ++nZCSCihM9wB+r0ogbEoAOVab9X8XThLyB21b/1hWrMZjgmVIO7A+eSm6PUA6YWskmy6i+SK+XvBm61lb05sE9qqa8h94L6yVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753962950; c=relaxed/simple;
	bh=TMRgIfVaPaMmqSgwxb2UXWi+J4AjACdcEmoH57tphH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SIvE3DQesn0YaZumTs8yf3MvXTV6GB7Ek4gJzw95sWHFsvAd6bfKaXu4QuDWIwgs2FTBMR3ycUinmpWn/rmy99ig/hEYleWq82umv/6Lj9wJQJ8ff+f0vJc6A4Me+qrum2z2GZVubD70qfPiNKa8pLfgyRDUsVJ57TAL2gWXIKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4efbfe9c7a5so1292178137.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 31 Jul 2025 04:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753962947; x=1754567747;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZgBCsFkQyJsREYZM7w6ELsHHNFNHMwhO0bNKPMndJnk=;
        b=S/X8XsxvW3bA/OZY96si0NMu9xqYeVV0DCeCYQRtiQ4ALxbhgZ1XfUNnecjL4JTq64
         lFUM6FvxettcEy9F9l51edR/JKk1IZOdEFX3Z5/WdLHw3/9GSmTZ1TwoZbrlsP9F+Qlb
         g6hEil4H7PF0hxyxizjQfHvb9OGOkOBaa7xdTfh2dqgQc3/ldyz9k8fsG+TazMO27Pqe
         qg3NXDEB/heBB9DqSkocVxcQ1LxRo9QNfKjsPIetCV7UX5m09gmeAxcAPWjgKzcFmw4m
         FDnNX8NFLHf1Zyj96FF1Ua9oNXqjuGYgrAu5Ry6C7zyUrrEjRwhIYvKwQO5rP15pQdFc
         M5Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUcVMewSQOe04e2+OoARk+1LqlumvT5Xo/xP5+/hTKYhM3qATVqi7vIjcE6lLrc/e+J316VFxzxe4FN1pyLVt2Mqmi+rw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHcu4ph3jhlFNOgtiWlPkIRCgdOV4G31toh4WfpJz30sDLxLCf
	w0SocCaW1f9BnwqzlQfmiFRscR8ISdvDmhqKU3KbcgIEU5ZUbqdUPk5jMJ3Rt8EQ
X-Gm-Gg: ASbGncsqLpKzRECKlbV6qbYse3yNOhQxfQO3btaUxYRxVVUSokkxxg6R2rt+ZYVc7Py
	5ZYbEM08iGT92dFdsCqu3HMRVuoi6HtwP+yTvSuKWeQnxRzQPcSDQuTYM/zhXtCEDfb8Ac/fcGo
	zE+OyauGqdVcWFq3GAqswXWpT8718Nx02dCJwATv3Y4waXM/cxpoNjqaMddLICjh2TBgWJLK/S7
	UbdW+/1mA+b5nAMjld6AqGcVP5GXf97WsqJgIoVVFm3vJU7fAJ8oBC+Q7m8gS2DkvGggEnWBptH
	MKYC+siiylMyiY/KJTjNZlFboGqQ9fbO1ijCGbd6x+yMJG7HLuooP26RglqTSuV5GXDMHvz5xCJ
	wMZxBU3aepEqaGEyp/0X56pZo8viFlo5EsLxZ6NvuDOmlZdjdBT+tNLFjBmUf
X-Google-Smtp-Source: AGHT+IFE1B5GgyD3E24kZQtnN0rv78mPhhKA5akf81SkQ3uI6Idp10mtEh6nCGAqIeZEiJ37MKEblQ==
X-Received: by 2002:a05:6102:f8c:b0:4e2:83c4:9298 with SMTP id ada2fe7eead31-4fc0ff04e88mr685957137.3.1753962947240;
        Thu, 31 Jul 2025 04:55:47 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fc0d4a35b4sm274008137.20.2025.07.31.04.55.46
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 04:55:47 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4efbfe9c7a5so1292164137.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 31 Jul 2025 04:55:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZLeEaPY52sx1Jja8VKkb+AlRlZnfkv3pUHg3IOyZCVT6saVzUDliC1OW5b3C012tl6EUBPW+OGHihk2ar/S5AeTzrLA==@lists.linux.dev
X-Received: by 2002:a05:6102:6213:20b0:4fa:3f49:a3b4 with SMTP id
 ada2fe7eead31-4fc0fe5912dmr411782137.3.1753962945954; Thu, 31 Jul 2025
 04:55:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724072032.118554-1-hendrik.hamerlinck@hammernet.be> <53eb0068-008b-48e6-9b92-d92de2ed4fc9@kernel.org>
In-Reply-To: <53eb0068-008b-48e6-9b92-d92de2ed4fc9@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 31 Jul 2025 13:55:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU2e+5Hf3v=C=sE=+25f_A=2=Zzw5rxvcT=hb75VC=iFQ@mail.gmail.com>
X-Gm-Features: Ac12FXxnc_9pSxwppilSjmsQmBU1O_sD4A7Qq9U2sutpyBkl_2v6bCquVSRwEoU
Message-ID: <CAMuHMdU2e+5Hf3v=C=sE=+25f_A=2=Zzw5rxvcT=hb75VC=iFQ@mail.gmail.com>
Subject: Re: [PATCH] checkpatch: validate commit tag ordering
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>, dwaipayanray1@gmail.com, 
	lukas.bulwahn@gmail.com, joe@perches.com, corbet@lwn.net, apw@canonical.com, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Fri, 25 Jul 2025 at 10:42, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 24/07/2025 09:20, Hendrik Hamerlinck wrote:
> > Modified the checkpatch script to ensure that commit tags (e.g.,
> > Signed-off-by, Reviewed-by, Acked-by, Tested-by, etc.) appear in the
> > correct order according to kernel conventions [1].
>
> These are not the conventions I use for my subsystems and ask others to
> follow, so imposing TIP rules to all maintainers needs broad consensus,
> not (yet) checkpatch.
>
> What's more, I think above TIP rules are contradicting with existing,
> widely used and approved toolset - b4. So no, if you want universal
> tool, please use b4 or whatever b4 defines.

B4 does not follow the proper order:
  1. Multiple Reviewed-by tags may be added in a different order
      than given,
  2. When applying my own patches, b4 adds the given tags before
     instead of after my own SoB.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
