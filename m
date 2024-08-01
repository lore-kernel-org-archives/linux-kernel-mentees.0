Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B724315855B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  1 Aug 2024 06:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722495265; cv=none; b=hBJ7AL/D6uEaIdlUjv8OSTKSDq4mI5VD79nyjoekIQGXborTRfH7rFK4sa8uI8N8dHh3sAhBCwIiFS3GWk2HIS8hexNK5zy/89b5DiUJvLCg4ripEXYO1a4n4Fwuue1lk+qgLhYj3hLS7mfZMvoBcPuDdr1cO9myfTXCtvDO2cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722495265; c=relaxed/simple;
	bh=B2aduLbyl2w0DOqap6opE0ZMrWyZxDEAiEjEX4uiR5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KxX+A5IdMDGPK0/foiWIvrT9ffKHdHPGjfasUDaU6m2l8by5ah21UADFYBcNmlL7E3srpJNm7SLXtrL9T8gi+5onkBznqNJkbRlfZc0X3XF/6He7m+EajeZ8CslbzxhVFW7aj1M1l0meI6HgaMr4R7w2W1P+XBpHTN8YVkfEe44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=g7kYYXh0; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="g7kYYXh0"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3830F4070B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  1 Aug 2024 06:54:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dIxpyzg5zEg4 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Aug 2024 06:54:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=oneukum@suse.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C75540120
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C75540120
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=g7kYYXh0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0C75540120
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  1 Aug 2024 06:54:22 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-59589a9be92so9728628a12.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 23:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722495260; x=1723100060; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=REx9tnLqztn/PqERh1PtnQ3iEqlwlxeIi55PMWMtu0k=;
        b=g7kYYXh0j5v+9o10OKoZMBdHt+gXVQydAhCjx1bId+So8pL15Xi4ALDqaHYtDn8lFh
         gMVMvzo2hEVJhKMzlERRF5Sd8ejZrexzWxiaCY+ZjmVCSrkRlt6eF1B0xmM9CT2HNtvx
         drnJg9yX5bh302pNOiUWU5bnZJKDns0ypONF+74UFc9UTZDr92MUppZL9C96ub8Z4PoV
         SBrxu2REtFRvdY+ut+5YmX68owli1Ri3EnlvM/uFacvUWwMVSgtrrE1P28xgMRs2+2u7
         6ZWg7qbyWA/ci47hQJGBpyTbsNlEr21GkEfHeAIIp0GH7snZRIljzG/A1Pfs0iLQ08KR
         eYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722495261; x=1723100061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=REx9tnLqztn/PqERh1PtnQ3iEqlwlxeIi55PMWMtu0k=;
        b=PbRNuK8YhXeUVPahsU6N1sb6qLbZlHBbJNXmCeb0GLfqCGj1xBSh2w74NtZKQyuTbs
         +jNpOpZ28sGLhoPuKI8CMzuN3+TaM+1MDcZtcCxqAVEvU0mg0N5B8pStgWLTKrRv2lHF
         /k5GsHbffFO2peszSFtvO7n2LmGmBn2p5LSdOkGts14/FgGtgV861XgMGBA+UYzyegyU
         BevQ3KNVN5rrjTaaBnG2Ym4QPE3IHFt/Q6/GyUqF+GcJ4vjvxrqGDhaZ+ntqxwDywX9Q
         hqovCSSK3RF4KI8uVwhHolLuEqOiLokSBEN6NHl9kSN68UtmtMXyUXa9aKWh6FM2WmW2
         BhPw==
X-Forwarded-Encrypted: i=1; AJvYcCWHxlFMu4XXlSocTLBiBHbUDuuTj8H6/6Cea+Hja0BQ4m+P2icOXXRFHRcznkZcM7gyrwLyivYhHbKxDjBgmdqhdA0YW4X1JpT7Hiyqt5+s/i2q0O6+EQORTEDFiyy8
X-Gm-Message-State: AOJu0Yw8llV+S68R5Gg/ttm2T/ZA2hLGQEYAfgjJRbJ63Nz2DTBde1M2
	zkXycU1Gp+iZUfIj0gdUx1RkaBztPw/IWErP9s1FBGRtnk0tr8ta+PDJiKymdck=
X-Google-Smtp-Source: AGHT+IEx3GWmyFwZ41U1O+u9nI48xayCAcAUdP+Lr6251MaZzgfsFNonuaQsevOfxfxqTi9mkXxhsw==
X-Received: by 2002:a17:907:724e:b0:a7a:a2e3:3734 with SMTP id a640c23a62f3a-a7daf2d5ca8mr93384466b.28.1722495260167;
        Wed, 31 Jul 2024 23:54:20 -0700 (PDT)
Received: from ?IPV6:2001:a61:137b:5001:be5a:c750:b487:ff1b? ([2001:a61:137b:5001:be5a:c750:b487:ff1b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab53704sm856031766b.86.2024.07.31.23.54.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 23:54:19 -0700 (PDT)
Message-ID: <f5d4711f-9b4a-457c-b68c-c2e9aefbe4a8@suse.com>
Date: Thu, 1 Aug 2024 08:54:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: storage: ene_ub6250: Fix right shift warnings
To: Alan Stern <stern@rowland.harvard.edu>,
 Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: gregkh@linuxfoundation.org, oneukum@suse.com,
 usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org,
 skhan@linuxfoundation.org, dan.carpenter@linaro.org, rbmarliere@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
References: <20240729182348.451436-1-abhishektamboli9@gmail.com>
 <e72cc56a-3066-4cb8-848d-bfe27a48c095@suse.com>
 <ZqkpOQIjcBSAg8rC@embed-PC.myguest.virtualbox.org>
 <5d7870b0-6b63-430b-8885-2509b33dc78a@suse.com>
 <804a6d40-73a4-4af6-944b-95e9324d7429@rowland.harvard.edu>
 <Zqp8vbbIC8E/XrQY@embed-PC.myguest.virtualbox.org>
 <b35a344a-018b-44ae-975a-7767a3d5b6ec@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <b35a344a-018b-44ae-975a-7767a3d5b6ec@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 31.07.24 20:19, Alan Stern wrote:
> On Wed, Jul 31, 2024 at 11:34:45PM +0530, Abhishek Tamboli wrote:
>> On Wed, Jul 31, 2024 at 10:04:33AM -0400, Alan Stern wrote:

Hi,

I should make my reasoning clearer.

>>> Replacing the variable with a constant won't make much difference.  The
>>> compiler will realize that bl_len has a constant value and will generate
>>> appropriate code anyway.  I think just changing the type is a fine fix.

While that is absolutely true, it kind of removes the reason for the patch
in the first place. The code gcc generates is unlikely to be changed.

We are reacting to a warning an automatic tool generates. That is a good thing.
We should have clean code. The question is how we react to such a report.
It just seems to me that if we fix such a warning, the code should really be clean
after that. Just doing the minimum that will make the checker shut up is
no good.

	Regards
		Oliver

