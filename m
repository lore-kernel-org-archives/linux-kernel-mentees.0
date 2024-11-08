Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3518E1CB333
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Nov 2024 05:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731045121; cv=none; b=I6phaUW/NbQPuHiDMgx2X8uBVr8rRKWPTfI+zLfuKDpHTB9z/e55yboaOLrSKHEOrbumItToGBUB8Hz3IzuZ29hp3I0GM0iM8GMTjZNp1sCAQjbCqE7ExfJlFO6gnnyQ12CItMxjNkceNA34nv+P+9TjS7UkLWjeYJNEzhkHHpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731045121; c=relaxed/simple;
	bh=FldH5ezVCKzA4ilhWwESkXoEsqQSxz+NQnJCrsnSmDo=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=DIVkF7wYeConyove8z08nnEHDwz8Ay/JW1O/6QNvXvEMkdJlIfwhf6u6cdaTNycFGWklgzyvGGvy8fzohvKncpU3+p5myK6WwPEiUdwp2OstofEA4A1qbWElfxmQz11YFV3OjpqHzaExEqHur96AzbXo7RFm+qLm6ZzRNVgKR6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nW3NpdFq; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nW3NpdFq"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1D28844A4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Nov 2024 05:51:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5bACF46xG324 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Nov 2024 05:51:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4860:4864:20::36; helo=mail-oa1-x36.google.com; envelope-from=xandfury@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A6A92844A0
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6A92844A0
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nW3NpdFq
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A6A92844A0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Nov 2024 05:51:58 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-290d8d53893so813297fac.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 07 Nov 2024 21:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731045117; x=1731649917; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqQKVoQIIB/alco7tDnCa7tsUMIzxx7+4InKayAOpSw=;
        b=nW3NpdFqqO0vF1bqG8rKycU7KgYR21X4umZLfSS/sXcMF1p7Lg6s1x/FckY1lB+kBS
         0AgxdAQxfNiVRI6G/lunm5U/UZdNG8ASbnX0Rr9rBFEvCGXEHSiRFfnbhsZDq/5MATbe
         9KUft8cqX1o3D5Uh7wUBkxvnf3A6T0+3HCPIlXLVbWsbMzvQYO/gLP8assNOL0sCOtPA
         lRJMTrzuP2K0xBLfHu1kfEX++jPRBc62P5rJvt1K1VE33m5pf2EXrXle3g9SskzA/U3/
         eT27nJLENkfL443PsDjWT+GVJ3za3LT3XfCoivsUSp8Akovugc0CjGru/8GCMrNWEp/K
         Altg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731045117; x=1731649917;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OqQKVoQIIB/alco7tDnCa7tsUMIzxx7+4InKayAOpSw=;
        b=D36O8GoWAGmBC/aJx/O5oi9j7UiAzF92KUMWnZYCAdzOhjJ/fSxZCI59/34Pf2Y8hA
         hjgnOyoOY1N5jvU+M7poVhvEXkSQjCs4pSe4n6F8xvWJHf74aClBvkiqUs3GbIIbO5MG
         4gpPsFy5EGlU/dXN8QyDVsbPnwL+vJGecQvQLxwfcvhZ1oVkUrQMOPSI8IHx2SNgEoCg
         /uBzh5dASjPCVghL2CuLu+uc7x+ANQiegCp3GSonuGAYV/uu7H73zbgbZprgz8HaRAqe
         9Vt88wz1RwrLOtOlVPWlEMv6IYzVvkfriYwxOjhD9Rk9CQvRZZ102dGCk6X0LXWWAVHZ
         pocQ==
X-Gm-Message-State: AOJu0YxURtAQEzDi8ybyMN2NAjTF8dmsajZF0ZhKDFOj+v943KRB4trj
	5/77OL0LO6QRhX9q4biG6dcPxgUqtb4VOH7/S+4biQJQzZozRPKe
X-Google-Smtp-Source: AGHT+IFkZaTZJxaNXXPpZuSOVEsTRJR2nEjo5hkiRAfTbYsTwu37oqi4krQ0l4Ej1anGCJLRJlEz4A==
X-Received: by 2002:a05:6870:5e53:b0:27b:55af:ca2b with SMTP id 586e51a60fabf-295600c5b27mr1930081fac.11.1731045117421;
        Thu, 07 Nov 2024 21:51:57 -0800 (PST)
Received: from 1337 (ms-studentunix-nat0.cs.ucalgary.ca. [136.159.16.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078a7ec7sm2752918b3a.55.2024.11.07.21.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 21:51:56 -0800 (PST)
References: <20241107063042.106228-1-xandfury@gmail.com>
 <464b1628-957a-485b-87d9-47636491de22@infradead.org>
User-agent: mu4e 1.6.10; emacs 28.1
From: Abhinav Saxena <xandfury@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Corbet
 <corbet@lwn.net>, Matthew Wilcox <willy@infradead.org>, Zhihao Cheng
 <chengzhihao1@huawei.com>, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 1/2] Documentation/mm: Fix spelling in hwpoison.rst
Date: Thu, 07 Nov 2024 22:50:46 -0700
In-reply-to: <464b1628-957a-485b-87d9-47636491de22@infradead.org>
Message-ID: <87ed3me0j3.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Randy Dunlap <rdunlap@infradead.org> writes:

> On 11/6/24 10:30 PM, Abhinav Saxena wrote:
>> Fix spelling of "focusses" to "focuses" to follow standard English usage.
>>=20
>
> We accept British spellings.
>
> internet says:
> "Both spellings are acceptable in American and British English."

Ah. I should've checked contributing.rst[1] first. checkpatch.pl flagged it
for me. I did not look more into it.

Thanks for the detailed reply!

[1] - Documentation/doc-guide/contributing.rst

>
> "Focused" is the past tense of the verb "focus" and can also be used as a=
n adjective to mean clear. For example, "She had a focused approach in trai=
ning".=20
> The plural of the noun "focus" can be either "foci" or "focuses".=20
>
>     FOCUS definition and meaning | Collins English Dictionary
>     ), plural, 3rd person singular present tense focuses , focusing , pas=
t tense, past participle focused language note: The spellings...
>     Collins Dictionary
>
> Focussed vs Focused | Spelling, Explanation & Examples - QuillBot
> Sep 10, 2024 =E2=80=94 Published on September 10, 2024 by Trevor Marshall=
, MSc. Revised on October 29, 2024. Both focussed and focused are ac...
> QuillBot
> Spelling Tips: Focused or Focussed? | Australia's Best Writing Tips
> May 7, 2020 =E2=80=94 Summary: Focused or Focussed? 'Focused' and 'focuss=
ed' are two spellings of the same word: Focused (one 's') is the sta...
> getproofed.com.au
>
>     Show all
>
> "
>> Checkpatch.pl reported this issue.
>>=20
>> Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
>> ---
>>  Documentation/mm/hwpoison.rst | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/Documentation/mm/hwpoison.rst b/Documentation/mm/hwpoison.r=
st
>> index 483b72aa7c11..dd02fae484dc 100644
>> --- a/Documentation/mm/hwpoison.rst
>> +++ b/Documentation/mm/hwpoison.rst
>> @@ -17,7 +17,7 @@ To quote the overview comment::
>>  	hardware as being corrupted usually due to a 2bit ECC memory or cache
>>  	failure.
>>=20=20
>> -	This focusses on pages detected as corrupted in the background.
>> +	This focuses on pages detected as corrupted in the background.
>>  	When the current CPU tries to consume corruption the currently
>>  	running process can just be killed directly instead. This implies
>>  	that if the error cannot be handled for some reason it's safe to


--=20
--=20
Abhinav Saxena
