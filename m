Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84019C2E0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  4 Oct 2025 04:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759551932; cv=none; b=IKFOiQ1gYWXc9EE2xrTLiHFYQ4+P39ou8KxPsgs9N89WR5OKGhcM5MBve5tUfUQxtV7Ngc8DvdW4rSA7V4jG/78emzgbdKkVvAVf6eL2+zYD+FfArdKRg6cCHnxG7f0JJYDUiNTFVNlUNAy3LufcVlJMg+UwRL7widKfbfmoYoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759551932; c=relaxed/simple;
	bh=fiW27OmyjIXRkHL2pKrvpjBTPjkKsM5SbUHrCosesFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oKphgW6QJZwpa2rSEZ7AZ7BBlQzsDNXXAvWF4M8/dNoGY9f69it8anYC/tXOIlyFwbeO+wjzV0BG5qZT0f8tDR70kOLQpd5SZDKY9iJR9HEK24sPEXXJhrGQ9iq04q8P1svROQuiVlHHNUuoj8FEXQHyl8IZ+d9lbfg1xcmFC1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lja1POTO; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lja1POTO"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2136983CFF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  4 Oct 2025 04:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GX6ZO3se-DNP for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  4 Oct 2025 04:25:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7999183CEE
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7999183CEE
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Lja1POTO
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7999183CEE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  4 Oct 2025 04:25:30 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3369dcfef12so3520305a91.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 03 Oct 2025 21:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759551928; x=1760156728; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WBv4tgqW+U6sIw33UNpfqYOK3QxRW+OpJ8XW1KRAlQQ=;
        b=Lja1POTOLBOgHTmZUxJeKnKF6Hi20TlWujU3Cu1Ufc+/1OlcZURRj5vzHCmMimmL7I
         mwj63ufB+HQ9FghI4BOWus5/rciH3IpvEbX2RdLdunTOtpxENHWJ/w+NHsZO9JvSDRWE
         OzwzF6wrXBQa7RYtX8315yTM78T95pVc2xps3l/XZvP+ibR1lP9lqdjqLpi7ljLCdHU0
         YcF5AazZ6Wg1BVOA2S+8RVY8ObuRod6sTPD1SicJuKofbk955JAy0TV+vMjsrF8hEmG3
         +/jzbrtkN0HEdSD4p+HXC+FcZL7KHld9HEI6b/BbOptDSnEnN6yA4LPJ4t7KE3mTuOWv
         8yiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759551928; x=1760156728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WBv4tgqW+U6sIw33UNpfqYOK3QxRW+OpJ8XW1KRAlQQ=;
        b=J990F2b0YDJ69o5IFQ0TW9GuXmMpJ9LWbvyaVKyYCEYm199R9Yr5ZXndJ0cCjEVzNh
         KA0ISUAsHWMtCg8P/DZAxhYlKkwfvHVQv9pZ0tAd5w6ksS3gDN2LQ+h+SPKlf68Ui/x7
         ahjDxgTNDWs5UY9j9mpUXJyXDD88Gs2OUZAJihXHWbMf99Z0hZTcXR7F/tQ2qb/L51p9
         0gjJzHHBiivKvfLmaTUbnncf7oM+RI7Y8FbwDKbak6yamNyY9Bj96PRMuVYvJ9EmuCwM
         Vp+3ibs6EoeQAXXNdQH1nHKvJCJjOHqg0ETB0enPrGmgzKeLCsK4np6OfF7w6dTzeGIK
         AmfA==
X-Forwarded-Encrypted: i=1; AJvYcCU5emNTQX1kAXhL+olN3rdpefVlWMpr2rlwIE+b8LrI2NEcCR2N2TrGdmum2Azl7cIXieYjbCxiPZheh3AkVKabV2OnKA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw/v0RdeBBbshBiEHEtBqxsXZV9IqQkaRKkANzvuLNqzOR4TPKL
	zjrmtjW3SneGQE9BgJ/QjcENTrQgq4+jwvbsY/rG7i/z9geB27Sz9sPH
X-Gm-Gg: ASbGncvy0bRYChPRewH1lOnUxfN3J000Lze9IQW8n3dkhIHjCs9LKA92AbdmRgBZC7B
	97NgvBNDoLcH7p4mIT+s3AVwOowUie44cnN4H9Ta3KoAUT+uXD0Rfz31vG97j51RuPHS38jPPqw
	uQeijMa4JloC4u7Il6RZLk47FSu+wyHAED3aVqA6TW8/1FGDa2RXXwYh72gPW58N6TlNqVhHhaQ
	kxpXldg3/8ogQBouVPSU7l7nqreq1/zqrWcROD/jxuOLic3YPLKMoE8+ih+SvRn/fCxF4ngvRem
	qNdd7A5FLaPmG0uumjGuZucLqeqaPdmFlWqqPfBFzVe4PIqo4j8Bb/TJti9AclTyJy5BglUmeOI
	Jmjnaum/ieIhI+XfarbnVbYL8x/wa98xfgSjvvGhdZVqYgkKJkb1icStRBhJ+BKX32cVbpL3Gl/
	E0pa5ZfQ==
X-Google-Smtp-Source: AGHT+IHZtUWxu6C3/1n0fAV2c9/VFRgP9VtSw4rwL9TRjMSv+Tk0bAkfADJ5CZZPdPXjkRgVgcjvVQ==
X-Received: by 2002:a17:90b:1d06:b0:329:d8d2:3602 with SMTP id 98e67ed59e1d1-339c27a2b9fmr7016159a91.17.1759551927689;
        Fri, 03 Oct 2025 21:25:27 -0700 (PDT)
Received: from [10.0.2.15] ([157.50.90.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339c4a19fe4sm3825555a91.8.2025.10.03.21.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 21:25:27 -0700 (PDT)
Message-ID: <1c6cceec-da16-4867-88e0-c629accbb35c@gmail.com>
Date: Sat, 4 Oct 2025 09:55:22 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: Use kmalloc_array to prevent overflow of dynamic
 size calculation
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 Don Brace <don.brace@microchip.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>, storagedev@microchip.com
Cc: linux-scsi@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com
References: <20251001113935.52596-1-bhanuseshukumar@gmail.com>
 <7761904f64c554821e71e30b205e092fc2f8478e.camel@HansenPartnership.com>
Content-Language: en-US
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
In-Reply-To: <7761904f64c554821e71e30b205e092fc2f8478e.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/10/25 20:23, James Bottomley wrote:
> On Wed, 2025-10-01 at 17:09 +0530, Bhanu Seshu Kumar Valluri wrote:
>> Use kmalloc_array to avoid potential overflow during dynamic size
>> calculation inside kmalloc.
> 
> This description isn't correct.
> 
> Given this check
> 
>>  
>> -	host_memory_descriptor->host_chunk_virt_address =
>> kmalloc(sg_count * sizeof(void *), GFP_KERNEL);
> 
> How is it possible that this allocation could ever overflow?
> 
> If you want to change the description to say using kmalloc_array is
> better practice or something (and the maintainer concurs) that's fine,
> but we can't have a false justification in the kernel git log.
> 
> Regards,
> 
> James
> 
Hi,

Thank you for your helpful comment. 
I will await till maintainer confirms if it is ok to push this change as v2 with
subject line similar what you have suggested.

Regards,
Bhanu Seshu Kumar Valluri
