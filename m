Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9101183989
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 May 2024 11:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717069422; cv=none; b=HJgqJjJZ+3+QbGGIv3cpE9ufIXcihKqR/MR7VdYqhOmhKvc+x1YKemRkr/qyEXghUJOmRlsGTXrpZEL69QMPgeV3Z886mDly/dDGqAXyVhr8i1UM21CdFdJnzmrczSqIFHg2kqsSN9wj03FYeksp+YNc5B5VeppFvLJpmD1p4y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717069422; c=relaxed/simple;
	bh=xyRAuFLJMYV4lSiV7364TDKTJTDHcBSIxtrsUYekpP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qwIw4v5nuHYkv3iSHdBn2jfPOJ6AXJOBQJqPcNyHwcKhtltyTH8PceTrF5si8/3TNdMiKRzwZuc7g7tuLBBtjulWEMWHMlvoniVZUQigU+WQkor/+SaymNWcaYyf3A4kgc2vx0isGcuiVHREEwOLUTcy8A1gHQarFMZ0K0+8sI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTZFb//W; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTZFb//W"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72ECB60605
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 May 2024 11:43:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LNTVqfsaZWii for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 May 2024 11:43:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::c2e; helo=mail-oo1-xc2e.google.com; envelope-from=yskelg@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AFE08605EF
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFE08605EF
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HTZFb//W
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
	by smtp3.osuosl.org (Postfix) with ESMTPS id AFE08605EF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 May 2024 11:43:40 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-5b970e90ab8so427598eaf.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 May 2024 04:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717069419; x=1717674219; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XR6MPgWfqApseUbYRUcsMgK3z0xu+JQbLHd6cyyF66w=;
        b=HTZFb//Wz1KReUC9u3dD5aOc/oX5w6nnGizLMMu/a1b/r1IznSeyxie4uZqGzmqpo6
         Bv8bt8QqprW876KztwanGAOqJFJSAK45wgONjKf/3RRI/1QAMhqEk/khMSvvuphJNXwV
         FgSvXuYbQ6uabPiA2kuI/xeEb24KMLW9B8GSa1jH3Ltz6LbW+9I+UgHP2y+6EAa43gP7
         hR9rPJcrcvLE9FjPD03R5fJlfvmn6wklk7PniJJsl6j8cVijc9q7QJIkY1hVBFxPH6Ou
         C4oP+273DskBcP0wuRtXrfGdTweOtbXMEvSNjzoOTdLKmj0HlmiWca8/l+DT2LS3pl2+
         aBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717069419; x=1717674219;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XR6MPgWfqApseUbYRUcsMgK3z0xu+JQbLHd6cyyF66w=;
        b=Lr54611xM6NFEp2HfRL+qMTwfopfpg3RF2fkCAuTmh2y1k1uCkWlQ7PNLB/P7MMPd6
         dM1FgEMQYU4Q+2LP0p5mN5iB3el9z+oyDXTeH7YFB56I1nuLHm0n1VdXR/gHHrAfjUZZ
         0FzIgl8fV0M/zayEU10zgNdcQ+vgvwq0mJvY4LgU2MXmYHRD2v8rayw8SxLi1y8mlK5v
         jSwV50ZEiVK9Ok6KBqsVx3IMj1yXVPJh2ytCYFtLpjRUTSWpkRejHyYL0N1TxATxKzoB
         fni907Z1jwSNPM8vmeElPrx1XgStNje/Y/vd7wlVLhxOxuqdJPXtQBkhfCGk6hhpgpm6
         u7Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVd0GPBa3bR1x/o9+0HxoLgakiROaTD/FEan4qBUkzfqsY2+9EkN4O9yyMAAol4hhwY+eSe48Pic2+iGajFTLA5S15Tg5tlnmXH/bn8LzxNNZWdcq00TFgGw2aBwVjs
X-Gm-Message-State: AOJu0YziffmCzE0Cxoe02hweqOMbcKudwhXo/BV13YMJG2gSHuiQOrbw
	FdON/kV38zxLfKkL3bhiTBaWoQ8BvvzuT3F1CfCGXCYjBl0tnf6S
X-Google-Smtp-Source: AGHT+IF0XWfa5jz7pE/dROU1THvnaVC3uyDp9wVakipTtEPtQp0+PpqFCbrbpSWZ2EVeOqBDiXCnbA==
X-Received: by 2002:a05:6358:787:b0:18f:81e1:dc33 with SMTP id e5c5f4694b2df-199b93900e5mr262855255d.2.1717069419194;
        Thu, 30 May 2024 04:43:39 -0700 (PDT)
Received: from [192.168.50.95] ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-682227f1d6esm9120839a12.49.2024.05.30.04.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 04:43:38 -0700 (PDT)
Message-ID: <53c7cbf0-ebf9-455b-bcec-d61830c7999b@gmail.com>
Date: Thu, 30 May 2024 20:43:32 +0900
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf stat: allocation check when calculating cache
 instance ID
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>,
 Gautham Shenoy <gautham.shenoy@amd.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, skhan@linuxfoundation.org,
 Austin Kim <austindh.kim@gmail.com>, shjy180909@gmail.com,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20240527090300.17864-1-yskelg@gmail.com>
 <CAM9d7cjhwO99e0GLKf54V+1g7cdppL3hwjpgB3cdid7YzytkMA@mail.gmail.com>
Content-Language: en-US
From: Yunseong Kim <yskelg@gmail.com>
In-Reply-To: <CAM9d7cjhwO99e0GLKf54V+1g7cdppL3hwjpgB3cdid7YzytkMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/29/24 3:56 오전, Namhyung Kim wrote:
> Hello Yunseong,
> 
> On Mon, May 27, 2024 at 2:06 AM <yskelg@gmail.com> wrote:
>>
>> From: Yunseong Kim <yskelg@gmail.com>
>>
>> Adds an allocation check for cpu_map before perf_cpu_map__min() accessing
> 
> I think perf_cpu_map__min() works well with NULL.
> 
> Thanks,
> Namhyung

Thank you for your code review Namhyung.

I'll try to find a more useful improvement and patch it next time!

Warm Regards,
Yunseong Kim

>>
>> Signed-off-by: Yunseong Kim <yskelg@gmail.com>
>> ---
>>  tools/perf/builtin-stat.c | 24 +++++++++++++-----------
>>  1 file changed, 13 insertions(+), 11 deletions(-)
>>
>> diff --git a/tools/perf/builtin-stat.c b/tools/perf/builtin-stat.c
>> index 35f79b48e8dc..1f238824abb2 100644
>> --- a/tools/perf/builtin-stat.c
>> +++ b/tools/perf/builtin-stat.c
>> @@ -1291,20 +1291,22 @@ static struct option stat_options[] = {
>>   */
>>  static int cpu__get_cache_id_from_map(struct perf_cpu cpu, char *map)
>>  {
>> -       int id;
>> +       int id = cpu.cpu;
>>         struct perf_cpu_map *cpu_map = perf_cpu_map__new(map);
>>
>> -       /*
>> -        * If the map contains no CPU, consider the current CPU to
>> -        * be the first online CPU in the cache domain else use the
>> -        * first online CPU of the cache domain as the ID.
>> -        */
>> -       id = perf_cpu_map__min(cpu_map).cpu;
>> -       if (id == -1)
>> -               id = cpu.cpu;
>> +       if (cpu_map) {
>> +               /*
>> +                * If the map contains no CPU, consider the current CPU to
>> +                * be the first online CPU in the cache domain else use the
>> +                * first online CPU of the cache domain as the ID.
>> +                */
>> +               id = perf_cpu_map__min(cpu_map).cpu;
>> +               if (id == -1)
>> +                       id = cpu.cpu;
>>
>> -       /* Free the perf_cpu_map used to find the cache ID */
>> -       perf_cpu_map__put(cpu_map);
>> +               /* Free the perf_cpu_map used to find the cache ID */
>> +               perf_cpu_map__put(cpu_map);
>> +       }
>>
>>         return id;
>>  }
>> --
>> 2.34.1
>>
