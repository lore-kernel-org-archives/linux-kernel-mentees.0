Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52048306485
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Sep 2025 15:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759158220; cv=none; b=BHoZe3LSAzekyV6oF9CvSqCefc02FbRceQ/6t1vGuGgRMOmYKmlJoCEBVtrBuGnmAWADoQbRErijr3DgxyQuU2uJhSvozeqZHmQB6qF1YFF+c9uNgsD5m8v/iO80lKKy9dwjDlZvE7wFtGrAyTEaluHHehq/ggt3CZTWUZ+yYks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759158220; c=relaxed/simple;
	bh=Txljvt4Nq0aTqDJEu/ZXvtErmn62T+wSfeV8ckXdBe8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Oy9YtfONYmYMJu3SEZUvYHYQsJtVcmnM4cumm3q7diS8AOdjM8uGvx2RWx5s591BZyvq2h5WhEjHQcmI9RMYjcmvnShrBVV/KHJjE3h1JTKU7ejjYJrSYsF+UodN9qAWJSUQrEyLluRCzjHBf0msZkszopEFHoaw24Cwjyqc2Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lDgaRTag; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDgaRTag"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD33581101
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Sep 2025 15:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ymKypEiApi3g for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Sep 2025 15:03:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D127E810FB
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D127E810FB
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lDgaRTag
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D127E810FB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Sep 2025 15:03:37 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-62f973b37c5so738735a12.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Sep 2025 08:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759158216; x=1759763016; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n1XrYQjyYcqW6k1KsAQsJ4lFAw/seygwzewKvhwTUHM=;
        b=lDgaRTagKQzA+WMnQEZYaUngfy7WDQsH0aWI1qJCpWVFqfa544zFytZzKcU2FB69Gu
         5dN9wRpABWiFVIP6Khoh6TDbv+s8Q5eC73wkbsrTPujaN4bt+vrwPPDW7aPF2hiacRqG
         +bPZTxG3g+6NENm0hb8iu4qHnKMRje9WzclMwhu+BsjvWpfDta/p1wg0nDAE3dkfz0Ev
         1I6AVshwJWlEf9IhVCbO3U59cIec71/y1FXAojMfRtWbG6ecj2t9g9VLurTxFOClbcNd
         CS7FDfPoCPQv9AnFb3ANgUNkEhuuNWrbpZYICuwADuXUbX5q19/JOW5IlG9gmSoEewsw
         Vvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759158216; x=1759763016;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n1XrYQjyYcqW6k1KsAQsJ4lFAw/seygwzewKvhwTUHM=;
        b=LIV+rJK3NTddkhuDM525KSLmb23q5Ae56rjeL8pYL0XfJrrTdZ6u0hW0PTsEeqKpfA
         qrAolttcepC47Rw8p0EYk+P2vP2TlWCBspsV6Y5mS7TZFUsduc6DuKk6jpFOl5B8dexT
         nLMAckrYj1saXJ1HE029xN9mYJcZzAi6Jvo+2xIhAu1PqlfYEc1QPntFBpZe8XGGXIqB
         1KFDRG+1el33rapKvCe2uPqbsbaSEr/5m6iu6VRsk3kHTs3DRlALFUKVH975CfuTE4BP
         u/tSceL8U9OqWMludRWRSgkGHfmnB+S/wIqI666Qqpc7qih8zj+xIjsHvC8klBx0nM8p
         zGoA==
X-Forwarded-Encrypted: i=1; AJvYcCW8OI/Duk12K/VnPC2ElRSxyjscwirKGUgIG38ti+xzRTzAeKtkv8DQvzQELq7zqxvqS1QAkvaiJ6eG8VnWfcPnjTqVvg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyplgytZuqk3NNAdIJ4ojHB8Fq3Q6fxjDTjELofllw6/CMb2uqE
	9xgsyJINZ+t/ouLZxPLKNBs7haBHveZ2lZo10bms37FLjPa1w6zkQDad
X-Gm-Gg: ASbGncs38Cg2QPG2mMtCQNcKnjO49zw3J6dLFSf3SnWKIycpt6/5lk0zO/7JNjGxUYV
	liTTGF4ls+mB1lHQXy4ay1aBOovMt6MjaAz7qf3AWBPpW4iNuCdAYmtDcYvJjKSLw2tV1y2BGaZ
	ewwt9CKijyPQU0p5hO+nE8926l6Hyjj5YiJFJE8OD2YhuABsldBhK5Ekgvlyl8pL5oRXMs6Tg/K
	a0o8cHs1A8ZntyXbLjEDUnO0JXFJ3vuvgJfXITHzW+mepRQSfB+60NxEOW5s5xyYHTeJeei9GdU
	5FonI0HoCb1QyET7f7f6dPbDQ5gHpnl3zylN3g65rPUTKoH5hmm8srhET1EIkxE7tdU8FppCufL
	8VCVibywMbUF/FpXJDb3dvc7ruhlFTEcU51fIouJhyIB5
X-Google-Smtp-Source: AGHT+IGB16HNv+Jp1bLAOldcBF3kwkXvbqxilb33Pzgtml+xb1qiDD8br1uCM6zm8zTtfrtEl6gFPw==
X-Received: by 2002:a17:906:c14b:b0:b07:c715:1e44 with SMTP id a640c23a62f3a-b34b8999455mr944929466b.5.1759158215348;
        Mon, 29 Sep 2025 08:03:35 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.77.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3d461a411fsm309818066b.10.2025.09.29.08.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 08:03:35 -0700 (PDT)
Message-ID: <e3a0d8ff-d03d-4854-bf04-8ff8265b0257@gmail.com>
Date: Mon, 29 Sep 2025 17:03:29 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Subject: Re: [PATCH] selftests/bpf: Add -Wsign-compare C compilation flag
To: David Laight <david.laight.linux@gmail.com>
Cc: andrii@kernel.org, eddyz87@gmail.com, ast@kernel.org,
 daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, shuah@kernel.org,
 matttbe@kernel.org, martineau@kernel.org, geliang@kernel.org,
 davem@davemloft.net, kuba@kernel.org, hawk@kernel.org, linux@jordanrome.com,
 ameryhung@gmail.com, toke@redhat.com, houtao1@huawei.com,
 emil@etsalapatis.com, yatsenko@meta.com, isolodrai@meta.com,
 a.s.protopopov@gmail.com, dxu@dxuuu.xyz, memxor@gmail.com,
 vmalik@redhat.com, bigeasy@linutronix.de, tj@kernel.org,
 gregkh@linuxfoundation.org, paul@paul-moore.com,
 bboscaccy@linux.microsoft.com, James.Bottomley@HansenPartnership.com,
 mrpre@163.com, jakub@cloudflare.com, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org, mptcp@lists.linux.dev,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com
References: <20250924162408.815137-1-mehdi.benhadjkhelifa@gmail.com>
 <20250926124555.009bfcd6@pumpkin>
Content-Language: en-US
In-Reply-To: <20250926124555.009bfcd6@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/25 12:45 PM, David Laight wrote:
> On Wed, 24 Sep 2025 17:23:49 +0100
> Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com> wrote:
> 
>> -Change all the source files and the corresponding headers
>> to having matching sign comparisons.

Hi david,
sorry for the late reply.

> 'Fixing' -Wsign-compare by adding loads of casts doesn't seem right.
> The only real way is to change all the types to unsigned ones.
The last v3 did only do that with no casting as it was suggested by 
David too.

> Consider the following:
> 	int x = read(fd, buf, len);
> 	if (x < 0)
> 		return -1;
> 	if (x > sizeof (struct fubar))
> 		return -1;
> That will generate a 'sign-compare' error, but min(x, sizeof (struct fubar))
> doesn't generate an error because the compiler knows 'x' isn't negative.

  Yes,-Wsign-compare does add errors with -Werror enabled in that case 
and many other cases where the code is perfectly fine which is one of 
it's drawbacks.Also I though that because of GCC/Clang heuristics 
sometimes min() suppress the warning not because that the compiler knows 
that x isn't negative.I'm probably wrong here.
> A well known compiler also rejects:
> 	unsigned char a;
> 	unsigned int b;
> 	if (b > a)
> 		return;
> because 'a' is promoted to 'signed int' before it does the check.

In my knowledge,compilers don't necessarily reject the above code by 
default. Since -Wall in GCC includes -Wsign-compare but -Wall in clang 
doesn't, doing -Wall -Werror for clang compiler won't trigger an error 
in the case above not even a warning.My changes are to make those 
comparisons produce an error since the -Werror flag is already enabled 
in the Makefile.

> So until the compilers start looking at the known domain of the value
> (not just the type) I enabling -Wsign-compare' is pretty pointless.

I agree that enabling -Wsign-compare is pretty noisy. But it does have 
some usefulness. Take for example this code:
	int n = -5;
	for (unsigned i = 0; i < n; i++) {
     	// ...
	}
Since this is valid code by the compiler, it will allow it but n here is 
promoted to an unsigned which converts -5 to being 4294967291 thus 
making the loop run more than what was desired.of course,here the 
example is much easy to follow and variables are very well set but the 
point is that these could cause issues when hidden inside a lot of macro 
code.

> As a matter of interest did you actually find any bugs?
No,I have not found any bug related to the current state of code in bpf 
selftests but It works as a prevention mechanism for future bugs.Rather 
than wait until something breaks in future code.
> 	David
> 

Thank you for your time David.I would appreciate if you suggest on how I 
can have a useful patch on this or if I should drop this.
Best Regards,
Mehdi
> 
>>
>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>> ---
>> As suggested by the TODO, -Wsign-compare was added to the C compilation
>> flags for the selftests/bpf/Makefile and all corresponding files in
>> selftests and a single file under tools/lib/bpf/usdt.bpf.h have been
>> carefully changed to account for correct sign comparisons either by
>> explicit casting or changing the variable type.Only local variables
>> and variables which are in limited scope have been changed in cases
>> where it doesn't break the code.Other struct variables or global ones
>> have left untouched to avoid other conflicts and opted to explicit
>> casting in this case.This change will help avoid implicit type
>> conversions and have predictable behavior.
>>
>> I have already compiled all bpf tests with no errors as well as the
>> kernel and have ran all the selftests with no obvious side effects.
>> I would like to know if it's more convinient to have all changes as
>> a single patch like here or if it needs to be divided in some way
>> and sent as a patch series.
>>
>> Best Regards,
>> Mehdi Ben Hadj Khelifa
> ...

