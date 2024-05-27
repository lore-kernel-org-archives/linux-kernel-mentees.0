Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A384FC02
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 06:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716790348; cv=none; b=syYaTSuBavbs6YpYs0Y0uKcZhbLoXiU3H/CRElGvVcIlf5vUndrUGLZhQriqtGmSqtNz2+0nBdxmsC6NyR2oO/hCQy+kdV+0UOQsBfj5MnqdV+MhQV6CtB7u2gVoNAm7U5MHguJa0/FTWIH1ESR/HOo5UAmT0BwRLqsKi7BsNjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716790348; c=relaxed/simple;
	bh=yf/cQNmggHigjsGThUoVM19am4FVLnwqeQyvC3Ti0zQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cb8it4pllE+n9y8QCTgDyhvC+mSer7tKaY5SA8FLwkvk0b925QgQ437sAcck7CvkuCh+wHempCv9okC/KaA1qKSS2UaSbe5Wcbs8nrWv1rZLLKkaacY9hoprAjyqm2IxegrWLzO6+XedLcwTovVdpvVp25ItvzR/0j9U+SspF8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4uBwPIn; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4uBwPIn"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9254F4010D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 06:12:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QSeRebFyCbUH for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 May 2024 06:12:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=yskelg@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B140540108
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B140540108
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=E4uBwPIn
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B140540108
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 06:12:25 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6f850ff30c0so3097731b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 May 2024 23:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716790345; x=1717395145; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ha3ttuHDRqNnlP/Z8/eQDNBiXRUGr96YwwyOzK4k54=;
        b=E4uBwPInJV6AA2YjCFskXlIfOAfRAlMZYae3t7MEmD7U5R0+/7NFvRdWwuUSIZnZ+J
         PnQoUCV3R2XbBIL7OwK+U4BJtEA7z2Iq4B+LbIf39xGlfpjMa7OihbVTrXCxykYZ9CwU
         QGoWHdsrbd9ZrhVUewCym5FSjc8FPjTTn2J976CYBWE987acl4BSXD4wQ23xQw1a5nEM
         TGxDtlboIcVsB2vBY1QC0cDMjVLK3BJY5/1wS7oQ4f9G2U296XoLP0VDlqYp5fsvrdH2
         VowdMFT0O3YgZk1AcZJcwZ2TWbeRQLtynieaqNc/ydTPG82jb4z+g5jLGUBzkh8qjZR3
         ueog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716790345; x=1717395145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ha3ttuHDRqNnlP/Z8/eQDNBiXRUGr96YwwyOzK4k54=;
        b=uIlIxxV9gUsuH77C6kPvuLhr4mS/cbnYToI/AWTn3xtQCetiBO7ELIrWfBjUjFPH01
         qTZKwoxtFJVlHCUjvbTs2nmgFqevAO7H7gfl9LIElzPAPbcT1tajWElsQVqxNS7GpjNJ
         Kyhj0zs4gV+gXD+tIE0W5LdO6rnrOiNx94CqrlfeVeKhZ9eMhi3lGvj9Tq4+YAlsdNBY
         YnlRLXusBQxRhe2s6h9I22Q9lza2HZq+Qn8Nmsj3Aq+3T222Ia7oEImKPa6sweoL7U06
         jR3qbOpeU6Cf+LLxYA7dG3T7XIDpW0ZB91rkYQMeL1vAkuN8Jt3uPtznCxvzyFv9bCDo
         nZNg==
X-Forwarded-Encrypted: i=1; AJvYcCV1JSDB1e/MPhXf/BJ16ezn/mcbxtSOeNVsPbSRV8rOlgOyhPwnEN+hFg8LVMc/qna0NdgYs/VRDbyAUYz4XJk4puMA8ahdOdYk9nnk0zLkz7O1abrGDt5YIdGpPfyf
X-Gm-Message-State: AOJu0YxYlC9J10lZwoZEAZ/Dnutr0StFoex9jA9cSS7uFIjFfOWq0QCV
	uvFJXor4aT1jvkF0EwKPJUt1/LoGNQpp4RxiipVlzq926yd3Lvik
X-Google-Smtp-Source: AGHT+IE8ffxUSRQG9zQZUih6diPm/Qro2Bk9ChCA5Jktl2/w4H3kfZt/0Cw4NAQIsnO/D0x756u9WQ==
X-Received: by 2002:a05:6a20:72a8:b0:1b1:c745:5c66 with SMTP id adf61e73a8af0-1b212e64d95mr10891105637.54.1716790344649;
        Sun, 26 May 2024 23:12:24 -0700 (PDT)
Received: from [192.168.50.95] ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bdd9f50eddsm6900791a91.42.2024.05.26.23.12.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 May 2024 23:12:24 -0700 (PDT)
Message-ID: <bb87c165-679b-413c-a62c-93b4772e3107@gmail.com>
Date: Mon, 27 May 2024 15:12:18 +0900
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] buitin-kvm: Update cmd_kvm() to check perf_host value
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, skhan@linuxfoundation.org,
 Austin Kim <austindh.kim@gmail.com>, shjy180909@gmail.com,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20240515195252.75909-1-yskelg@gmail.com>
 <CAM9d7ciFpGhQat3esWLBUDNc1pzAqVw+8d+oX-WJeN+KJfW8Ew@mail.gmail.com>
Content-Language: en-US
From: Yunseong Kim <yskelg@gmail.com>
In-Reply-To: <CAM9d7ciFpGhQat3esWLBUDNc1pzAqVw+8d+oX-WJeN+KJfW8Ew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/23/24 1:23 오후, Namhyung Kim wrote:
> Hello,
> 
> On Wed, May 15, 2024 at 12:54 PM <yskelg@gmail.com> wrote:
>>
>> From: Yunseong Kim <yskelg@gmail.com>
>>
>> According to perf-kvm.txt, the default operation is --guest, meaning
>> perf_host should be set to false and perf_guest to true. Currently,
>> the incorrect usage of --no-host and --no-guest still results in
>> the default --guest operation.
> 
> Hmm, right.. This is not good.
> 
>>
>> This patch updates the usage messages to include the --no-guest option
>> for those who only want host data, as well as the --no-host and
>> --no-guest case.
> 
> I'm not sure if it's worth mentioning the host-only use case which is
> not expected for this command.  I think it's enough to warn the
> no-host and no-guest use cases.

Thank you Namhyung for the code review!

I wasn't sure if it was necessary to mention that either.

I should have asked in the patch mail first.

>> Signed-off-by: Yunseong Kim <yskelg@gmail.com>
>> ---
>>  tools/perf/builtin-kvm.c | 19 +++++++++++++------
>>  1 file changed, 13 insertions(+), 6 deletions(-)
>>
>> diff --git a/tools/perf/builtin-kvm.c b/tools/perf/builtin-kvm.c
>> index 71165036e4ca..654a07658cdd 100644
>> --- a/tools/perf/builtin-kvm.c
>> +++ b/tools/perf/builtin-kvm.c
>> @@ -2129,7 +2129,7 @@ int cmd_kvm(int argc, const char **argv)
>>                 OPT_BOOLEAN(0, "guest", &perf_guest,
>>                             "Collect guest os data"),
>>                 OPT_BOOLEAN(0, "host", &perf_host,
>> -                           "Collect host os data"),
>> +                          "Collect host os data. Host only with --host --no-guest"),
>>                 OPT_STRING(0, "guestmount", &symbol_conf.guestmount, "directory",
>>                            "guest mount directory under which every guest os"
>>                            " instance has a subdir"),
>> @@ -2150,16 +2150,23 @@ int cmd_kvm(int argc, const char **argv)
>>                                                 "buildid-list", "stat", NULL };
>>         const char *kvm_usage[] = { NULL, NULL };
>>
>> -       perf_host  = 0;
>> -       perf_guest = 1;
>> +       /*
>> +        * tools/perf/Documentation/perf-kvm.txt
>> +        *
>> +        *    Default('')         ->  perf.data.guest
>> +        *    --host              ->  perf.data.kvm
>> +        *    --guest             ->  perf.data.guest
>> +        *    --host --guest      ->  perf.data.kvm
>> +        *    --host --no-guest   ->  perf.data.host
>> +        */
>> +       perf_host = false;
>> +       perf_guest = true;
> 
> Probably not needed.

I agree.

>>
>>         argc = parse_options_subcommand(argc, argv, kvm_options, kvm_subcommands, kvm_usage,
>>                                         PARSE_OPT_STOP_AT_NON_OPTION);
>> -       if (!argc)
>> +       if (!argc || (!perf_host && !perf_guest))
>>                 usage_with_options(kvm_usage, kvm_options);
>>
>> -       if (!perf_host)
>> -               perf_guest = 1;
> 
> Instead of showing the whole usage, I think it's better to
> print a specific message for this case.
> 
> Oh, I've realized that we have 'h' modifier for hypervisors
> (on ARM64?)  Then maybe no-host + no-guest is a valid
> combination.  Probably we need to add --hypervisor option
> then.
> 
> Thanks,
> Namhyung

Yes, I have a native Arm64 devlopment environment.

So I'll implement and test it and send the patch.


Thank you so much for the detailed review!


Warm Regards,

Yunseong Kim

>>
>>         if (!file_name) {
>>                 file_name = get_filename_for_perf_kvm();
>> --
>> 2.34.1
>>
