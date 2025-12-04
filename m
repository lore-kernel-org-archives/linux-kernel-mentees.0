Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED121465B4
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  4 Dec 2025 01:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764810106; cv=none; b=mZHXRboqKpWwuDAQ4Hj3rl+ScAJmF2N1WiYbskb29WIMJyG4aIqTioaHVKzyg4D1kuW8qygj60ZyGzb40SSpGl2W7W7fFA/AK9ArqB3rZb7fLoSVZeezAQJ2bqRLZQm1H4FQf3aesT2tZwviZwxRDADAyLMp9sQKIlJSsdaDjrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764810106; c=relaxed/simple;
	bh=MLG+4TD667sksnR+VjBrwaFU2UE/zAZE0BYyenvlTcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IYmCuQszwmYRZBWAyrscYAAAyEqojauQ+pybcKxSIPe9aAADMk7Hn3wgKzWV1rQv15OM7I4vhXsZPeZYu6dXinMVxIMRQBe/4olPcmwmW1rBqVsoHR405zxCbu48E8bENqh4BlzAumQd7YX54XKViZOZveYSRfG/nMU6HCQ+J50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NrZRSNPp; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrZRSNPp"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-559934e34bcso115124e0c.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 03 Dec 2025 17:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764810104; x=1765414904; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X/jpmwvefl1mqvp+uOSfl3BlWJkpSeUUghpaaV/zL/s=;
        b=NrZRSNPpcxFfF1D8TKKnzXqrg7t+IGL9gVT12dwOcXg6P3InlCFo3KljFaeaulfr/c
         XBbRf2t5Rz5Ft1oF5FovzqO44RoyS7UzIPDK5nuWRdisgrBSWaZ65iPl6AAJ4XhGNDfN
         10emavRKCPeT7TQogsnvtcmeUMnEAGaQFWmV2CNRlBD9sJoAqOBm0mj9Wd9KHFWPLdAM
         iYb8/4qE+6HiBl/CdEMCdo6cNo2MBilWGTni1Vg88zy7Z+b1vRalP90YpOPkqJKp00UY
         2qD0DrxFeSWKhxC9Oa+n4F6voF/5gghktKj3DY43Ood3UJ+tlO9dbt9EEXeWW36hMt9l
         kmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764810104; x=1765414904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/jpmwvefl1mqvp+uOSfl3BlWJkpSeUUghpaaV/zL/s=;
        b=Gzp1FoYGnP8EZ4R1AOihk9AgrchpDcE/jZjPBaWe4hkheJcKNrD0X8HL19mANsDJPw
         IY/GWTMmQrGc6JnDYfQferJHcbZ2tx44PGEh5Vz0/Q12L9vQKYyDwbZq1e/SPXw64v4V
         KUpEbshKVFPoehFwkUCWTLdZDvMM4UgznG5FiYcFAxFSXTWgRvcY+Zyl7sPoEZeoGFT1
         7HM1GYEBORC9PDq2MICZGjRD1DdVGkvbyNuGsIQMY2v/fDPeGP7scDNs3JUzNyKsXDjC
         60RFJuiTUB6zILNAiFL/hgEjVuKs2gEdO8b+DZnGjZNNjvGT+oOT3Ca9+Ag7G1mMJ3+N
         Azyg==
X-Forwarded-Encrypted: i=1; AJvYcCX5exLG+KPlywTI241OBZKrkKFSEAiKmunv+a07udZ+orAz0GO12OQhsVghkOq/q0wyyyLriXJxQ7ngPEiZb+MbU8NZSg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxKPMsqEEtd8Gk9rcx+mDxxpyBJnBrm6xBlspsq16r2dccicFi
	aaXcHE8alwwpLRD0deNAZrlUs/EqeI+mEPhwRQLPplsaprHLmCGPqC5c
X-Gm-Gg: ASbGncv4FZYb9GIyEuALVcEbRIF9L0e7F3xhGcnV1XevzUJatEb67gVsDwjbJFSacDy
	iZ8yd2zMBOk5Jyj0ThauC33osIs2OJyIfh4vbcGqVyQNFBGfOqlU9yh4UpVVJuEoAYFXWA1k6H5
	T2LgCEY3IRQ86HRo3f/fKmb2jmqgwPMoHobycGWx5ivLpGlslOUvVi8cPCgdZHpAIaKIaJzXgij
	6+YaHyYksKUT6i+iFAwHPAA4ooypWteXk3RiNxXk6lREwAtDnqAChkw51tKrUpeJOFHAB2olKGw
	CrdmRQfIa6+j+1yarTfuQV+3YENmCJAIxEFfph5IxIwOWy6+KmHQwqDNACQP/MS/LcGkx0QRs4k
	lRb3IFxFxSuwHUki/t7dkir04b5sNhW3L9DM5pX9/rt0sDiymFM6UZXs0F+/N5WzBIn8EwYsmhD
	sVe1aLyR2Ga0V6jCcQqWucllS8B7Iu
X-Google-Smtp-Source: AGHT+IGzPdHmI1kwj4OJtIrF7cAk+/qpDFHxaFmgpkFzZAoaCN1mnQwyIFi805Oul4X2uKICOFi4zw==
X-Received: by 2002:a05:6122:469a:b0:559:eef7:3a1 with SMTP id 71dfb90a1353d-55e69b89f39mr301254e0c.0.1764810103365;
        Wed, 03 Dec 2025 17:01:43 -0800 (PST)
Received: from [172.16.226.146] ([98.254.184.207])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55e6c938d9bsm65562e0c.14.2025.12.03.17.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 17:01:42 -0800 (PST)
Message-ID: <ff80d148-fe2c-4198-8c3d-ae92adb20fe3@gmail.com>
Date: Wed, 3 Dec 2025 20:01:40 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] usb: gadget: dummy_hcd: coding style improvements
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 Alan Stern <stern@rowland.harvard.edu>, Greg KH <gregkh@linuxfoundation.org>
Cc: Clint George <clintbgeorge@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org, khalid@kernel.org
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
 <20251201203715.17768-1-clintbgeorge@gmail.com>
 <2025120200-backslid-endocrine-e64d@gregkh>
 <17845408-4a9c-470d-8949-f4cd0a847615@rowland.harvard.edu>
 <7093160b-3700-4bc7-300e-57f4507dffd2@crashcourse.ca>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <7093160b-3700-4bc7-300e-57f4507dffd2@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/2/25 11:28, Robert P. J. Day wrote:
> On Tue, 2 Dec 2025, Alan Stern wrote:
> 
>> On Tue, Dec 02, 2025 at 06:27:46AM +0100, Greg KH wrote:
>>> On Tue, Dec 02, 2025 at 02:07:09AM +0530, Clint George wrote:
>>>> As part of my LKMP mentorship i have to complete 5 patches as a criteria
>>>> for graduation and thus have focused on working on such
>>>> beginner-friendly patches so that not only do i get the required number
>>>> of patches but also get familiar with the process of kernel
>>>> developement.
>>>
>>> The LKMP internship should be done in drivers/staging/ as generally
>>> coding style cleanups are NOT accepted in other parts of the kernel,
>>> unless you get approval from the maintainer ahead of time.
>>>>>> Does the maintainer of this driver want this to be used for the intern
>>> project?
>>
>> In fact, Clint's changes are small and inoffensive enough, I wouldn't
>> mind having them applied to dummy-hcd.
>>
>> However, Greg is perfectly right that this kind of stylistic update is
>> not something that should be submitted for most parts of the kernel.  It
>> just bulks up the Git history with essentially meaningless cruft, making
>> it all that much harder to see the changes that really matter.  That's
>> part of the reason for the suggestion that interns and beginners should
>> confine their efforts to drivers/staging.
>>
>> Also, remember that trivial changes like this are fine for learning the
>> procedure of submitting kernel patches, but the effects they have on the
>> kernel itself are minimal.  A patch that actually fixes a bug or adds a
>> functional enhancement would be a different story.
> 
>   FWIW, many years ago, I threw together a collection of kernel
> "cleanup" scripts that scanned the kernel source for various possible
> "improvements". Earlier this year, I posted a number of suggestions
> for cleanup work to the kernel janitors mailing, and slapped together
> a wiki page that described some obvious cleanups:
> 
> https://crashcourse.ca/doku/doku.php?id=linux_kernel_cleanup
> 
>   As the first example on that page, look for code that insists on
> manually calculating the length of an array when the appropriate macro
> has been defined in include/linux/array_size.h for years. There's
> still some of that lying around that could be tidied up; for example,
> scan the drivers/ directory (do not make fun of my hacky solutions):
> 
> $ grep -Er "sizeof ?\(?([^\)]+)\)? ?/ ?sizeof ?\(?.*\1.*" drivers
> drivers/hid/bpf/progs/hid_bpf_helpers.h:#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
> drivers/media/common/tveeprom.c:	(i < sizeof(array) / sizeof(char *) ? array[i] : "unknown")
> drivers/net/ethernet/mellanox/mlx4/qp.c:	for (k = MLX4_QP_TABLE_ZONE_RSS + 1; k < sizeof(*bitmap)/sizeof((*bitmap)[0]);
> drivers/net/ethernet/intel/i40e/i40e_adminq.h:	if (!((u32)aq_rc < (sizeof(aq_to_posix) / sizeof((aq_to_posix)[0]))))
> drivers/net/ethernet/intel/iavf/iavf_adminq.h:	if (!((u32)aq_rc < (sizeof(aq_to_posix) / sizeof((aq_to_posix)[0]))))
> drivers/gpu/drm/xe/xe_guc_hxg_helpers.h:#define hxg_sizeof(T)	(sizeof(T) / sizeof(u32) + BUILD_BUG_ON_ZERO(sizeof(T) % sizeof(u32)))
> drivers/gpu/drm/nouveau/nvif/fifo.c:	a->m.count = sizeof(a->v) / sizeof(a->v.runlists);
> drivers/gpu/drm/amd/display/dc/mpc/dcn30/dcn30_mpc.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
> drivers/gpu/drm/amd/display/dc/mpc/dcn20/dcn20_mpc.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
> drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp_cm.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
> drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp_cm.c:	int arr_size = sizeof(dpp_input_csc_matrix)/sizeof(struct dpp_input_csc_matrix);
> drivers/gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c:	int arr_size = sizeof(dpp_input_csc_matrix)/sizeof(struct dpp_input_csc_matrix);
> drivers/gpu/drm/amd/display/dc/dpp/dcn20/dcn20_dpp_cm.c:	int arr_size = sizeof(dpp_input_csc_matrix)/sizeof(struct dpp_input_csc_matrix);
> drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
> drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c:	int arr_size = sizeof(dpp_input_csc_matrix) / sizeof(struct dpp_input_csc_matrix);
> drivers/gpu/drm/amd/display/dc/dce110/dce110_opp_csc_v.c:	int arr_size = sizeof(input_csc_matrix)/sizeof(struct input_csc_matrix);
> drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c:	table_size = sizeof(qp_table_##mode##_##bpc##bpc_##max)/sizeof(*qp_table_##mode##_##bpc##bpc_##max); \
> drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c:	for (k = 0; k < sizeof(wb_arb_params->cli_watermark)/sizeof(wb_arb_params->cli_watermark[0]); k++) {
> drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
> drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
> 
>   There are other ideas on that wiki page for someone who wanted
> something simple to start with that aren't just aesthetic, they
> would actually improve the quality and readability of the code.
> 
> rday


Hey Rday,

Wow, this is interesting. I did something similar when I was a mentee in
the LKMP. I am a co-mentor now for the program. Would you say that
maintainers regard the patches that would come from fixing these style
issues as fundamentally different than the ones Clint attempted to fix?

Also, are your scripts open for anyone to use, including future mentees?

Greg, if mentees fixed the ones that Rday's script cause, would you
still prefer that those be confined to mainly drivers/staging?

Thanks,
David Hunter

