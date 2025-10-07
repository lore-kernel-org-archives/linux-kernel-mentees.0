Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B4E221F1F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 21:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759871882; cv=none; b=g/ziNaVN4mqKH5zIkTAukc+1LBT2QgSlh5Ycy6ZkiZKAww+I+ld9PWDtdIHIAq6yvmBqxLFKnsN23QZ79HU3kbwS4/N0WLaVB4LnP4zSX4s4ulTz284GlxvOReozBhuRSnq+ke9vWpMr+mkSE8sLbBzGra2cxnSPiZ1tMOIhCmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759871882; c=relaxed/simple;
	bh=m34tLBwz1PIe/S0WfQ2UYFZwrQXwN9LclHWU15mdFJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hDf2nmEG/7ITib+DOwVbz+WbL0QHnVJG+VOaY/qnwpi5S+tXUWbEpg1P07YSZwP4m/GvuKfxu7hF0glM3xh7dkTRYYpisP9qFRhpusoL1j6VU1davsTo9bGgpDlYfy+WToSpFhmPxfSdHtWehqGlu/xHBZYTEYnyIMH/jAWahqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UjEZFIMb; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UjEZFIMb"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AE2340662
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 21:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id laRJZteVi44S for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Oct 2025 21:18:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com; envelope-from=skhan@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4CEE64015C
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CEE64015C
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=UjEZFIMb
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4CEE64015C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 21:18:00 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-92aee734485so293291039f.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 07 Oct 2025 14:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1759871879; x=1760476679; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4L3v1zXzH1XthRJD+O7BTVEnTPegVXFNbA8wvQbrEuo=;
        b=UjEZFIMbBVzn9DlnK1y5klyzW9YsLrzbqDjLzH+QKjQ+A9j9NZ4AmMQT+J44UXJXc0
         eqR8ujBMuE9wIoQ97wiMlmy/s5SCaJA2kP146eiO1ZOCgVTrdXu9/wvoDwydkVZvsFV1
         +KLheOiT5p/kRpkpu8gtCtGs6rt/ycxhbmTTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759871879; x=1760476679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4L3v1zXzH1XthRJD+O7BTVEnTPegVXFNbA8wvQbrEuo=;
        b=BUsQcTB6cVHu0BM4kkVUfsxLi5z2LUxp+vBR6MpUXMbjOh9vHYja6ve8ShFZUy96Dv
         BZZwIu+VbXjR8ATz2BQkUEhu9Hx+CVmkd2k7eHJ4NALzogghaVrZ+23y5rieJXwGLAmF
         KskzXHbvXwsZdEnz+BZwlXhbDUq1y2kOGYbjcwqWH76vRH9uC5umueGn5+b8BH0tAQAs
         dpzdrRAYwQsn8a/o2z5/3OX7Qcuol+31kzuIoic+gdJQpnqbc3VPwrw6a9d3Yiusqd6v
         r4oQ8yDKlc3DExBikrvXngSJFBu9wPA6H/SeSa73KmpYICIVU3b4qg1K6449mE68DfPg
         qz3g==
X-Forwarded-Encrypted: i=1; AJvYcCWe3TP29Es4Ly6yGqyofdNDL2YIgqOUBMleJBgcY1A4BBsABtrfvoBz9xbHjY75VqKfQIlvpIH8WfFkKPrFpBSK8FTXwA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzzhkAujMAuRe7STYB5DoxcT9bhJZLLJmqMFt4kGyybTnNA0krI
	1luG1jsPwpeyRKYROxixzGmnGkPxR1nRgus0sUc2YiPqrlsyHkE4AOmWiDIl58if9WKQsA==
X-Gm-Gg: ASbGncsFbLxGKL64+u8fRJU+mCbu9PB63VOk/iJA81f5TwdoudkwoKtXMT2sI1Ps+qz
	tES1Idr/TGXm54YwZs7p8kX5Rroo2Dt4LzqlRwubV5fhx9cjah+QJyeax+59r/mi3cHcw6qwWy5
	eI75eeX/XlrN6ovl0zvlaDRKmOJGr41Zx1MX1XeXkw6I4og7v2NUbpBoM3FwZuEMwyGXmfsSQN1
	0nhb9wYmnWMEHhMjf3LpLt/pTkPyfiEFqMO50megBH5lKdQehv3babDwQT994l1H/JLDwGAo7aY
	Jvn4RJNQrjNKW/TTIAONMvrCjy91cVtCfukTSnZnQovCOfN8ttM0bGo7tjG9FLMvhbsxMbr4y1c
	EpYXQQmDLrGJrTcOICXhzezmTEhmmwJlF5y/BjZ/+cAgz8J7hr/NomkJuktA=
X-Google-Smtp-Source: AGHT+IFF0GpolSwqbh8qtuQ+qbO+AbH5QO7XIKCSeB2JmlXgRUD9SQ2+4zyonUIurKTJfoYnKHxvJA==
X-Received: by 2002:a05:6602:158c:b0:93b:b891:d6e1 with SMTP id ca18e2360f4ac-93bd17b9cfemr114458539f.5.1759871878936;
        Tue, 07 Oct 2025 14:17:58 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-93a7d81c743sm603525739f.6.2025.10.07.14.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 14:17:57 -0700 (PDT)
Message-ID: <3adc91e7-8a96-4ffe-b891-2b9df252d8da@linuxfoundation.org>
Date: Tue, 7 Oct 2025 15:17:56 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] driver/scsi/mpi3mr.h: Fix build warning for
 mpi3mr_start_watchdog
To: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>,
 sathya.prakash@broadcom.com, kashyap.desai@broadcom.com,
 sumit.saxena@broadcom.com, sreekanth.reddy@broadcom.com,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
Cc: mpi3mr-linuxdrv.pdl@broadcom.com, linux-scsi@vger.kernel.org,
 david.hunter.linux@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250924160635.27359-1-kubik.bartlomiej@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250924160635.27359-1-kubik.bartlomiej@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/25 10:06, Bartlomiej Kubik wrote:
> Fix watchdog name truncation.
> 
> In function mpi3mr_start_watchdog, watchdog_work_q_name is build
> snprintf(mrioc->watchdog_work_q_name,
> 	sizeof(mrioc->watchdog_work_q_name), "watchdog_%s%d", mrioc->name,
> 	mrioc->id);

Include build warning in the commit message

> 
> Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
> ---
>   drivers/scsi/mpi3mr/mpi3mr.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/mpi3mr/mpi3mr.h b/drivers/scsi/mpi3mr/mpi3mr.h
> index 8d4ef49e04d1..5307fcdf216f 100644
> --- a/drivers/scsi/mpi3mr/mpi3mr.h
> +++ b/drivers/scsi/mpi3mr/mpi3mr.h
> @@ -66,6 +66,7 @@ extern atomic64_t event_counter;
> 
>   #define MPI3MR_NAME_LENGTH	64
>   #define IOCNAME			"%s: "
> +#define MPI3MR_WATCHDOG_NAME_LENGTH	(MPI3MR_NAME_LENGTH + 15)

This 15 looks random to me?

> 
>   #define MPI3MR_DEFAULT_MAX_IO_SIZE	(1 * 1024 * 1024)
> 
> @@ -1261,7 +1262,7 @@ struct mpi3mr_ioc {
>   	spinlock_t fwevt_lock;
>   	struct list_head fwevt_list;
> 
> -	char watchdog_work_q_name[50];
> +	char watchdog_work_q_name[MPI3MR_WATCHDOG_NAME_LENGTH];
>   	struct workqueue_struct *watchdog_work_q;
>   	struct delayed_work watchdog_work;
>   	spinlock_t watchdog_lock;
> --
> 2.39.5
> 

You are changing the structure size here? How did you test this
patch? DO you have this scsi card to test and make sure this
change doesn't introduce regressions?

thanks,
-- Shuah

