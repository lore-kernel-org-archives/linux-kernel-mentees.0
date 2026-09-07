Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122BB442B1D
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  7 Sep 2026 12:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783482; cv=none; b=MWp7XexkAB+GQ9mNoUiYH9hLSsnxJjqy8cvdRB5U8vF5nhCnBjk/HAyiuvSaQrpgGnkCVNImWWlIuIRqu7Phot4kHdlhyTBpxj5EbJA1yqy6bCeP6eCDrjBb9aYXp3qq7zDYwGJYl1eV/IZIxCb74EfwtkXZOe1WHOE38SFTSRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783482; c=relaxed/simple;
	bh=VEx282xJoSaEd9yFgg0bC7E3UZwOapIeeglnsmObeHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MT//iz3oBbTX0AGqn3Uz3nedT+nAgj8HLpxg0GIREZChauqj5MfiWYqKMf4Cty2bs5iT6GUs762I4VzKu8d+jiYx9WjqZYcVC/3pDc28FgDBHQGrtuJ/sJLDBpXTWPFR7fYhTFA9W/t6s0Kfqg9Qa38rn8xI/TIQcYME9IqZjow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-779d18ef706so2529365137.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 07 Sep 2026 05:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788783480; x=1789388280;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ICs1H2dY7Gpq4y5UR8p+p9hgLN+TaINBuRZGUQCEu4w=;
        b=DezaYYyhF5ODbeHEbl8W0al3TyCFpu4YO+g+qWuXY62q5D0kMAtNnW9on28pgVQe7m
         hsUgPGCRZY8/fd52L+6FAy6j34EajeIqiYZXGI+Qfc4cQ4H7roxpmrp594zTOlAxzzF3
         jDTLE3npQAVHOzPK0lCeQVRSOwxaSuscsGBHxW6kEFNkYcs3fpju8XUTDei9vYJ3prAw
         +TZHIw1vAxs37j9ts5Me2ZjlpKYepyOKM/ku8DIRWd3qJBzDQXCiJyV8vfGKkATxoMdX
         WNUtwub+0x3yF5I1TyZn4sHW3trBZsERdwAThCgqR9u2XQ554ZxJ8T+6j4CIGiOMPVVg
         PvMg==
X-Forwarded-Encrypted: i=1; AKwUvBzciezPhwC3szb6zUzIXkA0kGgLldZ1vLdz+f8svSTf1qnmGMe7zRxaafQzWjeK1nhXhZp4lUeVkG4TPeWRKul8g1gyMw==@lists.linux.dev
X-Gm-Message-State: AFuF++mVpiMoTBJtIwUYCcEpiKPXB7QA388IKMGaWEjuBpQtNrlfMGWG
	aie7fR8/O21yaPYYvi1ZjFssB/dim7POAKdWRAiPoaNBvBR7XM4dlXDcGcdHXMMJ
X-Gm-Gg: AYBFou0WmoEKr9K1IsC7QJIrtdVAefExVKTrIK2gPRQ+iGAsl7yMh23/stPfY3OzCbn
	K2Y/KRnlDRY2gGR5JM+A4iIXcqNy0asxdHMj2hctLh0c2oB3UM4bSWFPvJBTBH1DortVvVP2G6y
	Hvbp1A39odEp8QFQq7+bblRp02pgc9CloVdWjh3guLy11iTPg413l3RJloMDGqOL3De+CVpApj6
	u2k3iAQTood0KZbdeqeSS9rhSxoBqGN81xelUtVcPN9laJWMvCo/XGPnVLt5fPH5pY4CSuv4WW8
	V2WptQf/zyWGLS2e5wat1wCNFjJ/x9MeekXBgZ1XiyA8Xxf0ONNEGKY1DsJxPy1ULY5dtFfMJR0
	+MWTu+7Fp0E8LTUdRhAmm4TsOno1K6Im3lNLLOdpVmQOk6jHJpqwh4g8qx3zat9uHY4QUWv69uH
	9US3RrRGMVeauot9WS3/9H1Pfzl+SmeY3jVC/ObwqvSC+izQxF21BcQSD8aI/RAzDa1PRoNQ48c
	+fZeKU4abBN0FGGf5dadaesKQ==
X-Received: by 2002:a05:6102:560c:b0:786:aae:aefc with SMTP id ada2fe7eead31-78a4aa9d9dcmr9221478137.13.1788783479788;
        Mon, 07 Sep 2026 05:17:59 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ed1dc86sm7104098241.5.2026.09.07.05.17.58
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:17:58 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-782af6c753cso3243694137.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 07 Sep 2026 05:17:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy9LpR/gWX7vvU4JZZ6FlycZXbTIr9rwEKILFngnPWq9ormJFpeDdNBCVks3hvQe401Sv7GExrUvhA/p9uZryUmJBtL/w==@lists.linux.dev
X-Received: by 2002:a05:6102:5126:b0:785:5a17:739b with SMTP id
 ada2fe7eead31-78a4a4944femr9543602137.0.1788783478176; Mon, 07 Sep 2026
 05:17:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260816153809.7067-1-jakovnovak30@gmail.com> <aoLCr8JEYaYxcJcQ@hovoldconsulting.com>
In-Reply-To: <aoLCr8JEYaYxcJcQ@hovoldconsulting.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Sep 2026 14:17:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_Rx4ZGi9SsNxKUDyYmV-GbD8rD9NMVzYginBMXdZDMg@mail.gmail.com>
X-Gm-Features: AcwNN1UGIwaDEpSQZPDqi3a020L7heHOErQjuz6sflvRFDaDCrMR20u-OR5PZhk
Message-ID: <CAMuHMdU_Rx4ZGi9SsNxKUDyYmV-GbD8rD9NMVzYginBMXdZDMg@mail.gmail.com>
Subject: Re: [PATCH] mmc: vub300: fix sleeping function call from invalid
 context in vub300_inactivity_timer_expired
To: Johan Hovold <johan@kernel.org>
Cc: Jakov Novak <jakovnovak30@gmail.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	Ulf Hansson <ulfh@kernel.org>, Guangshuo Li <lgs201920130244@gmail.com>, 
	Runyu Xiao <runyu.xiao@seu.edu.cn>, Shuah Khan <skhan@linuxfoundation.org>, 
	syzbot+1ee4f3b9228e35f14677@syzkaller.appspotmail.com, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"

Hi Johan,

On Mon, 17 Aug 2026 at 10:13, Johan Hovold <johan@kernel.org> wrote:
> On Sun, Aug 16, 2026 at 05:38:09PM +0200, Jakov Novak wrote:
> >  Currently, the function vub300_inactivity_timer_expired, which gets
> >  called in a softirq context, calls a sleeping function in the following
> >  call chain:
> >
> >  vub300_inactivity_timer_expired -> kref_put -> vub300_delete ->
> >  mmc_free_host -> cancel_delayed_work_sync -> __cancel_work_sync ->
> >  might_sleep -> BUG
> >
> >  Fix this by replacing kref_put(&vub300->kref, vub300_delete) with
> >  vub300_queue_dead_work(vub300), which does the same thing, but in a
> >  workqueue context.
> >
> > Fixes: 88095e7b473a ("mmc: Add new VUB300 USB-to-SD/SDIO/MMC driver")
>
> This isn't the commit that introduced the issue. The blocking call in
> mmc_free_host() was added by commit 1036f69e2513 ("mmc: core: Cancel
> delayed work before releasing host") in 2023.
>
> I didn't look at this in any detail, but having that call in
> mmc_free_host() (e.g. rather than in mmc_remove_host()) looks wrong so
> perhaps the fix really lies in MMC core.

mmc_remove_host() can only be called after a sucessful probe, while
commit 1036f69e2513 fixed an issue where the last probe step failed
with -EPROBE_DEFER.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
