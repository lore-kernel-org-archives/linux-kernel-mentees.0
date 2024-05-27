Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED2661FC6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 14:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716821038; cv=none; b=RIIwT3y9+OVEhfciXrXyxsFXAvxT1ioYDtwvFUckWxKluEAmOwwNPgS5wuhB0jHxifVsRA3JCMHiiDa9nKqMKueFfm12R/6dSWvU3dKEeDlcAzZSM26/WuqdR39wnqO0LDdyIy01hiZ2fXL8YoU0w3abzR2RDYTgOWW6o3TWLXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716821038; c=relaxed/simple;
	bh=yZ54pHZc8pZ1llQjTF214XGFVmGuCbN++WoTXje+y18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eASs+n23x+ROBWzfs9Dec6/NIB67mtA9PAT7KWW02wAT9icRXMB7Xx7jP2IHrgXYDxxktRQly1u3VflTzpIbxGq70aOn00pwDA4nNvY+jRFOlbPTRTHYe0kQb9UzH/FEg0x42K5OWwYKdu7/A6MblIhNNxJuJ26oQ2SqP5f3EUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mNSFcWU0; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNSFcWU0"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB79D80BF2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 14:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xvyFoDqoiM2x for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 May 2024 14:43:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=yskelg@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AF72280BA7
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF72280BA7
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mNSFcWU0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AF72280BA7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 14:43:55 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1f082d92864so145780585ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 07:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716821035; x=1717425835; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rEv9TOl2VcsNK97lEGFpOwkx9V8aOFfBaXbVSYVjqbk=;
        b=mNSFcWU0SfZ7vDOrB2NVdwvofaK9u6ldQZK3grL5qcgfklVI0UzibLQsFFJXo4a9kz
         rVhiMX4Y8WJHtV+AWl4xqV8BAiYd0fp96k3rXQ5Xc29spzoYv5ODVj3B5B6hImARNkai
         iN3Sofdywfa79nM7teaE0O+LeW08A35qNWE6beLE+UEcq/gz9pljIBARBXCIPWdA97He
         nQYJjdS4mrkcG0GF4/CeR+Xc9HpOp8jWSiduDOMiE0Law9U61Om/MhSgwi7utfIz9d06
         J27VgCOn7iIyx0LZWC7xPKkYBMUsbcEgn2KVdaQ0rS+NZrDo7IlQC7o1Pm7CfFpvV30a
         Kn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716821035; x=1717425835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rEv9TOl2VcsNK97lEGFpOwkx9V8aOFfBaXbVSYVjqbk=;
        b=iB8QHBZ9jYg0bmMC7KgRT6pPTsrQTInHAuSlfSGPTcYm78d1iTuwXS9fH0fGJereu2
         LqDOSU8jqWu/StlB71GVi3bRZ2yOC2PT4eChzFdxCVLXlsBzs+AItO8RmKUk8aBcnflB
         kqN3qLaY4Qw8mvTTdbDlfuFIZThD2a5UUnd5NWQxvzFWiNSHguCXWVWt61fvO+cvfgxK
         cHRLk/7TZw/kquvMYMuZkOKyiSkgyuulBnj21VC3YPEuSI3rC/YB29GAUxjm1rgFM4yM
         tcRhwBwEODDsWu8D5kMS4R/zRFgBIIeKwGrZfnuz3EJXmLxTrwxwYu7AKujyTV3IVZsb
         myiA==
X-Forwarded-Encrypted: i=1; AJvYcCUV+rrzxhNYDwgUCVYbVNvqBYPiELcG1Huh6X1gBoLM0SzIayDdnGn5I3nYFWYdeGUfyyUVvb3wDa3A4u/HjI+Kwlxd33v+BID1dPSLImnQnSCIFZ9OrLVeCZIwBz2A
X-Gm-Message-State: AOJu0Yye3T2q7Kwlmj3FYD4/FxX79BR+EoFl9FxVgWl9S8gd+tejb1Gt
	Ho3kpx10qguxVGjQFlIGnj839EaY9ktc3C4SSy2du6KIGh9mfcWZ
X-Google-Smtp-Source: AGHT+IGnAR9vdm6Qy/DLqPuX3AD8gKj8qNo/aOyJuE1HPXJCL3Up+L+CWGvNzE959PkXuAs62RPlEQ==
X-Received: by 2002:a17:902:f68b:b0:1f4:8372:db24 with SMTP id d9443c01a7336-1f48372df16mr43806395ad.38.1716821034998;
        Mon, 27 May 2024 07:43:54 -0700 (PDT)
Received: from [192.168.50.95] ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f481d5a77bsm30101805ad.298.2024.05.27.07.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 07:43:54 -0700 (PDT)
Message-ID: <8880b0ec-9315-428e-b9c4-e578690d3c08@gmail.com>
Date: Mon, 27 May 2024 23:43:50 +0900
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Documentation: cve Korean translation
To: Jonathan Corbet <corbet@lwn.net>
Cc: skhan@linuxfoundation.org, Jinwoo Park <pmnxis@gmail.com>,
 Austin Kim <austindh.kim@gmail.com>, shjy180909@gmail.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20240527103003.29318-1-yskelg@gmail.com>
 <87ikyzpgqz.fsf@meer.lwn.net>
 <bf37bf39-32d3-457f-abd6-115215d631af@gmail.com>
 <87o78rnz3a.fsf@meer.lwn.net>
Content-Language: en-US
From: Yunseong Kim <yskelg@gmail.com>
In-Reply-To: <87o78rnz3a.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/27/24 10:50 오후, Jonathan Corbet wrote:
> Yunseong Kim <yskelg@gmail.com> writes:
> 
>>> 1) Why do I have three versions of it in my mailbox, sent over a period
>>>    of 13 minutes?  What changed between the versions?
>>
>> Sorry, I forgot the name of the reviewer when I first sent the
>> documentation content related patch version 2.
> 
> Which is fine, but...
> 
>>>    Normally, you want to wait for reviews to come in on one version
>>>    before posting the next, and you should put a comment after the "---"
>>>    line saying what changed.
>>>
>>> 2) When did this review from Jinwoo Park happen?  I was not copied on
>>>    that.
> 
> You did not answer this question.  Reviews should generally be done in
> public, but that does not seem to have happened here?

Oops, sorry about that, Jonathan.

Jinwoo Park sent me the review below, and I've updated some of ambiguous
words in patch version 2.

https://lore.kernel.org/linux-doc/57f0d90c-4cc6-4418-ab79-6ae026d8ae09@gmail.com/T/#t

>> Thanks for translating new Documentation/process/cve document to Korean
>> Language. Most of the Korean sentences are looks good to me. But only
>> one sentence seemed unnatural.
>
> Thank you for the review Jinwoo.
>
>>> 잘못된 CVE 항목들
>>> =================
>>>
>>> -해당 배포판에서 변경된 사항으로 인해 또는 해당 배포판이 더 이상
>>> kernel.org
>>> +특정 배포판에서 변경된 사항으로 인해 또는 해당 배포판이 더 이상
>>> kernel.org
>>> 지원 릴리스가 아닌 커널 버전을 지원하기 때문에 Linux 배포판에서만
지원되는
>>> Linux 커널에서 보안 문제가 발견되는 경우 Linux 커널 CVE 팀에서 CVE를
할당할
>>> 수 없으며 해당 Linux 배포판 자체에서 요청해야 합니다.
>>
>> When the first modifier "해당" is first used in a Korean sentence, like
>> "the", there needs to be an explanation of what it is targeting.
>
>
> You're right, that phrase was awkward in the direct translation. Thanks
> for catching that.
>
>> However, in the process of literal translation, it seems that "the"
>> became "해당" due to the difference in word order between Korean and
>> English, And since the translated sentence did not describe which "Linux
>> distributor" is being described, it would be very difficult if
>> "특정(specific)" were used instead. It seems natural.
>
> I will send version 2 patch. Thank you!
>
> Warm Regards,
>
> Yunseong Kim

And I added Jinwoo as a reviewer to the documentation on patch version 3.

On 5/27/24 10:21 오후, Yunseong Kim wrote:
> I added Jinwoo's name here on version 3.
>
>> +:감수: 박진우 <pmnxis@gmail.com>
> Warm Regards,

Thank you for guiding me Jonathan.

I'll keep the process in mind and use them to help the next person who
translates to Korean.

> Thanks,
> 
> jon


Warn Regards,

Yunseong Kim
