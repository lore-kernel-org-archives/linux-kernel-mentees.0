Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C124F55C4
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  7 Sep 2026 14:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788792497; cv=none; b=SIzirza1+nms+l3+5qUx1d8zZidTs0DnEBU0tuf1UNVeEOf/z0Kby3LBjje478eK6Ti5sw5WglQsvC90gGPmv1q+IT04qK4JTOe31idlIgrJDvwimAvAiTxP4PTD+9Cc5JKjW52qP45l4ytfsFQnMUayqz1iw/Hw/KaIlgimCXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788792497; c=relaxed/simple;
	bh=E0L90Z8k7uiNby0Rmgil4xEwTSX+gJc1C3iKm4pcpes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SG4ToTBalcYL8sbsqhH5B8wvLQA4c3oY9X0LI4PWJJG3onyiYJxMcU3UKoE5N1MM1KqFugNC7gVlK6imG8E0KiRYaLAomW6P9uDpsH9RVr7PHgbF+2X5hvpIPqqbC5rRXvWh6xQlkdUqkPWMCWO2ohVAStY/lM9nfCLv1c2od0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-782af6c753cso3354090137.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 07 Sep 2026 07:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788792494; x=1789397294;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=417Vq4voeTSrz4Uh3qUJbU6StigGvlQmE4Y64hf9ijE=;
        b=YOxfnd971M5T1OxVE/8pgyw33nwBRKkjN/4lsPolNVmSTy8I9VcwMtpeERLR5B47SV
         O/qkE73hDFlbjSHG7tOGhqkqWAhBnShBphVPcqCxkxqzkU/JFUHq18DmistrA7BBrZEn
         lJiZKmUbMwzJCaQPQnuLEOcx3qFU6HbZualUbQtONEOjv9w2gKwORbofkGxy54PR1kHW
         21XdvzST5Qt+eu3fBjqYjyF3TZ8WlnbM8umcs2J53HCUPyoCvu5lv265BF7lsbLVHapb
         j18u1LBZSdJGNGwS6s+dl2QzCXGd2q1rfHjGwAg2+0nI+rgIrEA0ScxevjrQ/0s5oL4k
         fOAA==
X-Forwarded-Encrypted: i=1; AKwUvBxALLdS8hBNMue+l5Tn7DoaMJTc6DhxV+JUQQ5RPlxH6v57lTwozvv6GyUT+veAO31V+5pvX5AmypdHfsIy0Ls45Z4HMQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nG3y4bvo9geFel2t3pumLhd9pjBh9uxEdydd53kb8c5tYMmR7S
	yAfJH1Cict8V2yoVDJkqc3uR8CZGkf7J6u63v0ErgtowtPcFMBroLCFl+19pvlZW
X-Gm-Gg: AYBFou03RLgEMvuPe43DuwlkQTs/6YNugbGIhkN6lMH8OfWQNIIZBWZLvt4rzZbA/SD
	iBWbpFUb+JJJEOrk80u+jcp35wfpYEzdQmKrgOiBJjL+bmGOkvchq+J3RCOnxs06DP2UPJxGie6
	YuE6pxDXB/LJkWUzYH9joIRuz5xM10e8FNhCRy7FeCvnkKKHaom5Gbzjz9yJux+TEpHBhEEPfzS
	dg2Edg2S75I4+i0P+iu4+YCopXLWdqCeweGUXyPW7Y/nHZVQH8dxcSVyvgOtsWMiJ5dzlp7FZbO
	qxFi57970GDGFJpWUn/+Lr21CJG2mej00RfVT1TCuyiW1UxBtRA5HExKH5KsE+jpxY4UzENHrwL
	mqM9DsUy7Fla04ti/COBajtW7qKXM+8FhHEFhpa0EJMVnhq4ZyQS+lxsJdeturV7XAI7PuKFNc5
	UBTY0errQP4hV761I3opBbi9+vCUaxrgpYCYxhpBnEhaIwf/5QHD71uX2veIyxnxH8JoD5YE90Q
	sV/7GDBSMLMHOzu4FqIhk9QPA5JJ74qd0Ec
X-Received: by 2002:a05:6102:560c:b0:786:aae:aefc with SMTP id ada2fe7eead31-78a4aa9d9dcmr9829833137.13.1788792493816;
        Mon, 07 Sep 2026 07:48:13 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808eeb22e5sm7487808241.12.2026.09.07.07.48.11
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 07:48:12 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-783fffcfb96so2800079137.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 07 Sep 2026 07:48:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwPBhFgr3PNpSdvZzeygnGhidpqpNaoNPBGr0JA1XAeRcftRJ49ggniCYliEqQBn/hI9bYcQXDr5tAYgJJMcSBQakC3pQ==@lists.linux.dev
X-Received: by 2002:a05:6102:b02:b0:786:c86c:4f5e with SMTP id
 ada2fe7eead31-78a4a6e7023mr10514501137.3.1788792491716; Mon, 07 Sep 2026
 07:48:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260816153809.7067-1-jakovnovak30@gmail.com> <aoLCr8JEYaYxcJcQ@hovoldconsulting.com>
 <CAMuHMdU_Rx4ZGi9SsNxKUDyYmV-GbD8rD9NMVzYginBMXdZDMg@mail.gmail.com> <ap7CaVj82BJZgjf6@hovoldconsulting.com>
In-Reply-To: <ap7CaVj82BJZgjf6@hovoldconsulting.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Sep 2026 16:48:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6JfqpLMGDQJSQ8E8XNobRwr16LOzuphPt3Afs-OZdJA@mail.gmail.com>
X-Gm-Features: AcwNN1XKT5JMOm2wspHuB0_T9Xeh0iYlXl0ZBuZdAHt4KZH-NPNXF5M72vmaKSg
Message-ID: <CAMuHMdX6JfqpLMGDQJSQ8E8XNobRwr16LOzuphPt3Afs-OZdJA@mail.gmail.com>
Subject: Re: [PATCH] mmc: vub300: fix sleeping function call from invalid
 context in vub300_inactivity_timer_expired
To: Johan Hovold <johan@kernel.org>
Cc: Jakov Novak <jakovnovak30@gmail.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	Ulf Hansson <ulfh@kernel.org>, Guangshuo Li <lgs201920130244@gmail.com>, 
	Runyu Xiao <runyu.xiao@seu.edu.cn>, Shuah Khan <skhan@linuxfoundation.org>, 
	syzbot+1ee4f3b9228e35f14677@syzkaller.appspotmail.com, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Johan,

On Mon, 7 Sept 2026 at 15:55, Johan Hovold <johan@kernel.org> wrote:
> On Mon, Sep 07, 2026 at 02:17:45PM +0200, Geert Uytterhoeven wrote:
> > On Mon, 17 Aug 2026 at 10:13, Johan Hovold <johan@kernel.org> wrote:
> > > On Sun, Aug 16, 2026 at 05:38:09PM +0200, Jakov Novak wrote:
> > > >  Currently, the function vub300_inactivity_timer_expired, which gets
> > > >  called in a softirq context, calls a sleeping function in the following
> > > >  call chain:
> > > >
> > > >  vub300_inactivity_timer_expired -> kref_put -> vub300_delete ->
> > > >  mmc_free_host -> cancel_delayed_work_sync -> __cancel_work_sync ->
> > > >  might_sleep -> BUG
> > > >
> > > >  Fix this by replacing kref_put(&vub300->kref, vub300_delete) with
> > > >  vub300_queue_dead_work(vub300), which does the same thing, but in a
> > > >  workqueue context.
> > > >
> > > > Fixes: 88095e7b473a ("mmc: Add new VUB300 USB-to-SD/SDIO/MMC driver")
> > >
> > > This isn't the commit that introduced the issue. The blocking call in
> > > mmc_free_host() was added by commit 1036f69e2513 ("mmc: core: Cancel
> > > delayed work before releasing host") in 2023.
> > >
> > > I didn't look at this in any detail, but having that call in
> > > mmc_free_host() (e.g. rather than in mmc_remove_host()) looks wrong so
> > > perhaps the fix really lies in MMC core.
> >
> > mmc_remove_host() can only be called after a sucessful probe, while
> > commit 1036f69e2513 fixed an issue where the last probe step failed
> > with -EPROBE_DEFER.
>
> Sure, but should you be scheduling rescan work before all resources have
> been set up and the host has been registered?

I would like to defer that question to the TMIO experts.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
