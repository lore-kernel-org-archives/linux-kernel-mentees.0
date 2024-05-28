Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBA416F291
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 May 2024 18:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716922606; cv=none; b=RWC173s0pvly2pPuft3cUg5dr/0aVG70qMxXQvEtsx9g+LlaEPG2PXwK+Ss8VAa9WDhLx5CpDP+qG3iy/MMupPoicgUCaSw4G6tssIZrNxu/XHISpQEIL5bZQFRWleDjCutyfY9ux/de124dtgoCqIMBJ096Ih5SE3xjRTKGD5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716922606; c=relaxed/simple;
	bh=1GkxxU7eiisDXTv7dlI9z9uvQ2yOMGG0iM5hZFEjUKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BdBBLww4DUHXtajWF+XOnowE62C3aogZxLfQuKsrajylUBfLoJ7BxQd13uUrSdyXkqJAcgMEeePErYY5GqFGqgcMyse8/MbRuGhv3Yd6QtWhSMKCQc9TglMK0PPjKqc4NrS+AAR45Ja8l7Gved74EJd/EUkUOce1UNxtvmJWbEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 776C8820E4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 May 2024 18:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.401
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cVvfYIyEwA21 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 May 2024 18:56:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.215.175; helo=mail-pg1-f175.google.com; envelope-from=namhyung@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C038A820E2
Authentication-Results: smtp1.osuosl.org; dmarc=fail (p=none dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C038A820E2
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C038A820E2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 May 2024 18:56:44 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-656d8b346d2so841032a12.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 May 2024 11:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716922604; x=1717527404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tV2y+zzHtC8fi/GAxZbta7nCZzttI/+j3Qu6+XzqVmY=;
        b=mvmy8KuTuIztI/sLe3p3cTH57vh24mkYIKZwjLVew7Z4AVEatA8AAafi8tt2XE4/5B
         bk2FPR4mFqAhviF4wwMVtfIyevES3eKiQofgTykEHJtJtcyofnBhfNsOjTRF5qGNfapV
         6xOkVzYjxK/lv5QeBKLLtcINO2Nkm4WI7lm+XfDaG3YbC8TQ2bc1MYbx08Dij480ZeHb
         UMfk+TMuRLaLM4VE/lAVVCI+GW764dBpUhYpnyVYxpQhayMCcgelFBMHzjj+BbNPAhx/
         RmSb635CwJRjnbuWcwj15ugr3BusuQFtalIpYlwPMVg2bmUOu9onlpheUoqdDgcmqUWX
         sqXg==
X-Forwarded-Encrypted: i=1; AJvYcCXdg+z2vemLPQ03NetimjjTBB4M5G5cX06TAriwRY1kNo/Bei0Y7BrcZ033Q62mErlfUYPlA2Ug6/fSzuA8xbpbN8H6E9CbFCkfc4Y9w5uN4XEs19gXaHtqOVZ8PwYH
X-Gm-Message-State: AOJu0Yw6yqtCP/FxXm7O5RrGBV5iNHDUnHc8ljMob0DemAyc+ZfdizgD
	Vh7WwOi2L/m/6co2L97M00rmfuB6wylBba/U3UuGL5XBZV63/el1t2dtlQZ+1//34ygThzMavNB
	NCpFx0jBMPGjtYYuXwvLou90JrZw=
X-Google-Smtp-Source: AGHT+IE8tv8M6ZLQILAkH0C67BI/2TkBWI9laCMPaHlE1MnRq9lKpGEUlZAVuwUkhx6Wgc/7o+9AwiyHmCrCamGILZQ=
X-Received: by 2002:a17:90b:30d6:b0:2c0:bc7:63c3 with SMTP id
 98e67ed59e1d1-2c00bc76514mr2606961a91.42.1716922603850; Tue, 28 May 2024
 11:56:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240527090300.17864-1-yskelg@gmail.com>
In-Reply-To: <20240527090300.17864-1-yskelg@gmail.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Tue, 28 May 2024 11:56:32 -0700
Message-ID: <CAM9d7cjhwO99e0GLKf54V+1g7cdppL3hwjpgB3cdid7YzytkMA@mail.gmail.com>
Subject: Re: [PATCH] perf stat: allocation check when calculating cache
 instance ID
To: yskelg@gmail.com
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	"Liang, Kan" <kan.liang@linux.intel.com>, Gautham Shenoy <gautham.shenoy@amd.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, skhan@linuxfoundation.org, 
	Austin Kim <austindh.kim@gmail.com>, shjy180909@gmail.com, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Yunseong,

On Mon, May 27, 2024 at 2:06=E2=80=AFAM <yskelg@gmail.com> wrote:
>
> From: Yunseong Kim <yskelg@gmail.com>
>
> Adds an allocation check for cpu_map before perf_cpu_map__min() accessing

I think perf_cpu_map__min() works well with NULL.

Thanks,
Namhyung

>
> Signed-off-by: Yunseong Kim <yskelg@gmail.com>
> ---
>  tools/perf/builtin-stat.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/tools/perf/builtin-stat.c b/tools/perf/builtin-stat.c
> index 35f79b48e8dc..1f238824abb2 100644
> --- a/tools/perf/builtin-stat.c
> +++ b/tools/perf/builtin-stat.c
> @@ -1291,20 +1291,22 @@ static struct option stat_options[] =3D {
>   */
>  static int cpu__get_cache_id_from_map(struct perf_cpu cpu, char *map)
>  {
> -       int id;
> +       int id =3D cpu.cpu;
>         struct perf_cpu_map *cpu_map =3D perf_cpu_map__new(map);
>
> -       /*
> -        * If the map contains no CPU, consider the current CPU to
> -        * be the first online CPU in the cache domain else use the
> -        * first online CPU of the cache domain as the ID.
> -        */
> -       id =3D perf_cpu_map__min(cpu_map).cpu;
> -       if (id =3D=3D -1)
> -               id =3D cpu.cpu;
> +       if (cpu_map) {
> +               /*
> +                * If the map contains no CPU, consider the current CPU t=
o
> +                * be the first online CPU in the cache domain else use t=
he
> +                * first online CPU of the cache domain as the ID.
> +                */
> +               id =3D perf_cpu_map__min(cpu_map).cpu;
> +               if (id =3D=3D -1)
> +                       id =3D cpu.cpu;
>
> -       /* Free the perf_cpu_map used to find the cache ID */
> -       perf_cpu_map__put(cpu_map);
> +               /* Free the perf_cpu_map used to find the cache ID */
> +               perf_cpu_map__put(cpu_map);
> +       }
>
>         return id;
>  }
> --
> 2.34.1
>
