Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B67028751F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Oct 2025 08:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761469135; cv=none; b=PlspuD2AiBHyNYXUna5DZK0p2qZ7GSwCfmwNQfb0uaEDPlpTLCujUzpKBGGps4WW+fyjF2sD4dWq76Zd054ooJto/yGLXX+yiXMe6Z2nZcrcoQ5NXhYCAKSQh3McBEUZvMMW67Td6HK+DyhStfULgNME54NmJ6DjzHBF2d2molk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761469135; c=relaxed/simple;
	bh=5K4B7s96EMwwaDVEBzoytBv7iE1q9RzEsf4agH12XZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H2vgIxQKmJlafgaedXT/rLR3BJTBnxbZWZ3YwsO2c5KiPVNNzVKJ5MqVpeqhHLMIr+0C+0G/otytHfEOWwKHT/i+aAR+rHkQAO5/AfQ9K/fSDyQDnVhLxAmXyEhbVy4MUfp6Vt2aTNHAkzBT7SbSXSkz2lpcg08RDJFX+BZ73XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ql89pLyz; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ql89pLyz"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA01840616
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Oct 2025 08:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rHRKwHHm33aT for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Oct 2025 08:58:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=nirbhay.lkd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 26CFE40079
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26CFE40079
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ql89pLyz
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 26CFE40079
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Oct 2025 08:58:52 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b608df6d2a0so3240386a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Oct 2025 01:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761469132; x=1762073932; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5K4B7s96EMwwaDVEBzoytBv7iE1q9RzEsf4agH12XZM=;
        b=Ql89pLyzyDrAxOLUGrVPh/H1B2u9YUZUco9hGzmWNt7ilzeHJEOrn2VUEVMkL/D6n5
         eXOwIhNVP6mjkxCezzvoGXBz3q/kPrvihuvoqnKboXR3DvOEFCdcn/AxRi0S/zfCGzd8
         ctRjmWkSVAnG9MiPczaXJqF2BUvwXxSUEre6Id3zG8GJzAeTJ0NcKFgiwYj95rfwwvKz
         7qA0Fhy1y7mvPuy8Jz3MNqhj54b1Adx61ohHYtUhbbHO7seFsuLDVpAbx/JNzi74j7ZM
         qKR9hfOqQrCPhj6XohpkZnphV8GLrXpxreVcyKQPo9U1cKj888cKcSgh17pOmf9krdGZ
         Ypew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761469132; x=1762073932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5K4B7s96EMwwaDVEBzoytBv7iE1q9RzEsf4agH12XZM=;
        b=Su0Ij6e0G9sn11QY/rAJ2NkjBaYIVvt1FlMhj1WtWPTglq+L+CDcPEGDNDgBn/MIuS
         /0SYLjpm2hfDy6jvt4tsbBCV9C3ug63P2UdPeiDVztg7Df9RY5H4mL9M+yrQTLoRBdW8
         ewNyAIaP/ZA8AxwoYxkc4aPovKsVjXxMlQprb7cu36MrKsPmEHmpg66U8mYZ6gotIxLq
         WRTMX/X7pvf3t0TyZiW3+982J66HK568bbbIfLQUiccx6EIVT4VpaBPbeXWWJH9zW2zv
         fJ0j90p/+Lapsec+haQGJbLDGvNZ3luIcNSujyOGlb3PBqlzdZ9lMZeQIeLoD6RWLfNq
         xceg==
X-Forwarded-Encrypted: i=1; AJvYcCWBtjFaFJgwD9ywwssOmsVcvz17GjZ/qSPsifwfeegTad96pYSz5jN+CGTWx6z7hudmCM613Oq0GSPdgG8TW2Ftp4ss5w==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwvknZDycS1QqMcRDP0/b/ZvJUUjakDDu2ZiRoHw+PxzuznOjg+
	akfOWc9hkSH1xm8/qXwJpXKK1NjfaI4XnTwBB8TE4vOTdIPpZ/1ZUGf/
X-Gm-Gg: ASbGnctexUdVYq3jNWuCO4q9jRgbLLpEc21yvzQYHIUzp9JtZHNe6P2cLUVAnZHTjDL
	AGI23FhmpH/cT+2X6mIPfnCM1+2Oh85TLTK10QrrezUiG86a1vUlnGCkm/bzVyB8+4pLAUHECJv
	Y/If56kuSPt2i56U71ix/vphapyttj/hBGEYr8YRJhC63vBkUdgGbmz2yzl/VKd/yvcFSyI2Lsx
	G9g60fb4ZgVKsANjPcxA4rv83VTHPt6kCTQp/9x+exJwN3VHDG88zaNo/teszc3mMUnNA9/BQ5q
	wEHEaMi0sj6lXUz1zYjb8nU7qZsB8egeUxUyOovfO3mGjisWHemoFNX7jYvWnO3CiXliwxwKkd2
	ciif/B6LNDKbcsDDzqzCFO7y3ht3qPxazvDDjPpU9eQLd3Qu3PcD/aCLnzuH1Xk/djNw3kC28Zw
	E42UcmIo+tR5/8us+VRghdB7Lat53eRWBUm7e57swvXM3QCuRbZQOBKYyrks3zc/4lxcIZMInCT
	gPzGROzy1lz18Wxruq8DFkhJp9K5e98nQ==
X-Google-Smtp-Source: AGHT+IHbY4zR+pxQ2HAXsXrhA3W5dSP1Wj+vZRqqpwWFOwc/lu9gHcqd7/GoXq4UV6YsapVAtB9Wiw==
X-Received: by 2002:a17:902:f690:b0:290:ac36:2ed6 with SMTP id d9443c01a7336-2948b97fd44mr101660985ad.14.1761469132156;
        Sun, 26 Oct 2025 01:58:52 -0700 (PDT)
Received: from ?IPV6:2606:4700:110:896a:5f1b:2412:be21:3a45? ([2a09:bac1:36e0:1c0::10c:2f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed70a83csm4611330a91.4.2025.10.26.01.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 01:58:51 -0700 (PDT)
Message-ID: <da05d1d1-c241-49af-bed8-7db5e9968396@gmail.com>
Date: Sun, 26 Oct 2025 14:28:46 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/seccomp: fix pointer type mismatch in UPROBE
 test
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, khalid@kernel.org, david.hunter.linux@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20251025184903.154755-2-nirbhay.lkd@gmail.com>
 <aP0-k3vlEEWNUtF8@krava>
Content-Language: en-US
From: Nirbhay Sharma <nirbhay.lkd@gmail.com>
In-Reply-To: <aP0-k3vlEEWNUtF8@krava>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



Hi Jiri,

Thank you for the review and for catching that inaccuracy!

On 10/26/25 2:48 AM, Jiri Olsa wrote:
> just probed_uprobe right?

Yes, you're absolutely correct. Only probed_uprobe has the
__attribute__((nocf_check)) attribute. I apologize for the confusion
in my original commit message. I'll fix this in v2.

> curious what compiler do you see that with?

I am seeing this error with Clang 19.1.2 on Fedora, which enables
-fcf-protection=full by default. As Sam confirmed, the error occurs
specifically when CFI protection is enabled via -fcf-protection. GCC
without this flag treats it as a warning or ignores the nocf_check
attribute entirely.

I'll send v2 with the corrected commit message.

Thanks again for the review!

Best regards,
Nirbhay

