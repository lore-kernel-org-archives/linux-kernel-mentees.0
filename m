Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FE42F3E
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 10 Jul 2025 04:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752121329; cv=none; b=nUo8FuKvCTHSjFqEyqQ4HPY94rYmdi1du4SDxJbxuc2s51Xqu82mnsMwQbTdZsUONce7Us21DvPxAEdSR5omk/FpFWzgUCEZwsNWrQfzputCVIKoa9/rTHDYdG1+Q5Jbfh97Lnxw2EAKIlGa0MEEDzW4lCXwUe9GKxIF+xJ3p6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752121329; c=relaxed/simple;
	bh=zpk9bRN0L2uWmTh6P1V8dthV4qxXL3T4kvyeb5/URIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sXWgMLiu1kgUQFo/1Kg9YUxroyYLldZ8DmgInusIA4P4LgMohKufvsEB1FaNu+cJQvS+Dg1dysQzfWQfxcNfVbRqYiJeq6EgbIWHOKCkuuDAfpp2X3XY+pftr6bGID2arKWBbLLzUaTYjDs5vkcq0TGPvJ5BbkBXoQ15LSG8p9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2W5kHY2; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2W5kHY2"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e73e9e18556so635702276.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 09 Jul 2025 21:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752121327; x=1752726127; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fX1F7Z4PAEFtJGiOe09XclubaX8vKVCrpTd1hRg1Eik=;
        b=F2W5kHY2P94zmf7h75l/aEaASaR00Qiz6Ru/UeXnExPluMXAIarpIUGGBfHIbJU2TR
         LZEvbqjSqkKEIsR8p8Xjvu/zA7QXfAuky2E1zSiakBWCYeiRMnAa66PkrwtdnlAArrom
         yBTkIQHip70xz81lW02SrNSLVJWIpo7ntpWNHownYgEAlmP1+3UxDlDjkgYvBnAhnh03
         Nv2FRb8Ow75XiNgaJYxYgB7+IS388KfNR4q/B/lGHcBKLrv9VVNac1Ho7s0idNt4cIp4
         ITJXs6Jiz3jhKbkIlL2TXiHBtQu0sty2xy3fQmtA9WccQEobiTE/9z0lKwIJpfLTGK5M
         Ug3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752121327; x=1752726127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fX1F7Z4PAEFtJGiOe09XclubaX8vKVCrpTd1hRg1Eik=;
        b=v55NxRB+3t6Rhnq4QWmNy8Wy539OATr1+1avZttRkB+81W8W33U07941E1ARK+gbnC
         IjmNZY+509K9BZTe8yhr/b3J4JXt/h1hlCLPA4a4cqRKhRn06Z2kcRZ9mc+RoQgRRBzk
         8DMlaxKX5cmBo7sAeHBFn7Tad/Qsbmt2zdMYwpYHpOwmf5ixYmJoUgtslUPn4plfcXpl
         CR11e131Pixh6M+xkEyio9AuxJYGwJE4YhFmIpS3zWpOX7JtwkGEZK7vb8CklY4Z4rdc
         Bzr3b+FN8z3o77SoYRecjndRwQ2VyjxPQs13FoQPb0bgS5CgHVfBZ8sm6vZzyxePuMQz
         QK8w==
X-Forwarded-Encrypted: i=1; AJvYcCWDma3mDHAUSODbD3zfioPjH9LSaUJu9a36CiuSOAH9F/u32UHKcK2EVbQfbbHGEBlIeujxl6RV5nfh6mToYGQPmNOqVw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWdX2vesPJuObiJzU/Ci/A3U+x7TMhB7Xd+OZhf9aSRl/UXI4i
	omf5mquzpjsJR/tFN8thjBhMd9HPniergbgG/NEMip/Xj4AFMMGs3IGB
X-Gm-Gg: ASbGncsiRF13VTUgsol89lljhq7pAuGaGkOqT+ksA6F0InjC6DGI3vtO/FZHuamnXPe
	I0gfJkVtuJ9gla4PIQmOB06wPtSlyzfXysdtdq8V4w3o32Opcqr4hFd5SeR7Tp9wKh0L0+p5CwE
	/zDtvFokdQdfCk0LBNHW1G9Tpkg/J4G4EOaDKXOSY+XGvbVOAvWoHBUSSCI+rAy0csWGB5W4Zq4
	v8nZDMxOeUo/1OjLj9BOQwaKhqzS31XUyrNphK/Q2Lf49dSihiUoWQDkOMcMZdF2zyTlhyDEKKk
	VlfR+YiPYmfHx4mGAL2On4qkgKi+eR637vGGW2JhdcLc6X9x86PRoeII0tRP+9VElq4ZK/tXZBu
	d2Ev4
X-Google-Smtp-Source: AGHT+IHVGlZCAdSiwwxIIDU0/vbdwHIDdUcAS82VRxXOOKEokRZbUd46s+cUagR8D6kkBJpJNSMyEA==
X-Received: by 2002:a05:690c:c1d:b0:70e:4d8:5cab with SMTP id 00721157ae682-717c149b229mr33047897b3.2.1752121326994;
        Wed, 09 Jul 2025 21:22:06 -0700 (PDT)
Received: from [192.168.201.155] ([76.200.76.117])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-717c61b4cc4sm1270447b3.67.2025.07.09.21.22.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 21:22:06 -0700 (PDT)
Message-ID: <680b91c0-0fae-4230-9fa1-da988cb82e65@gmail.com>
Date: Thu, 10 Jul 2025 00:22:02 -0400
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: Documentation: Improve grammar in DVB API
To: =?UTF-8?B?SGFubmUtTG90dGEgTcOkZW5ww6TDpA==?= <hannelotta@gmail.com>,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
References: <20250708155206.91281-1-hannelotta@gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <20250708155206.91281-1-hannelotta@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/8/25 11:52, Hanne-Lotta Mäenpää wrote:
> Fix typos and punctuation and improve grammar in documentation.
> 
> Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>

Overall, good work. Here is a suggestion for future patch series:

Subsequent versions of patch series should be posted as replies in the same thread. Currently, each version is its own independent thread, which makes it hard to track changes. This link has the documentation for the proper way to handle subsequent patches:

https://www.kernel.org/pub/software/scm/git/docs/SubmittingPatches.html

The relevant part starts at "To that end, send them as replies to either..."

Another good practice is to have the previous versions' links from "lore.kernel.org" directly in the change log. 

Thanks, 
David Hunter
