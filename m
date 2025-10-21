Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7EB2D238D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 07:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761033076; cv=none; b=Oz1iXFLuXMnTrntmohezz7mtThnROxWB/nJ3C65aJJAJghU7zL18hj0a6d2ifIJ8956Vgmd6PJh34jMq4diWY7ZZATXpVgPdYWCK7mbo6Dx22Vv8MbuPjH4u/3m6ElvtKBLp8c9vd1tShfdhNqX+yZ15YJ7XZyYZrn/W2fSLh50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761033076; c=relaxed/simple;
	bh=YTsIbx04l5qgIFskYWd59hgzfuTSY/THNv/uSHG8Xqs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qhFXBTNVfMgEvVJdXBklFaWaRE6Q1laAAnEGVpGvtyWCH5FggbF36aPRSgUUjPjXHYl11ZtOc/yRiniMSUjlduovbTDYy6oD7TrMO/bx/mKjbYdZ6TVJcEvDAhUvaRRnlmuHbW+a5OuMxAvUh8Y0hTtqEYPAB5cuuCsa8ZR4Imo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MB9NqVA3; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MB9NqVA3"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1640A8101F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 07:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ptyKzWwa_Epn for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Oct 2025 07:51:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 120A180ECC
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 120A180ECC
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MB9NqVA3
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 120A180ECC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 07:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761033072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1h6fa2qbHoy++SvDQf77xOSpwekaCSKBmi7FZ2f1xQY=;
	b=MB9NqVA3NtTMxiKSUX0nw9j3WNWOlneEhZHGjdL+jEFg4b6lwD+h6+rMSp2nbkOOZ+GWKw
	c/fYuwNSWPIvbHgsbsFLjdehl6KI187aGP4D1+gCX5ObQJbvsJwcH3pQElFX2xEkZIKblP
	9f7gb6JMY3sDQ3tb30LafzaMv5z3u6A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-d1mkx36aPp-t3PImDJV-yQ-1; Tue, 21 Oct 2025 03:51:08 -0400
X-MC-Unique: d1mkx36aPp-t3PImDJV-yQ-1
X-Mimecast-MFC-AGG-ID: d1mkx36aPp-t3PImDJV-yQ_1761033067
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-42705afbf19so2083097f8f.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 00:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761033067; x=1761637867;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1h6fa2qbHoy++SvDQf77xOSpwekaCSKBmi7FZ2f1xQY=;
        b=Ta6ZhrKRnX66y+tt/kMFmoYj3/nDa1eFAcrvDKothpBp57GYuf6XpxI8SEnPY3lTG6
         5C4scM7TjMnjOeSen+kTe+XpFuE/WvbRqxQf3B8vfC7vNSDDS+GNvZAfobySwifYJTcc
         c/PC1su5cu6ABmTzBhnlTp68pgkwt0aycuk89iKtLeGSMQW9Z1pEduxKksxHsMIERyPv
         5krCvteOWo/praOzNiwWm31a8uMRQe3Vukjo0Rou7VYV3CYBlkkKia7SJpnyZCVSuGy5
         6vKOANmjZKPfhUtMrlJlNtez4ErbZjto4hLD2785Kf2oyr07z+fIxEKoP9kWoKA2UHvY
         88wg==
X-Forwarded-Encrypted: i=1; AJvYcCW4cnUsEVfItdIi2GC80XCJyuN4oDXd8fOMTg9fIkVkwL+TphixAoD4sg5LWKoR9e1Rp3u0D9xLio/y6Ah5MjPKoNyqRA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzDx1yl2HIjJiEWgc9QfAC2WJqW9O0PjtmNMPrTB32x1RLj/ZXS
	lvdfO3rs1EaKGXVX4CyhN+mw4Q0ycHd1dkvFfVT7njNTAKyXAP/wIGdp25bpdsi4KJLuA+/Ibq0
	evHOdClutJgKog+vB/pq73XktE5WMYLgXtB9H3+7x7cOxKekosqURuYt2hNFo48op8NLIeqDuRW
	th1p4UFcGwew+crQ==
X-Gm-Gg: ASbGncv1tjDcFpd3UxmwqY/HEk6J3k0Nu3R6YOmRnZqG23X2FjtIr4tQ8YvoMJmlNxd
	TBMY5027eE/h5AuYT8m8+NkK40lmbjNVskpJDlTL83U6Iv2/P4pmD2XDkB+GVTZXzbw0s8sIucn
	hLQrqpvMjJuqkDKvNIR2l1NHrFQJh98TVZRH5Vt+ep+t5JmdxAxnLfrOLUG+o589OhPeQY2SeAU
	y34GCOIgGKHsXn0rjO6tGpG5U4VYCXAEIHwVtitJBdKr2UGQIxbaRwF5gX7EuLPo4nHq5+mM+u7
	jEvmJbaHAQxBz8JV9/rk5VyHyidu5GfB9k2TshDlx0X47+MKfg2IzQUEcV9GGSp7zpUTXtR7V9a
	ioftoCK1z0VqzSXBLuiqQWKRkW6hraucHzNY+tdHkto+0mAWPUlaZzxvihg==
X-Received: by 2002:a5d:64e7:0:b0:3e7:428f:d33 with SMTP id ffacd0b85a97d-42704bc0e86mr14036927f8f.16.1761033067217;
        Tue, 21 Oct 2025 00:51:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHz8/veJYRT8JadPcK7SQ32pn8LgrM+ivv/Y11OS7FOCN/IU1aUPsxB4lxzjs+wdp1rzZtnZQ==
X-Received: by 2002:a5d:64e7:0:b0:3e7:428f:d33 with SMTP id ffacd0b85a97d-42704bc0e86mr14036895f8f.16.1761033066816;
        Tue, 21 Oct 2025 00:51:06 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427e1be5d6csm18888806f8f.0.2025.10.21.00.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 00:51:06 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>, Shuah Khan
 <skhan@linuxfoundation.org>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] drm/solomon: Use kmalloc_array() instead of kmalloc()
In-Reply-To: <8dc12a18-58ee-4df6-a9f3-12d8c05a0954@gmail.com>
References: <20251019145927.167544-1-mehdi.benhadjkhelifa@gmail.com>
 <2541f99c-1081-4253-ae58-97654694cd78@linuxfoundation.org>
 <e4f0290b-5d15-472f-acee-e1e1b0629ec0@gmail.com>
 <3f523293-8a8d-4136-b4bc-4ad0d4a50c59@linuxfoundation.org>
 <8dc12a18-58ee-4df6-a9f3-12d8c05a0954@gmail.com>
Date: Tue, 21 Oct 2025 09:51:05 +0200
Message-ID: <878qh4ae1i.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dkb7L8GE1sHGa_0r8uBHWPICiKKxJYO0CrAvcyos74w_1761033067
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com> writes:

Hello Mehdi,

> On 10/20/25 9:56 PM, Shuah Khan wrote:

[...]

>>> I have a raspberrypi zero 2 wh that i'm using in combination with the 
>>> ssd1306 OLED panel via I2C to test it's rendering and it's working 
>>> properly by using modetest and seeing no regressions or warnings in 
>>> dmesg.
>>>
>> 
>> Send v2 with all these details and why this change is needed
>> in the first place.
>> 
> Okay, I will do that as soon as possible.> When and how does this 
> potential problem trigger? Is this a
>> theoretical or does this happen in this code path and how?
>> Next time include all of these details people understand the
>> problem better.
>> 
> We'll do in the next iteration.Thanks
>

A similar patch was posted by another developer a couple of weeks
ago and is now queued already in the drm-misc-next branch:

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=940dd88c5f5bdb1f3e19873a856a677ebada63a9

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

