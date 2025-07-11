Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2047F6ADD
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 11 Jul 2025 17:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752253572; cv=none; b=BocGuW1S+n+6jL0QdyUdSS0Cgp7vMZI3inMK5k+4ZvMK5lElKTDTQCjoUL0e7j5nrO2BM+UmRw6kw0nLdjdnEcjl4BP3HWbUAotUSdGtH9TuZkAAiDoyRjxfC7lWXUmukl1HFzdiZJmqeDQ2sEGRzy+JyoFbGqKu6FhATodaWP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752253572; c=relaxed/simple;
	bh=WrvB8GsIeIreYnuKoMq5URVLOHQy+PAHYcyx6LKjwSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LUMkMDSuvJv2U5q/rzhMIQDh/g4PZ0LX0Gw0R6PHuC6747FwPwjUDeAqMbYP9X84PQxoX7gbCeo+KUEkmu00Xl/MuhDOeXBsMhUF8foWtDPkebav2kNeNApMeEebZeMuESJHRAxr6J3bT8piHOCHE7AbMCTBK4FX/X+d3VBwkHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YB57Hksv; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YB57Hksv"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-558f7fda97eso1454158e87.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 11 Jul 2025 10:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752253569; x=1752858369; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PNAWGrPiwj3E1EhTq5Tl1CO6rinMEagBkU9r1o4zi7U=;
        b=YB57HksvtSy+q4IaCE7rmX5GlqE9HsfJ1fTveDGGXQn2s1lT5Oi9IYvjHtMJrjBfvq
         bEaUszhvaQi4mYJsI4tl8QqaSDyvs4I1K0Aw/RbZlF5nSZt8VQP5G4Ux1qDM5XG/m0/c
         OvmPcu5eZT8btS/xHxjY9WOXRnZ/nhKgN33qpVbWxVcfG241wCRCDXw8SzEVJgMa3fS3
         jA46CYjxYUqUQiyVRvXb1Tk7WFip7yjYSOFRRzp4/E2zUwBfVIo8rfaDWOW3FzzZGEzH
         rDinr++pKpdXeQo7s+W0kwPU5hKH1Qz/JrJGxBfc0ioRINAQzBnZ0JXhGMucn3Cj7/4n
         1oYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752253569; x=1752858369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PNAWGrPiwj3E1EhTq5Tl1CO6rinMEagBkU9r1o4zi7U=;
        b=YgHVqOZAycwQrdvSUj+xoIFsvw8OGAhG+hBTpw2fwe+StCeK0jw+z5hyBM2zQSEl24
         hEOFKmS/jPdUitcNMxH1wgb4f8CCir8xf6NqFmfVBUv8unCW7XlG1bPbaiFv90GHpzTO
         SSiC11wq7oJBvnoO77noTvVwZQa1Z0/UIVNfiWDi4TUM5soWaPOSoIXP/1q7ad93dZsN
         mKEqEG9gIExNWDGHXSTQy7Y+2lAToIzg6kLYYxR2aL6hZvNzvw5ZlYkTzU7A171v/BTE
         BavWvdJswZxUulBhMIAdHgNNWsDF2SHYPirwe7EKjneFUdFckopx7dkPDsRAiF6A2uGm
         TIxw==
X-Forwarded-Encrypted: i=1; AJvYcCXG9shR4ysC8pmkeEqwPx3d/4Chox2jYAISk9adU4oA4q6qClPkjN66krB2Guk6CzTIrODYysEnGujDs+cL0YwpA1C08Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzShYN1/D4+c4dJi+HoeESGZExoMTvsxlOG0aAXKgWgKl6B7xaP
	N9VS5HoAEVuQN5k+Q4LkhwBHLg7HjOTqier5gypjUKWfw0IvKosPw/lu
X-Gm-Gg: ASbGncubrhUMc8N6XuoVH9jRBVdnwKfazCdif9TSZe6nWMe/rmSHRnIRLhdhkXhLsuI
	by3k1GVOhiPvI6KGF71+Vqq7Bs+s1DXqT6ysdi5kJTFHjp7SWTv9yJT3PxN8YbocvzVuemXon3/
	1gMh3+/9tzjJRxHczL3qC8yP+cSpI5TQFRpTlzALmYJ8dD35DvDX2v6fp/wC3EWbj87L5QeYZQF
	Q1fVMOfeCh29ipdi8qn8Y03BinsQCjtCoTDzb0NOLiHwu+xbfAhzAuAirTR+UlhmF0k7OO3NxP8
	rtyPlt6rEgsm1ICxrR4O663yx9jKUkMwWaaWDEOzAPaAdDu6V2zhgHi0Nj2ZA9eP/QaffSVX+Lx
	MsjyozuGH/jwdKTQ8nN4w10eMskZqDoEwmnO+DU0TEizHX3mjsoSVEgL5p0ePBgtE40EexFCpQ1
	E43JgTXSsdZq+uYoXuT5oNN6wWsJiUfJXLxPl+zd8AgPIoOT/LRDqDysJfQGYJcw==
X-Google-Smtp-Source: AGHT+IGXo0leNEZOdpcDo5mboEAsYRR7bsRSf0EC+JdFXlc+xOggVj+ftQvTd/RTlrxgZhW5tHX3RQ==
X-Received: by 2002:a05:6512:ea1:b0:553:2c58:f973 with SMTP id 2adb3069b0e04-55a046733b8mr1503974e87.52.1752253568879;
        Fri, 11 Jul 2025 10:06:08 -0700 (PDT)
Received: from ?IPV6:2001:14ba:6e:3100:ed74:9560:782d:a190? (2001-14ba-6e-3100-ed74-9560-782d-a190.rev.dnainternet.fi. [2001:14ba:6e:3100:ed74:9560:782d:a190])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c9d0f2asm1009210e87.131.2025.07.11.10.05.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 10:05:55 -0700 (PDT)
Message-ID: <6b872eb0-22ca-408e-9c4e-8f094c3580ae@gmail.com>
Date: Fri, 11 Jul 2025 20:05:51 +0300
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: Documentation: Improve grammar in DVB API
To: Brigham Campbell <me@brighamcampbell.com>,
 David Hunter <david.hunter.linux@gmail.com>, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
References: <20250708155206.91281-1-hannelotta@gmail.com>
 <680b91c0-0fae-4230-9fa1-da988cb82e65@gmail.com>
 <DB8S4WLTG1SS.NVODTL6KNFXF@brighamcampbell.com>
Content-Language: en-US
From: =?UTF-8?B?SGFubmUtTG90dGEgTcOkZW5ww6TDpA==?= <hannelotta@gmail.com>
In-Reply-To: <DB8S4WLTG1SS.NVODTL6KNFXF@brighamcampbell.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

On 7/11/25 2:55 AM, Brigham Campbell wrote:
> On Wed Jul 9, 2025 at 10:22 PM MDT, David Hunter wrote:
>> On 7/8/25 11:52, Hanne-Lotta Mäenpää wrote:
>>> Fix typos and punctuation and improve grammar in documentation.
>>>
>>> Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
>>
>> Overall, good work. Here is a suggestion for future patch series:
>>
>> Subsequent versions of patch series should be posted as replies in the same thread. Currently, each version is its own independent thread, which makes it hard to track changes. This link has the documentation for the proper way to handle subsequent patches:
>>
>> https://www.kernel.org/pub/software/scm/git/docs/SubmittingPatches.html
>>
>> The relevant part starts at "To that end, send them as replies to either..."
> 
> This documentation you've linked is specific to git, not the linux
> kernel.
> 
> The kernel documentation argues against doing what you suggest [1]: "for
> a multi-patch series, it is generally best to avoid using In-Reply-To:
> to link to older versions of the series. This way multiple versions of
> the patch don’t become an unmanageable forest of references in email
> clients."
> 
> [1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> 

Right, that clears it up. On a closer look, the URL indicates which 
documentation is for git development.

> 
> Nice work, as usual, Hanne-Lotta.
> 
> Brigham
> 

I really appreciate this comment. Thank you for your encouragement!

Best regards,

Hanne-Lotta Mäenpää

