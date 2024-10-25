Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15111D222F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 25 Oct 2024 22:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729895497; cv=none; b=mSOsbT+nP1x9clBSY2phFj7sAT0XsRM1LAu+WjZYkkGLe9JPrdrm72FMx71Q5CsUI/qMMssK4GjHXv0hVcP6IEi+hoO2dp6ba1eY2fbHliMMavSa20BvOVNUiYbEdC/BcbE0CqpUZ7zvPAFqfEAkQ3Xg1EjvLMfGR/TCgTqX5iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729895497; c=relaxed/simple;
	bh=peaXwBeqvzMzdpHMpSvYdZXIArGq+jxUk3/8YEbSynA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C/I6Fwejd5bX6KWDgegP6cqHVzl3G3nUP2xkmWCna0kkrwom1l28AaWm7KcJkUM3NbD1vs5XXy+F1KrY7KrpV19h8g59y/3z/3VsIxC8XmB3ey2oTT9yRawFbLEobzMva8/94G+Ex8kJpQXYShY4IchAPWZRjm5odGPYA4df+to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iw7ko0uF; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iw7ko0uF"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51E7340F3C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 25 Oct 2024 22:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9OAz68o5rcKI for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Oct 2024 22:31:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9F9AC40226
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=chromium.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F9AC40226
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iw7ko0uF
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9F9AC40226
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 25 Oct 2024 22:31:33 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-539eb97f26aso2702336e87.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 25 Oct 2024 15:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729895490; x=1730500290; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugvXr99oNQyERXTPqzKhuTsXIZd9WkdB8xJoxbh67vA=;
        b=iw7ko0uFcGa+qiXsV+20yLmVZCkW3H/1JXoRxMdQ88rvnsrgoMNyO+SeaStyjz/clJ
         YsO6Q3OWZMUF5VPPZNLxjwAdbhj7Ov4f9NT74Bgrl4hw+D/Xdw5NSjdpYt4QFSi+YJAa
         zH59HlEfYBRDXeh1j6cwLeFL2SBIDlQBgGbXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729895490; x=1730500290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugvXr99oNQyERXTPqzKhuTsXIZd9WkdB8xJoxbh67vA=;
        b=sNBQjLd/D8x75/tp6jIwa56j9IThPAHPa3aKYWRXABNKO7YeF28kmRpx7GMdb3gXEf
         Zrf9Lcw0PRya3FoetiCTZxW1hoOBVtlpbh4DJ+NpqzCHyrHmX6t6NiEsIg9IyagWgmtQ
         BeN8ntJz9s8HoomfH89Go/Fb2DeSl8eUzzonjjZQm4vg+Cs6AKuMyfe3KGBTPF8RYq4r
         Yj6aDhCjCdGqs9SMsHNhWr+pC/PIk11W3HP0GG/SiqiSCIqBXHwmYWZoZCfEqefEWr/S
         IbszySCRwJ8n5yFVqhB46fSBgtlI79lx7PykqiE6Dzp9Ju4PiGxebvJ5i2b8YoE2B7ns
         Mc9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWuXYctLT2+sy+7mpGyTkjaWECT6GvODUM/pGT67ntVLP4qohjYZ1Xw9m0Rv5pbaNP7PZKiY44X/0Git8tRpplY45TzwQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yzen4e0ConX+n2R9glAlp8txoP14yTLwHITDoHOiGCl1t+8MzxC
	hjWP6doB6RQaxG0r0np5i842J9hvpANRENKBytxiPACwQtC39eKGg2nxzrFJUzDgMFinOKwkflW
	Haw==
X-Google-Smtp-Source: AGHT+IHKgGm5Gq2NtsJMHMg7BsWWdGeUp08d0EawLI/WbHx2VTZ2oIdADOMs4/MBmb3D10RJz0XAXQ==
X-Received: by 2002:a05:6512:32c9:b0:531:4c6d:b8ef with SMTP id 2adb3069b0e04-53b348b96ccmr442087e87.6.1729895489601;
        Fri, 25 Oct 2024 15:31:29 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c8fc5sm325198e87.202.2024.10.25.15.31.28
        for <linux-kernel-mentees@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 15:31:29 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb561f273eso24900401fa.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 25 Oct 2024 15:31:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNnJ8CFUOHDlY7i+Jc3rNJqwTfYq9jmHmxPKfJY4GAOP/ib1uXaTnNglbbAQdefA/KOGsXCAq1PYxBd0EQe3LyEWdYJQ==@lists.linuxfoundation.org
X-Received: by 2002:a2e:be20:0:b0:2fb:5a19:5b9b with SMTP id
 38308e7fff4ca-2fcbdf5dademr3775951fa.8.1729895487832; Fri, 25 Oct 2024
 15:31:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241021211221.GA835676@lichtman.org>
In-Reply-To: <20241021211221.GA835676@lichtman.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 25 Oct 2024 15:31:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X-BYpZb60Ap1xHXdoDtf=2UhTD=MQc8Lw=WkRmY=+wWQ@mail.gmail.com>
Message-ID: <CAD=FV=X-BYpZb60Ap1xHXdoDtf=2UhTD=MQc8Lw=WkRmY=+wWQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Replace the use of simple_strtol/ul functions with kstrto
To: Nir Lichtman <nir@lichtman.org>
Cc: kgdb-bugreport@lists.sourceforge.net, linux-trace-kernel@vger.kernel.org, 
	yuran.pereira@hotmail.com, jason.wessel@windriver.com, 
	daniel.thompson@linaro.org, rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 21, 2024 at 2:12=E2=80=AFPM Nir Lichtman <nir@lichtman.org> wro=
te:
>
> The simple_str* family of functions perform no error checking in
> scenarios where the input value overflows the intended output variable.
> This results in these function successfully returning even when the
> output does not match the input string.
>
> Or as it was mentioned [1], "...simple_strtol(), simple_strtoll(),
> simple_strtoul(), and simple_strtoull() functions explicitly ignore
> overflows, which may lead to unexpected results in callers."
> Hence, the use of those functions is discouraged.
>
> This patch series replaces uses of the simple_strto* series of function
> with the safer  kstrto* alternatives.
>
>
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple=
-strtol-simple-strtoll-simple-strtoul-simple-strtoull
>
> Yuran Pereira (2):
>   kdb: Replace the use of simple_strto with safer kstrto in kdb_main
>   trace: kdb: Replace simple_strtoul with kstrtoul in kdb_ftdump
>
> v2: Nir Lichtman (2): Removed confusing support for hex number inputs wit=
h no preceding "0x", and other CR fixes
>
>  kernel/debug/kdb/kdb_main.c | 69 +++++++++--------------------------
>  kernel/trace/trace_kdb.c    | 15 +++-----                             2 =
files changed, 23 insertions(+), 61 deletions(-)

FWIW, something about the way you're sending your patches is broken.
Both patch #1 and patch #2 are supposed to be "In-Reply-To" the cover
letter. You should use a tool like "b4" or "patman" to help you post
patches.

With what you have if I try to apply your series by pointing at the
cover letter:

--

$ b4 am 20241021211221.GA835676@lichtman.org
Analyzing 1 messages in the thread
No patches found.

--

...and if I try with patch #1:

--

$ b4 am 20241021211451.GB835676@lichtman.org
Grabbing thread from
lore.kernel.org/all/20241021211451.GB835676@lichtman.org/t.mbox.gz
Analyzing 1 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Checking attestation on all messages, may take a moment...
---
  =E2=9C=93 [PATCH v2 1/2] kdb: Replace the use of simple_strto with safer
kstrto in kdb_main
    =E2=9C=93 Signed: DKIM/lichtman.org
  ERROR: missing [2/2]!
---
Total patches: 1
---
WARNING: Thread incomplete!
 Link: https://lore.kernel.org/r/20241021211451.GB835676@lichtman.org
 Base: applies clean to current tree
       git checkout -b v2_20241021_nir_lichtman_org HEAD
       git am ./v2_20241021_nir_kdb_replace_the_use_of_simple_strto_with_sa=
fer_kstrto_in_kdb_main.mbx

--

If they were properly posted b4 would be able to find all of them.

-Doug
