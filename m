Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A523D667F
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  9 Sep 2026 07:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939523; cv=none; b=dbTzfPMzzt0Kl3RjfJivMXhTCFwxGkRIscaqjFTGg1IXSKM1i0EGw0BeNz5NHxY0vYy60xIartmQK/WIVq2f7uFxxn9igoDE8tZ1udM55EpU/6YG0DH1HukmY4JqHuS5SumBH5Hr8ibxQ5o6JJ5mKDtrw0MVR5adbH1zM7kM8wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939523; c=relaxed/simple;
	bh=oLrKovMvI6vEuEPm9DSdmFXguG3Eq58Sk5UpeIaY1ZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lSZegcOld/j/1SGrqm2/DwfBHtYyH6jyL7VQ6pMOtivRoh6dsOMoco50KszUElSlhxv7/MFoA7hLiz7zmEJ8uYgnkN1XvRMd8TD+sG4enDgTd1ZhLA0nnAq8A8Wuocdgis7JtJtoGZBLImVwJTwi/F5ZdiDaXVLl4R5ERQ++bWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c25b661d37dso793253566b.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 09 Sep 2026 00:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939520; x=1789544320;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jPhA4Ya5/PqW/e+rBC5ClbUaQ0FR7NY7rHjANc3fz2w=;
        b=cTUrvT3PK+NR78iTKACcQ/5qWPGX+xkr845Jj++sHWT+GJ0EadnTsnajZ4C0bNdox4
         Gtlh4pewFTq75FvfNdBOstuJUDdURT2Gppx+wzcKhdtPyzkbHMApbk83SisP+GeC+T3n
         lcjcfu5WugETkIAbNvEl4vF9hsAd6w7B23DtBfc8FPTgZxR3qBFI9DW44GA6MRr6/f1a
         /AEWpEFgEv9nhTWMAzIh2qlrEAadxsv8eqg/SqPnRsJX74os39Ft73zKLe6E3YIQVmx0
         8w51fx08U+5p/5t0n07wi7SIFcZs8kOkpTiaE0gwR6m4W3wuuUj861+gwXHj313g+NfO
         0pXw==
X-Forwarded-Encrypted: i=1; AKwUvBz+25DX1NPIzNzWKuzL4+oGahzEUqHrn3VxahTEdwQvUVZSD6wjc7phh/6K1n86H8YjyZkS9Wl9YlpJy8FDGI2Z0FLvyw==@lists.linux.dev
X-Gm-Message-State: AFuF++mAWs75C7KEQYW4XCLnppzTO8fiZXeXq1R+XLGYze3KO/pMBwK6
	Uti7kjia9y+Ktq6GkcdlK23MF/dNWPjGnB5UH5nESjqGGySAGImXsDTkP0HuegJ8nVk=
X-Gm-Gg: AYBFou3/x52gPSszAo0XRNDKFVI8hGhuDuAhXdQoeqkX936/h0go2H7k80yht83orvM
	CNjVoTNR2ehYCtlcFjhJMdceR22DOJN6tisDAQqk4nfKUkpD63ZX/KzPFgbd9y0ukMMFN2b+Tsp
	+Sz+1kUAd0snj7XrdRkp0QGN+IBWAPXyizB9R/uZIaOk6eWwAtlCxTeJFMxTkeXuatEnBxvy5jq
	gvVZeVeJ32PBZO+BfDfAKyrPnwmqIrk1hDScHaKkvnHAbpbJT/WziW3H0cSf/TPyIfPCnKJ8Mez
	XAEXsSSFWTRBFmoTSPn4RWgL3K/s9++lWEqDgSU/P4IU2nq73Bd6LEHILzIZuUVbJjbVGwFgBmw
	Ja1u0zGe+BnXi4pYKAAEN/naENYZIYJ/1uQ+qykKmFFXnLRVvrCF/Tgdc1puoW3ICZ2dEuSnKIF
	Rpfv/lj+VmbHTnpdIV/Uk7GMvd8VRLam5FBCyLEHKNxkKX5SBHQe8oMjWssdIVe8PinRLImMxEC
	CmcItGxXKCtjVOVmqxNMaugmnfOr1BK0NqOew==
X-Received: by 2002:a17:907:c609:10b0:c29:3838:dd65 with SMTP id a640c23a62f3a-c293838dfb7mr30156466b.41.1788939519972;
        Wed, 09 Sep 2026 00:38:39 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5bd618sm761817366b.56.2026.09.09.00.38.38
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 00:38:38 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a9983162dcso289538a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 09 Sep 2026 00:38:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzJl27Sxs7XO8636+vqjD/QzJnIEOUHVK97QKuoXADOspPaO9bk5/bSLVgD+Ad3o5CWVfwYLAyeq5efIZ3UMPpV65ngmQ==@lists.linux.dev
X-Received: by 2002:a05:6402:a0d9:b0:6a7:ee56:615c with SMTP id
 4fb4d7f45d1cf-6a7ee5662efmr10229032a12.30.1788939517892; Wed, 09 Sep 2026
 00:38:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260816153809.7067-1-jakovnovak30@gmail.com> <aoLCr8JEYaYxcJcQ@hovoldconsulting.com>
 <CAMuHMdU_Rx4ZGi9SsNxKUDyYmV-GbD8rD9NMVzYginBMXdZDMg@mail.gmail.com>
 <ap7CaVj82BJZgjf6@hovoldconsulting.com> <CAMuHMdX6JfqpLMGDQJSQ8E8XNobRwr16LOzuphPt3Afs-OZdJA@mail.gmail.com>
 <aqEDb0THnCM-Q_Vy@hovoldconsulting.com>
In-Reply-To: <aqEDb0THnCM-Q_Vy@hovoldconsulting.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 09:38:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWK8j200+Of062ghV1E7b0BYWsufEAop_4+3Bhmi0sxVQ@mail.gmail.com>
X-Gm-Features: AcwNN1XBeNCcZxFqMVOeNqjjdkhhsb3Z-uWNgAulmw7oFiph_1tBNYwccdZmiJY
Message-ID: <CAMuHMdWK8j200+Of062ghV1E7b0BYWsufEAop_4+3Bhmi0sxVQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: vub300: fix sleeping function call from invalid
 context in vub300_inactivity_timer_expired
To: Johan Hovold <johan@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Jakov Novak <jakovnovak30@gmail.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	Guangshuo Li <lgs201920130244@gmail.com>, Runyu Xiao <runyu.xiao@seu.edu.cn>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	syzbot+1ee4f3b9228e35f14677@syzkaller.appspotmail.com, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Johan,

On Wed, 9 Sept 2026 at 08:57, Johan Hovold <johan@kernel.org> wrote:
> On Mon, Sep 07, 2026 at 04:48:00PM +0200, Geert Uytterhoeven wrote:
> > On Mon, 7 Sept 2026 at 15:55, Johan Hovold <johan@kernel.org> wrote:
> > > Sure, but should you be scheduling rescan work before all resources have
> > > been set up and the host has been registered?
> >
> > I would like to defer that question to the TMIO experts.
>
> Are they on CC?

Ulf was from the beginning; I had added Wolfram in my previous email.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
