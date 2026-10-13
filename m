Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB7F52F266
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 13 Oct 2026 15:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906403; cv=none; b=toWOgyaMygoCPn7Zn08czHmdM9SQpgy8mwvzdJ60eKoHZRvElQDK5fLF8TJz+Xk7LZPZdQ0qBaanLcSfehElYsPKV/qk1KUZPf3Q5e6XpdIk+skktIfs97DXB7T/ezzbuCSzM2umVdTNMBuMtKzpN3gPEYD2b3jMvpuugZmEncc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906403; c=relaxed/simple;
	bh=qxAhtH0Qz1tc4sXD3RSk0GitMJeJ1buUR5W2lDaw1ro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WZGUZwGDiKqK0uv+dM75NKMdxUB68elbHgoF5Q1NVEZGSLQwHgnuW6h3SjHDbtgn5Gap1n8MD6qnEYPZ9bOLRr0q56lyI/SajCvO/ViuEEg9GmkqxXd9GxX4NNkMPofcuVErOLrvweKbGA9bDLk1WhBe174a4UFlTbhvUSJ5cow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YJ1D0HBV; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YJ1D0HBV"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7f84a55e31aso1886163a34.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 13 Oct 2026 08:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1791906400; x=1792511200; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ockmvioh5kYqi16yQi6YbVdMgoCKQuguDfyJFS26lwc=;
        b=YJ1D0HBV9o31ZA3UEx+Ni3c4cBOHQyfTfj4qjvoqLkvHbNypRLosZTvxkw9pT1XpZI
         NYVon2MCqJuACUp2Sz8pzmMokJ/RuyCT6CJhhd7nmQwwg/BsFhYwOPS6Ud2dc9fORaO2
         sJpJ8Sfbs/+poEkcTj68c7o5i0gKIxb8NYPpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791906400; x=1792511200;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ockmvioh5kYqi16yQi6YbVdMgoCKQuguDfyJFS26lwc=;
        b=PtvqJ1sMUBpgfqd8Wy/oWLDMXgLJ6W1Hy9gC2GSH8mEDnlq3YKXVSSrEmNxQOfottG
         v7POVEDRxJzuO6vdEXS9/d9l1gBz5+tAyEqB87yJ8NI1MucfCKLCsqkwTy/rcK5dUnKw
         7Z5hYsxiha3SHki4JGulu7VmaAwYhLvDcUSpRHAYRIzQ6iXtUPFJOlxQVoAGmbKbVKhW
         TuKu+LizHk7DqQQOKUgkGCWnZHXgrO/HqZ54/T9LA+0ytT3z/c/3M6Bt+HXb5QRMOlY/
         PT12M7O/XJBS6dLT9yywEVgxpIlDq/54E7VXp+iNFuM2K/3Iyz7KTT72bzdTFOykDzvo
         csNg==
X-Forwarded-Encrypted: i=1; AKwUvBw9JkKkiVZtnYHf/RGRZjna73NoIe+rKrLYQy8Crv/NWz7sQ/WQAzWJyUgtRwc1kIJS9m3gGsEZVmvjgONtVW6oC8mKcg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKFJiNTF1W/i/7CDNCbzSCEy2hjBTBci6u3cvGG1kp9uupBtAIS
	MFhFFLKa2pSL06YEP5eRrihJvTG9etkgSq0HelXk+qgjLieoQ55TE2dybMuEFA1g+6g=
X-Gm-Gg: AYBFou2d6FQRW7C9FOfLBGlh+zpmOWkz7fv5VpsM3WSS1NLS0w+RYdhBubGRFPaxp7M
	eOWXLJYVZn6l6Z+CL8MaZ3FO9sYcB0JkMEizjZfbW/uXllo0yoyisq8YmFLPVOHqx7x0xEeUp+s
	tVFx3XgJY+PAYNzm/CUeUPEnW4D1mk+OdkqSIR3rI5BcO3Q2AuWlb3Noyssx1O57ak5Yk0l4xnj
	XHKo/9EZPjnYK8vlgdjRcRO2n0ht8TgsjMyMjcCzoTB5IHEUv9HFHa3UmCjJp/IiVPnOYJZauet
	IhL5fqzmXFpkZQBB7krzoHPyM1xY99Pr7BqDsW559lZNDZcadEhqpPVOHJX3eMZ5QxkmMhRMzZ1
	DxW/Y7eZ60D+SZg+4UWCiEdkfX17GZrh+R4rXGjf4hPSumcQp86aegPMdOjYFQyjrzXTZRHYsB/
	MRwGIQnxRSV06OcfJ/Sv9vV1BTcMilhW8ry7d0iV0fCn+zdp8dMdLAgsi4imzwwjGskgYnYas2s
	t9vgWNC
X-Received: by 2002:a05:6830:6411:b0:812:3a52:16f with SMTP id 46e09a7af769-83090b2e4aamr13920151a34.3.1791906399829;
        Tue, 13 Oct 2026 08:46:39 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8367ada5b6fsm6362797a34.21.2026.10.13.08.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 08:46:38 -0700 (PDT)
Message-ID: <d1eba191-d4c3-4727-95c7-bd5736ebf8f9@linuxfoundation.org>
Date: Tue, 13 Oct 2026 09:46:35 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tracing/selftests: Fix incorrect invocation of exit_fail
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, woradorn.laon@gmail.com
Cc: rostedt@goodmis.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, inux-trace-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, shuah@kernel.org,
 me@brighamcampbell.com, jkoolstra@xs4all.nl,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260918061913.28069-1-woradorn.laon@gmail.com>
 <20261012153601.6DDF11F0089B@smtp.kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261012153601.6DDF11F0089B@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/26 09:35, Masami Hiramatsu (Google) wrote:
> On Fri, 18 Sep 2026 13:19:13 +0700, Woradorn Laodhanadhaworn <woradorn.laon@gmail.com> wrote:
>> Replace all `exit fail` and `exit_fail;` with exit_fail to keep the
>> usage of exit_fail consistent across the ftrace selftests. This also
>> reduces warning messsege such as 'exit: Illegal number: fail'
>> in test logs.
>>
>> Signed-off-by: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>
> 
> Looks good to me.
> 
> Fixes: 2f84b39f4847 ("tracing: Update subbuffer with kilobytes not page order")
> Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> Shuah, can you pick this fix via your branch?
> 

Thank you. Will apply this patch for 7.4-rc1

thanks,
-- Shuah
