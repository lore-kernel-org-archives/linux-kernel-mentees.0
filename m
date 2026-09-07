Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A676E48A2BE
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  7 Sep 2026 12:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783592; cv=none; b=oQz7w2+91qAe+FQ8Q4SPSmQP8em6X/kDkY5T1k5KXkhnKAYttQZWVua9xX73uyaQoo6kMHZDUgTzH3zVRwY3NMJlWRYbGqXu6K4E5Od2WI18wKVPC9f+vhp0BJVhNh2NotN+IwZxGhsq0747wv/3xzqU3bNqC1TdwuYLXkWe1bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783592; c=relaxed/simple;
	bh=8sWGG3Euclft4zNcorzRAt017Dh4vpMTzE9Ojma39XU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n9YaePqpoKNRCPDIA8XKieUc+WILAIbtffgY8OXvLMi428zhs8rg6dz9OCgaqdIfB5WXFd2TrZeNpGDbsDnuuIRLnUSEiRJ4iaKvnB0XgwQskatWBJMwe9YWLFkh0/MpbszLj7t1NNgjkbMC9Qr8eHDKIqga8tmRohYtpanrGYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-782c22fbb1cso964058137.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 07 Sep 2026 05:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788783589; x=1789388389;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Tty7R6qNyM6xJP4pDUeVUDGDAPfBrPAZij5mJHmykyU=;
        b=oPp/onEiTRQXsYjzT6+PHF3+UJSrqqCNJBLG2jgDGLZAfmHTZ4ZKdx74EvhZEmVuC3
         6tb4Q51wP3u2FPhgj75ZGkVmX1fqoD/r+rrTMsALJU8WTl282Cx2038X8gF8GyWQ87CO
         +zp1m1ODgGRM3Tqguw8aiCiDfXt+A1HJE24aeHzTjivbHwFCdynTB/bnTaeEYw+YO4uD
         HxLlvd78zaKUPqcYy9FEgXBRya65bEoxK2zev4w0x7EDI8M8XZnGqwPLigopDlL3c3tv
         nkBdi6Hi3Wke7+hjiLWVURv6HV+m1rSlSaW9ZsL6oGUfXQXHdiuGCO1Ms2lyPDjE/MdX
         EC2A==
X-Forwarded-Encrypted: i=1; AKwUvByIujzfnuc/Clfhd3/31u0mBNJ8C23WJ8sb9ft/dhtRvpHKX6bPzKjpGj+vNbAkZcDFN3hOVTJy6b8bN/awiilDNeipAQ==@lists.linux.dev
X-Gm-Message-State: AFuF++l2KggouQEF8MMlgbWLwsbACcPj+xOVw8cAIkgmAdQGSQl3U7F8
	m4Ey91kmxRaNoGGDIH0IiQ0GTd2vUULAaUoCSt9yZfVfjCOyboWR7iH97DqgTDpr
X-Gm-Gg: AYBFou0OXGldxlJNE7YqJSokvQdl8UCGtfS+zCZEnQSiTxB8btCbRzGJhZQEPlla2o3
	qKcZN3lbofzBcAcOmIfS2ZdR5SW/XUioA9w6puF3wioiRDz5Wg8GRVinB2LljvQfFNvPvDiff/Z
	jxCAj8YyPuJnI4P7leSvIwydW21xR0deZ34ADwlAfwnPb3EyXeefXn4PCYFhzIgBECpjshsRj53
	g1kg1cBEWAV+NntFkh6skjg5WIgPoYObOWGVfFzN28AQQq4nxpgWjmRUOEIhJEuYYHzKrAa6/P9
	6hGCq8Ak8hpy++caJ3RUAkSsVni1LHuTyyx19zIPS/Nx8pwxubZA6joP8/dgbntWVG5gHbEwvVG
	OMsFeluvDt0m2X80c7E2uj+0VuLoG2047K17ANzcV6x8HpCg/FkQEF9BxQ/JaTDSy3ZSYSS/gEc
	jaTKSMT6ffRIrlNhaM1oKKYxOwoaWTZFfLej/d5KZrssJaxQVDdTLwtrivpznQ1dP4DsE41owKK
	DqqcD7Wu4izSA4wKBO1EP142g==
X-Received: by 2002:a05:6102:38c7:b0:777:4e99:6f84 with SMTP id ada2fe7eead31-78a4a727bccmr7192059137.1.1788783589387;
        Mon, 07 Sep 2026 05:19:49 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47b56bd3sm6507397137.12.2026.09.07.05.19.47
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:19:47 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-74ab6c88052so984539137.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 07 Sep 2026 05:19:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwjiayZN5qGA7/gfvF56aZTuOMdHGnKez57TiQ6m1k02KRwdMk+sSuV7yw7tXXw14g0Ew+vwgAGooMw2OKMNqPJExUYlQ==@lists.linux.dev
X-Received: by 2002:a05:6102:e0c:b0:778:721:53db with SMTP id
 ada2fe7eead31-78a4a4ca11amr6528611137.0.1788783587284; Mon, 07 Sep 2026
 05:19:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260816153809.7067-1-jakovnovak30@gmail.com> <aoLCr8JEYaYxcJcQ@hovoldconsulting.com>
 <61c4cee5-3c63-4b09-abbf-bf945b538403@I-love.SAKURA.ne.jp> <DL91IWM6YXRN.3892K60CVKZ3U@gmail.com>
In-Reply-To: <DL91IWM6YXRN.3892K60CVKZ3U@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Sep 2026 14:19:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW99QjUrat+K_Ot025Zddb5p-rBhpPxP8EAE6FmfvEnWQ@mail.gmail.com>
X-Gm-Features: AcwNN1X_Y6VTAkiTUVaCeny5TBDUQ3QnkakivGhNq66Ha3LNCkcjAS164CJi4jY
Message-ID: <CAMuHMdW99QjUrat+K_Ot025Zddb5p-rBhpPxP8EAE6FmfvEnWQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: vub300: fix sleeping function call from invalid
 context in vub300_inactivity_timer_expired
To: Jakov Novak <jakovnovak30@gmail.com>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Johan Hovold <johan@kernel.org>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, Ulf Hansson <ulfh@kernel.org>, 
	Guangshuo Li <lgs201920130244@gmail.com>, Runyu Xiao <runyu.xiao@seu.edu.cn>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	syzbot+1ee4f3b9228e35f14677@syzkaller.appspotmail.com, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"

Hi Jakov,

On Mon, 7 Sept 2026 at 13:18, Jakov Novak <jakovnovak30@gmail.com> wrote:
> > syzbot has an AI-generated patch at
> > https://lkml.kernel.org/r/49982079-95f4-4e8c-bbbc-bcb127e2f378@mail.kernel.org .
> >
> > Please check.
> I checked the AI-generated patch and it just uses the deadworkqueue in a
> new function. That is the same thing I am doing except that I'm using
> the vub300_queue_dead_work function instead of writing some new code
> that does the same thing.
>
> The real question is whether mmc_free_host should be allowed to invoke
> the sleep function or not. Geert needs to elaborate on that since he
> added this change in 1036f69e2513 ("mmc: core: Cancel
> delayed work before releasing host").

Why would this not be allowed?
This is just in the driver remove or probe error path.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
