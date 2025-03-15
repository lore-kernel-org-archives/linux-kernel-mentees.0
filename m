Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B0018B484
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 15 Mar 2025 02:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742006469; cv=none; b=PwQD0j0Y+siT9VYi2GDNq74UBfsrOkw08psYjonBJyOy5gjo7GBVId94f/Fp867CSxE35TL6t6mEKyI4eSXjbO6mThvJlrSHViq8ikf/cuiTLrV3EH+SRgC7GsruqL+nAdQtpyjsZve9pIJzwh1ivqw9U2F3UVoaNPlA77RbDLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742006469; c=relaxed/simple;
	bh=B2CEDEhFdSbK5+6Qq7Xbe3jgxhR1ZYSO6nxrloEY2NU=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=K3sJUDypPrCxKzA63DsU2zD30PdDhOKOORd/fuDtm/yDKB86/Xq75EMz+h87uORj9ZMaGZifJ8gcK/v9X6ktNdKUaHsf9G9h24Khbe8rqHalvYpnhCezUUG56QaBUc4/sGL4uO3JlFzZylLAoallG4ebpcl0CKIUtq04//Ot2D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPnvYgZp; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPnvYgZp"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-219f8263ae0so46795435ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 14 Mar 2025 19:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742006468; x=1742611268; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15gdaJdchlrAww0ZPYIU2PXFNpF4h7zH7gWYODgucLk=;
        b=lPnvYgZpunUcXd7AZWopSnzuG7qM3Aht55lDrn9mgNI2k4QwvbYBWpg1wM1OyihOZI
         Fl2X0Q8epj6s6D4APPsnKJnGwk1yD7evdKPWxlnJHgvZD61mZunIzMB+LycVFR28uYNx
         AJPzATn0sE1CnhDeeLtbzgcypcN374peiqNuBtH2HhjDxGXj04v8kAb7AIrpkQSbCCLk
         P47tnA0G6cUpF0OvfD3644ywSujXctLEMWa1Hd3F++cUej74hGQg2VuHc76nswQuPOC/
         tjlYa09X4N8BLTob9J+CvRbIDxrH2kv86ZKfWSxFBrBHNY+dD3hGuWRx083sRcvgkUvB
         Cykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742006468; x=1742611268;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15gdaJdchlrAww0ZPYIU2PXFNpF4h7zH7gWYODgucLk=;
        b=oh2XqVki0GQKHK2IoHaGJeMFWZ0eh3P6UztVPHd6BOtlLmJ3iJ/UFHjXMFeZ0IsOhc
         uLHeyd7axpu/pBVNbq6s4LC+Aa6A3GG0zYvd3wuzQD65onKsvT5FeT7McmdWuIUtUrK9
         ZDkznPchGGPy0nsvChd9YrofAAE0WzzZO4Vrsw6WC537oEoHho+UdTa/CTN1SNwfeUw/
         ZwFGgRNzlDotfUnBis0mp4UKnrqXOzzULEcKxU6mNm7hUowgJJDSZsvNpwsE73VHapOs
         9UaP3xwcBaT4NskPNtYXwzcENOnve5gjR8MeBINlv/4kWGjQ4prbmO1TPpOOkhaavg3a
         uAZg==
X-Forwarded-Encrypted: i=1; AJvYcCWUq7qZO3yVNc5dutiEHVBo0f1EtonAX458hpsW+Y5g1aZddF/WTUh2udrVvcyIW01gUlu5Knqggbf1HMFRBuMX/1pjqw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzcwJF+2nzep+TxDhdkjAx9dBOw77vzDTgduPRk9s90ZZpkZ8bd
	t3gNXxsqDEZZZ2DcqruaeZPCftPr9RYTMPmAeS4LPr9eKF7pgR42
X-Gm-Gg: ASbGncvL0IFCjtv8cMzM4uYwKlOHrU5tDwaWuSsK88g9qlMjIIKe+5fw9AU67bjHm78
	RAqHm1VMCj6gDi2GBjImlhxMMd24kir31mwwb5WQbTtGTlVAuM1k+GAc0VVFw6usemfjcNJW+MB
	6hZ+im5u9eWgs/fnXhRqn6yC006q5ucPP/12ytqetNt0HAm/PmHUKYoS1PkIDar9vy0hOqs4Mm6
	ZJgHlHRjWgV8rtuqSAup37O+gfLH4nWUmhTI3WquTxaCNOg8aqD3GTJx7V2WRQoC4YMYrLt3Uyc
	VIv/fu/O2tliA3VWpnH/u5xRtFpFoT9+i7vU6/RYDq58CFVBx5ZBjo+5vNFlb/80mwVUL0ygUcW
	HbWUd7tPhp/9Syjk=
X-Google-Smtp-Source: AGHT+IFaFRZP4GF2msqauqXMGAobEitpbtIOLAfjlGUx0Lcd1m68pCYkXYMSC7iLEn+TyVaHIjArSA==
X-Received: by 2002:a17:903:2b0f:b0:223:49cb:5eaa with SMTP id d9443c01a7336-225e0aeeaadmr76664625ad.35.1742006467666;
        Fri, 14 Mar 2025 19:41:07 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba740bsm35410785ad.122.2025.03.14.19.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 19:41:07 -0700 (PDT)
Message-ID: <c6a697af-281a-4a91-8885-a4478dfe2cef@gmail.com>
Date: Sat, 15 Mar 2025 11:41:03 +0900
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: ignacio@iencinas.com
Cc: corbet@lwn.net, dvyukov@google.com, elver@google.com,
 kasan-dev@googlegroups.com, linux-doc@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, workflows@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
References: <1d66a62e-faee-4604-9136-f90eddcfa7c0@iencinas.com>
Subject: Re: [PATCH] Documentation: kcsan: fix "Plain Accesses and Data Races"
 URL in kcsan.rst
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <1d66a62e-faee-4604-9136-f90eddcfa7c0@iencinas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

Ignacio Encinas Rubio wrote:
> On 12/3/25 23:36, Jonathan Corbet wrote:
>> It would be best, of course, to get the memory-model documentation
>> properly into our built docs...someday...
> 
> I hadn't thought about this. If this sentiment is shared by the LKMM
> people I would be happy to work on this. Has this ever been
> proposed/discussed before?
>

This might be something Jon would like to keep secret, but ...

See the message and the thread it belongs at:

    https://lore.kernel.org/lkml/Pine.LNX.4.44L0.1907310947340.1497-100000@iolanthe.rowland.org/

It happened in 2019 responding to Mauro's attempt to conversion of
LKMM docs.

I haven't see any change in sentiment among LKMM maintainers since.

Your way forward would be to keep those .txt files *pure plain text"
and to convert them on-the-fly into reST.  Of course only if such an
effort sounds worthwhile to you.

Another approach might be to include those docs literally.
Similar approach has applied to

    Documentation/
	atomic_t.txt
	atomic_bitops.txt
        memory-barriers.txt

Regards,
Akira

